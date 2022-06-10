using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Text;
using System.Data;
using System.Collections;
using System.Web.UI.WebControls;

public partial class Admin_View_Image : System.Web.UI.Page
{
    Hashtable hashtable = new Hashtable();
    protected void Page_Load(object sender, EventArgs e)
    {
        view_img();
    }

    public void view_img()
     {
        hashtable.Add("@Type", "fetch");
        hashtable.Add("@plot_id", Request.QueryString["Plot_Id"].ToString());
        DataTable dataTable = DAL.GetDataTable("sp_PlotImage_Details", hashtable);
        if (dataTable.Rows.Count > 0)
        {
            StringBuilder stringBuilder = new StringBuilder("");
            stringBuilder.Append("<table border='0px' cellpadding='1' cellspacing='0' style='background-color: #FFF; border-collapse:collapse;border-color:black;' class='tbltxt'  width='700px'>");
            stringBuilder.Append("<tr style='align:center;'>");
            int count = 0;
        

            foreach (DataRow dr in (InternalDataCollectionBase)dataTable.Rows)
            {
                stringBuilder.Append("<td width='50%'>");
                stringBuilder.Append("<img src='../Temporary_Files/Temporary_Images/" + dr["image"] + "'  style ='width: 230px; height: 230px;'>");
                stringBuilder.Append("</td>");
                count++;
                if (count % 3 == 0)
                {
                    stringBuilder.Append("</tr>");
                }
                
            }


            stringBuilder.Append("</tr>");
            stringBuilder.Append("</table>");
            img.Text = stringBuilder.ToString();
        }
        else
        {
            
        }
        
    }
}