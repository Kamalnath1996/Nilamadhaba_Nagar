using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



public partial class ForgotPasswords : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblId.Text= Request.QueryString["Id"].ToString();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string query = "select * from Signup where Email='"+txtEmail.Text+"'";
            DAL dal= new DAL();

        }
        catch(Exception ex)
        {
            
        }
    }
}