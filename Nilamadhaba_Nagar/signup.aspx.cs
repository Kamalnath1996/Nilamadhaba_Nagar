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


public partial class signup : System.Web.UI.Page
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
        }
    }
    public void cleartxt()
    {
        txtname.Text = "";
        txtemail.Text = "";
        txtPsw.Text = "";   
        txtcont.Text = "";
    }

    protected void btnSignup_Click(object sender, EventArgs e)
    {
        if (btnSignup.Text == "Signup")
        {
            ht.Clear();
            ht.Add("@Type", "Ins");

            ht.Add("@Name", txtname.Text.Trim());
            ht.Add("@Email", txtemail.Text.Trim());
            ht.Add("@Password", Convert.ToInt64(txtPsw.Text.Trim()));
            ht.Add("@Conform_Password", Convert.ToInt64(txtconform.Text.Trim()));
            ht.Add("@Contact_no", txtcont.Text.Trim());

            string id = DAL.ExecuteScalar("sp_Signup", ht);
            if (!string.IsNullOrEmpty(id))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script type='text/javascript'>alert('User created unsccessfully')</script>");
                Response.Redirect("Default.aspx");
                cleartxt();
             
            }
        
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script type='text/javascript'>alert('User creation Successful')</script>");
            }

            cleartxt();
            Response.Redirect("Default.aspx");


        }
    }
}
