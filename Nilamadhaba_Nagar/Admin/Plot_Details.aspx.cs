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
public partial class Admin_Plot_Details : System.Web.UI.Page
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
            Plot_No();
            Plot_Location();
            project();
            ViewState["tempImg"] = string.Empty;
            ViewState["temporaryImg"] = string.Empty;
        }
    }

    public void cleartxt()
    {
        txtplotno.Text = "";
        txtplotsize.Text = "";
        txtareano.Text = "";
        txtareaname.Text = "";
        txtplotlocation.Text = "";
        txtkhatianno.Text = "";
        txtpatano.Text = "";
        txtproject.Text = "";
    }

    private void Plot_No()
    {
        Hashtable hashtable = new Hashtable();
    
        drplotno.DataSource = new DAL().GetDataTablePr("sp_select_plotnomaster", new Hashtable());
        drplotno.DataTextField = "plot_no";
        drplotno.DataValueField = "id";
        drplotno.DataBind();
        drplotno.Items.Insert(0, new ListItem("ALL", "0"));

    }

    private void Plot_Location()
    {
        Hashtable hashtable = new Hashtable();

        drplotLocn.DataSource = new DAL().GetDataTablePr("sp_select_plotLocmaster", new Hashtable());
        drplotLocn.DataTextField = "Plot_Location";
        drplotLocn.DataValueField = "id";
        drplotLocn.DataBind();
        drplotLocn.Items.Insert(0, new ListItem("ALL", "0"));

    }

    private void project()
    {
        Hashtable hashtable = new Hashtable();

        drproject.DataSource = new DAL().GetDataTablePr("sp_select_project", new Hashtable());
        drproject.DataTextField = "Project";
        drproject.DataValueField = "id";
        drproject.DataBind();
        drproject.Items.Insert(0, new ListItem("ALL", "0"));

    }
    public void showDetails()
    {
        DAL common = new DAL();
        Hashtable hashtable = new Hashtable();
        hashtable.Add("@Type", "Fetch");
        DataSet ds = DAL.GetDataSet("Sp_Plot_Details_Master", hashtable);
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

            var userQuery = "select * from Plot_Details_Master where Plot_Id='" + ViewState["Plot_Id"].ToString() + "'";
            var dataTable = DAL.GetDataTable(userQuery);
            if (dataTable.Rows.Count > 0)
            {
                drplotno.SelectedItem.Text = dataTable.Rows[0]["Plot_No"].ToString();
                //txtplotno.Text = dataTable.Rows[0]["Plot_No"].ToString();
                txtplotsize.Text = dataTable.Rows[0]["Plot_Size"].ToString();
                txtareano.Text = dataTable.Rows[0]["Area_No"].ToString();
                txtareaname.Text = dataTable.Rows[0]["Area_Name"].ToString();
                drplotLocn.SelectedItem.Text = dataTable.Rows[0]["Plot_Location"].ToString();
                //txtplotlocation.Text = dataTable.Rows[0]["Plot_Location"].ToString();
                txtkhatianno.Text = dataTable.Rows[0]["Khatian_No"].ToString();
                txtpatano.Text = dataTable.Rows[0]["Pata_No"].ToString();
              //  txtproject.Text = dataTable.Rows[0]["Project"].ToString();
                drproject.SelectedItem.Text = dataTable.Rows[0]["Project"].ToString();
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

            ht.Add("@plot_no", drplotno.SelectedItem.Text);
            ht.Add("@Plot_Size", txtplotsize.Text.Trim());
            ht.Add("@Area_No", txtareano.Text.Trim());
            ht.Add("@Area_Name", txtareaname.Text.Trim());
            ht.Add("@Plot_Location", drplotLocn.SelectedItem.Text);
            //ht.Add("@Plot_Location", txtplotlocation.Text.Trim());
            ht.Add("@Khatian_No", txtkhatianno.Text.Trim());
            ht.Add("@Pata_No", txtpatano.Text.Trim());
            ht.Add("@Project", drproject.SelectedItem.Text);
            //ht.Add("@Project", txtproject.Text.Trim());


            ////image upload
            //if (fldUpImage.HasFile)
            //{

            //    string str = DateTime.Now.ToString("yyyyMMddhhmmss") + Path.GetExtension(fldUpImage.FileName);
            //    ht.Add("@Type", "imgIns");
            //    ht.Add("@image", str);
            //    fldUpImage.SaveAs(Server.MapPath("~/Temporary_Files/Temp_Images/" + str));


            //}
            //else if (ViewState["temporaryImg"].ToString() != "")
            //{
            //    string filePath = "../Temporary_Files/Temp_Images/" + ViewState["tempImg"].ToString();
            //    File.Copy(Server.MapPath(filePath), Server.MapPath("../Temporary_Files/Temporary_Images/" + ViewState["tempImg"].ToString()));
            //    //ht.Add("@Type", "imgIns");
            //    ht.Add("image", ViewState["temporaryImg"].ToString());

            //}
            //else if (ViewState["temporaryImg"] != null)
            //{
            //    ht.Add("@Type", "imgIns");
            //    ht.Add("@image", ViewState["temporaryImg"].ToString());
            //}
            //else
            //    ht.Add("@image", "NoImage.jpg");


            string id = DAL.ExecuteScalar("Sp_Plot_Details_Master", ht);


            if (!string.IsNullOrEmpty(id))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script type='text/javascript'>alert('User created unsuccessfully')</script>");
                cleartxt();
            }
            else
            { 
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script type='text/javascript'>alert('User creation Successful')</script>");
            }
            showDetails();
            cleartxt();

        }
        else
        {
            ht.Clear();
            ht.Add("@Type", "update");
            ht.Add("@Plot_Id", Convert.ToInt32(ViewState["Plot_Id"].ToString()));
            ht.Add("@plot_no", drplotno.SelectedItem.Text);
            ht.Add("@Plot_Size", txtplotsize.Text.Trim());
            ht.Add("@Area_No", txtareano.Text.Trim());
            ht.Add("@Area_Name", txtareaname.Text.Trim());
            ht.Add("@Plot_Location", drplotLocn.SelectedItem.Text);
            ht.Add("@Khatian_No", txtkhatianno.Text.Trim());
            ht.Add("@Pata_No", txtpatano.Text.Trim());
            ht.Add("@Project", drproject.SelectedItem.Text);


            string id = DAL.ExecuteScalar("Sp_Plot_Details_Master", ht);
            if (!string.IsNullOrEmpty(id))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script type='text/javascript'>alert('User updated unsuccessfully')</script>");

            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script type='text/javascript'>alert('User updated Successful')</script>");
            }
            showDetails();
            cleartxt();
        }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }

    protected void grdDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "UpdateN")
        {
            ViewState["Plot_Id"] = e.CommandArgument.ToString();
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
            ht.Add("@Plot_Id", Convert.ToInt32(e.CommandArgument.ToString()));
            DAL.ExecuteScalar("Sp_Plot_Details_Master", ht);
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
        //if (e.Row.RowType != DataControlRowType.DataRow)
        //    return;
        //Label control1 = (Label)e.Row.FindControl("lblImage");
        //Label control2 = (Label)e.Row.FindControl("lblView");
        //if (!(control1.Text != ""))
        //    return;
        //control2.Text = "View";
    }

    
}