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

public partial class Master_Pages_Plot_Location_Master : System.Web.UI.Page
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
        }

    }

    public void showDetails()
    {
        DAL common = new DAL();
        Hashtable hashtable = new Hashtable();
        hashtable.Add("@Type", "fetch");
        DataSet ds = DAL.GetDataSet("Sp_Plot_Location_Master", hashtable);
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

            var userQuery = "select * from Plot_Location_Master where id='" + ViewState["id"].ToString() + "'";
            var dataTable = DAL.GetDataTable(userQuery);
            if (dataTable.Rows.Count > 0)
            {

                txtplotLoc.Text = dataTable.Rows[0]["Plot_Location"].ToString();

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
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (btnSubmit.Text == "Submit")
        {
            ht.Clear();
            ht.Add("@Type", "Ins");

            ht.Add("@Plot_Location", txtplotLoc.Text.Trim());

            string id = DAL.ExecuteScalar("Sp_Plot_Location_Master", ht);
            if (!string.IsNullOrEmpty(id))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script type='text/javascript'>alert('User created Successfully')</script>");
                txtplotLoc.Text = "";
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script type='text/javascript'>alert('User creation unsuccessful')</script>");
                txtplotLoc.Text = "";
            }
            showDetails();
            cleartxt();
        }
        else
        {
            ht.Clear();
            ht.Add("@Type", "upd");
            ht.Add("@id", Convert.ToInt32(ViewState["id"].ToString()));
            ht.Add("@Plot_Location", txtplotLoc.Text.Trim());

            string id = DAL.ExecuteScalar("Sp_Plot_Location_Master", ht);
            if (!string.IsNullOrEmpty(id))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script type='text/javascript'>alert('User updated unsuccessfully')</script>");

            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script type='text/javascript'>alert('User updated successful')</script>");
            }
            showDetails();
            cleartxt();
        }
    }
    public void cleartxt()
    {
        txtplotLoc.Text = "";
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {

    }

    protected void grdDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "UpdateN")
        {
            ViewState["id"] = e.CommandArgument.ToString();
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
            ht.Add("@id", Convert.ToInt32(e.CommandArgument.ToString()));
            DAL.ExecuteScalar("Sp_Plot_Location_Master", ht);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script type='text/javascript'>alert('Deleted successfull')</script>");
            showDetails();

        }
    }

   
}