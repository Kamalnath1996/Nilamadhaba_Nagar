using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;
using System.Collections;

public partial class Admin_Customer_Detailss : System.Web.UI.Page
{
    DAL dal = new DAL();
    private Hashtable ht = new Hashtable();
    private DataTable dt = new DataTable();
    Validation vv = new Validation();

    public static string id = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            showDetails();
            cleartxt();
        }

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        if (btnSubmit.Text == "Submit")
        {
            ht.Clear();
            ht.Add("@Type", "Ins");

            ht.Add("@Customer_Name", txtName.Text.Trim());
            ht.Add("@Email_Id", txtemail.Text.Trim());
            ht.Add("@Contact_No", Convert.ToInt64(txtContactNo.Text.Trim()));
            ht.Add("@Current_Address", txtcurntads.Text.Trim());
            ht.Add("@Permanent_Address", txtprmntads.Text.Trim());
            ht.Add("@Fathers_Name", txtfathernm.Text.Trim());
            ht.Add("@Mothers_Name", txtmothernm.Text.Trim());
            ht.Add("@Land_Area", txtlandarea.Text.Trim());
            string id = DAL.ExecuteScalar("Sp_Customer_Details_Master", ht);
            if (!string.IsNullOrEmpty(id))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script type='text/javascript'>alert('User created Successfully')</script>");
                cleartxt();
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script type='text/javascript'>alert('User creation unsuccessful')</script>");
            }
            showDetails();
            cleartxt();

        }
        else
        {
            ht.Clear();
            ht.Add("@Type", "update");
            ht.Add("@SL_No", Convert.ToInt32(ViewState["SL_No"].ToString()));
            ht.Add("@Customer_Name", txtName.Text.Trim());
            ht.Add("@Email_Id", txtemail.Text.Trim());
            ht.Add("@Contact_No", Convert.ToInt64(txtContactNo.Text.Trim()));
            ht.Add("@Current_Address", txtcurntads.Text.Trim());
            ht.Add("@Permanent_Address", txtprmntads.Text.Trim());
            ht.Add("@Fathers_Name", txtfathernm.Text.Trim());
            ht.Add("@Mothers_Name", txtmothernm.Text.Trim());
            ht.Add("@Land_Area", txtlandarea.Text.Trim());
            string id = DAL.ExecuteScalar("Sp_Customer_Details_Master", ht);
            if (!string.IsNullOrEmpty(id))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script type='text/javascript'>alert('User updated Successfully')</script>");

            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script type='text/javascript'>alert('User updated unsuccessful')</script>");
            }
            showDetails();
            cleartxt();
        }
    }
    public void cleartxt()
    {
        txtName.Text = "";
        txtContactNo.Text = "";
        txtcurntads.Text = "";
        txtprmntads.Text = "";
        txtemail.Text = "";
        txtfathernm.Text = "";
        txtmothernm.Text = "";
        txtlandarea.Text = "";
    }
    public void showDetails()
    {
        DAL common = new DAL();
        Hashtable hashtable = new Hashtable();
        hashtable.Add("@Type", "Fetch");
        DataSet ds = DAL.GetDataSet("Sp_Customer_Details_Master", hashtable);
        if (ds.Tables[0].Rows.Count > 0)
        {
            grdDetails.DataSource = ds.Tables[0];
            grdDetails.DataBind();

        }
        else
        {
            grdDetails.DataSource = null;
            grdDetails.DataBind();
        }
    }
    public string fetchData()
    {
        try
        {


            var userQuery = "select * from Customer_Details_Master where SL_No='" + ViewState["SL_No"].ToString() + "'";
            var dataTable = DAL.GetDataTable(userQuery);
            if (dataTable.Rows.Count > 0)
            {

                txtName.Text = dataTable.Rows[0]["Customer_Name"].ToString();
                txtemail.Text = dataTable.Rows[0]["Email_Id"].ToString();
                txtContactNo.Text = dataTable.Rows[0]["Contact_No"].ToString();
                txtcurntads.Text = dataTable.Rows[0]["Current_Address"].ToString();
                txtprmntads.Text = dataTable.Rows[0]["Permanent_Address"].ToString();
                txtfathernm.Text = dataTable.Rows[0]["Fathers_Name"].ToString();
                txtmothernm.Text = dataTable.Rows[0]["Mothers_Name"].ToString();
                txtlandarea.Text = dataTable.Rows[0]["Land_Area"].ToString();


                return "get";


            }
            else
            {
                return "notGet";
            }
        }
        catch (Exception ex)
        {
            throw;

        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        cleartxt();
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {

    }

    protected void grdDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "UpdateN")
        {
            ViewState["SL_No"] = e.CommandArgument.ToString();
            if (fetchData() == "get")
            {
                btnSubmit.Text = "Update";
            }
            else
            {
                btnSubmit.Text = "Submit";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script type='text/javascript'>alert('Something went worong..')</script>");
            }
        }


        if (e.CommandName == "DeleteN")
        {
            ht.Clear();
            ht.Add("@Type", "Dlt");
            ht.Add("@SL_No", Convert.ToInt32(e.CommandArgument.ToString()));
            DAL.ExecuteScalar("Sp_Customer_Details_Master", ht);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script type='text/javascript'>alert('Deleted successfull')</script>");
            showDetails();

        }
    }

    protected void grdDetails_DataBound(object sender, EventArgs e)
    {

    }

    protected void grdDetails_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void grdDetails_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
}