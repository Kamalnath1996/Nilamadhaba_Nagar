using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for CommonClass
/// </summary>
public class CommonClass
{
    public static void ComboFillWithQuery(DropDownList cmbctrl, string strQuery, string strValueMember, string strDispMember)
    {
        try
        {
            cmbctrl.DataSource = null;
            DataSet ds = new DataSet();
            ds = DAL.GetDataSet(strQuery);
            cmbctrl.DataSource = ds.Tables[0];
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                cmbctrl.Items.Add(ds.Tables[0].Rows[i].ItemArray[0].ToString());
                cmbctrl.Items[i].Value = ds.Tables[0].Rows[i].ItemArray[1].ToString();
            }
        }
        catch (Exception ex)
        {
        }
    }

}