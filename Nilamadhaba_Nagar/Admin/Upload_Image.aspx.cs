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
public partial class Admin_Upload_Image : System.Web.UI.Page
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
            lblplotId.Text= Request.QueryString["Plot_Id"].ToString();
            //lblimg.Text = Request.QueryString["Plot_Id"].ToString();
            ViewState["tempImg"] = string.Empty;
            ViewState["temporaryImg"] = string.Empty;
        }
    }

    protected void btnPreview_Click(object sender, EventArgs e)
    {
     

        if (!fldUpImage.HasFile)
        {
          /*  lblimg.Text = "please select a image";*/ //if file uploader has no file selected  
        }
        else if (fldUpImage.HasFile)
        {
            string str = DateTime.Now.ToString("yyyyMMddhhmmss") + Path.GetExtension(fldUpImage.FileName);
            string pht = fldUpImage.FileName;


            lblimg.Visible = true;
            string filePath = fldUpImage.PostedFile.FileName; // getting the file path of uploaded file  
            string filename1 = Path.GetFileName(filePath); // getting the file name of uploaded file  
            string ext = Path.GetExtension(filename1); // getting the file extension of uploaded file  
            string type = String.Empty;

            fldUpImage.SaveAs(Server.MapPath("../Temporary_Files/Temp_Images/" + str));
            ViewState["tempImg"] = str;
            ViewState["temporaryImg"] = str;

            try
            {
                switch (ext)
                {
                    case ".png":
                        type = "image/png";
                        break;
                    case ".jpeg":
                        type = "image/jpeg";
                        break;
                    case ".jpg":
                        type = "image/jpg";
                        break;
                    case ".webp":
                        type = "image/webp";
                        break;
                }
                if (type != string.Empty)
                {
                    Stream strm = fldUpImage.PostedFile.InputStream;
                    BinaryReader reader = new BinaryReader(strm);
                    Byte[] bytes = reader.ReadBytes(Convert.ToInt32(strm.Length));
                    plotimg.Src = "data:image/png;base64," + Convert.ToBase64String(bytes, 0, bytes.Length);
                    plotimg.Src = "data:image/jpg;base64," + Convert.ToBase64String(bytes, 0, bytes.Length);
                    plotimg.Src = "data:image/jpeg;base64," + Convert.ToBase64String(bytes, 0, bytes.Length);
                    plotimg.Visible = true;
                    lblimg.Text = "image Upload Successfully";
                }
                else
                {
                    lblimg.ForeColor = System.Drawing.Color.Red;
                    lblimg.Text = "Select only image";
                }
            }
            catch (Exception ex)
            {
                lblimg.Text = "Error: " + ex.Message.ToString();
            }



        }
        else
        {
            if (plotimg.Src == "~/images/plot.jpg")
            {
                ScriptManager.RegisterStartupScript(btnPreview, btnPreview.GetType(), "Alert", "alert('Upload an image to preview');", true);
            }

        }
    }


    protected void btnUpload_Click(object sender, EventArgs e)
      {
        ht.Clear();
        ht.Add("@Type", "ins");

        //ht.Add("@plot_id", txtplotId.Text.Trim());

        ht.Add("@plot_id", Request.QueryString["Plot_Id"].ToString());
        if (fldUpImage.HasFile)
        {
            string str = DateTime.Now.ToString("yyyyMMddhhmmss") + Path.GetExtension(fldUpImage.FileName);
            ht.Add("image", str);
            fldUpImage.SaveAs(Server.MapPath("~/Temporary_Files/Temp_Images/" + str));
        }
        else if (ViewState["temporaryImg"].ToString() != "")
        {
            string filePath = "~/Temporary_Files/Temp_Images/" + ViewState["tempImg"].ToString();
             File.Copy(Server.MapPath(filePath), Server.MapPath("~/Temporary_Files/Temporary_Images/" + ViewState["tempImg"].ToString()));
            ht.Add("image", ViewState["temporaryImg"].ToString());

        }
        else if (ViewState["temporaryImg"] != null)
            ht.Add("image", ViewState["temporaryImg"].ToString());
        else
            ht.Add("image", "NoImage.jpg");


        string id = DAL.ExecuteScalar("sp_PlotImage_Details", ht);
        if (!string.IsNullOrEmpty(id))
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script type='text/javascript'>alert('User created unsuccessfully')</script>");

        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script type='text/javascript'>alert('User creation successful')</script>");
        }
    }
}