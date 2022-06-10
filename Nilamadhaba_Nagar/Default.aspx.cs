                                                                                   using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSign_Click(object sender, EventArgs e)
    {
        try
        {
            var userName = txtEmail.Text.Trim();
            var password = txtPsw.Text.Trim();
            var userQuery = "select * from Signup where Email='" + userName + "' and Password='" + password + "' ";
            //var test = "select Unit_Visited from tbl_Inspection where Unit_Visited='kamal'";

            //var dataTabletest = DAL.GetDataTable(test);

            var dataTable = DAL.GetDataTable(userQuery);
            if (dataTable.Rows.Count > 0)
            {
                Session["Email"] = dataTable.Rows[0]["Email"].ToString();
                Session["User_ID"] = dataTable.Rows[0]["Id"].ToString();
                //Session["Password"] = dataTable.Rows[0]["Password"].ToString();


                Response.Redirect("~/Dashboard.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script type='text/javascript'>alert('Invalid User')</script>");
                //txtPassword.Text = "";
                //txtUserName.Text = "";
            }
        }
        catch (Exception )
        {

            throw;
        }
    }

    protected void btnsignup_Click(object sender, EventArgs e)
    {
        Response.Redirect("signup.aspx");
    }
}