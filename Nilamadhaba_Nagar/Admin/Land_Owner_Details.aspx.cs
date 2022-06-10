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

public partial class Admin_Land_Owner_Details : System.Web.UI.Page
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
    public void cleartxt()
    {
        txtName.Text = "";
        txtEmail.Text = "";
        txtcontact.Text = "";
        txtcurrentads.Text = "";
        txtpermanentads.Text = "";
        txtlandloc.Text = "";

    }
    public void showDetails()
    {
        DAL common = new DAL();
        Hashtable hashtable = new Hashtable();
        hashtable.Add("@Type", "Fetch");
        DataSet ds = DAL.GetDataSet("Sp_Land_Owner_Details_Master", hashtable);
        if (ds.Tables[0].Rows.Count > 0)
        {
            grdDetail.DataSource = ds.Tables[0];
            grdDetail.DataBind();

        }
        else
        {
            grdDetail.DataSource = null;
            grdDetail.DataBind();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (btnSubmit.Text == "Submit")
        {
            ht.Clear();
            ht.Add("@Type", "Ins");

            ht.Add("@Land_Owner_Name", txtName.Text.Trim());
            ht.Add("@Land_Owner_Email_Id", txtEmail.Text.Trim());
            ht.Add("@Land_Owner_Contact_No", Convert.ToInt64(txtcontact.Text.Trim()));
            ht.Add("@Land_Owner_Current_Details", txtcurrentads.Text.Trim());
            ht.Add("@Land_Owner_Permanent_Details", txtpermanentads.Text.Trim());
            ht.Add("@Land_Location", txtlandloc.Text.Trim());
            string id = DAL.ExecuteScalar("Sp_Land_Owner_Details_Master", ht);
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
            ht.Add("@Type", "upd");
            ht.Add("@Land_Owner_Id", Convert.ToInt32(ViewState["Land_Owner_Id"].ToString()));
            ht.Add("@Land_Owner_Name", txtName.Text.Trim());
            ht.Add("@Land_Owner_Email_Id", txtEmail.Text.Trim());
            ht.Add("@Land_Owner_Contact_No", Convert.ToInt64(txtcontact.Text.Trim()));
            ht.Add("@Land_Owner_Current_Details", txtcurrentads.Text.Trim());
            ht.Add("@Land_Owner_Permanent_Details", txtpermanentads.Text.Trim());
            ht.Add("@Land_Location", txtlandloc.Text.Trim());
            string id = DAL.ExecuteScalar("Sp_Land_Owner_Details_Master", ht);
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
    public string fetchData()
    {
        try
        {


            var userQuery = "select * from Land_Owner_Details_Master where Land_Owner_Id='" + ViewState["Land_Owner_Id"].ToString() + "'";
            var dataTable = DAL.GetDataTable(userQuery);
            if (dataTable.Rows.Count > 0)
            {

                txtName.Text = dataTable.Rows[0]["Land_Owner_Name"].ToString();
                txtEmail.Text = dataTable.Rows[0]["Land_Owner_Email_Id"].ToString();
                txtcontact.Text = dataTable.Rows[0]["Land_Owner_Contact_No"].ToString();
                txtcurrentads.Text = dataTable.Rows[0]["Land_Owner_Current_Details"].ToString();
                txtpermanentads.Text = dataTable.Rows[0]["Land_Owner_Permanent_Details"].ToString();
                txtlandloc.Text = dataTable.Rows[0]["Land_Location"].ToString();

                return "get";
            }
            else
            {
                return "notGet";
            }
        }
        catch (Exception)
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

    protected void grdDetail_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "UpdateN")
        {
            ViewState["Land_Owner_Id"] = e.CommandArgument.ToString();
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
            ht.Add("@Type", "dlt");
            ht.Add("@Land_Owner_Id", Convert.ToInt32(e.CommandArgument.ToString()));
            DAL.ExecuteScalar("Sp_Land_Owner_Details_Master", ht);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script type='text/javascript'>alert('Deleted successfull')</script>");
            showDetails();

        }
    }

    protected void grdDetail_DataBound(object sender, EventArgs e)
    {

    }

    protected void grdDetail_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void grdDetail_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }



}