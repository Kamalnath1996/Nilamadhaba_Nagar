using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Text.RegularExpressions;


/// <summary>
/// Summary description for Validation
/// </summary>
public class Validation
{
    public bool flag = false;
    public bool flag1 = false;

    public string DB_Inj = "CREATE,INSERT,DELETE,DROP,AND,OR,UPDATE,SET,SELECT";
    public Validation()
    {

    }
    public bool CheckALL(string Value, int Size, string charset)
    {
        int i, j;
        //char ch;
        string val = Value;
        flag = false;
        if (val.Length > Size || val.Length == 0)
        {
            flag = false;
            return flag;
        }


        try
        {
            int k = 0;
            for (i = 0; i < val.Length; i++)
            {

                for (j = 0; j < charset.Length; j++)
                {
                    if (val[i] == charset[j])
                    {
                        k++;

                    }

                }

            }

            if (k == i)
            {
                flag = true;
                return flag;
            }



        }
        catch (Exception err)
        {
        }

        return flag;
    }
    public bool CheckALLNULL(string Value, int Size, string charset)
    {
        int i, j;
        //char ch;
        string val = Value;
        bool Flag1 = true;
        if (val.Length == 0)
        {
            return Flag1;
        }
        else if (val.Length > Size)
        {
            Flag1 = false;
            return Flag1;
        }
        else if (val.Length < Size)
        {
            try
            {
                int k = 0;
                for (i = 0; i < val.Length; i++)
                {

                    for (j = 0; j < charset.Length; j++)
                    {
                        if (val[i] == charset[j])
                        {
                            k++;

                        }

                    }

                }

                if (k == i)
                {
                    Flag1 = true;
                    return Flag1;
                }
                else
                {
                    Flag1 = false;
                    return Flag1;
                }
            }
            catch (Exception err)
            {

            }

        }






        return flag;
    }
    public bool CheckYear(string Value, int Size, string charset, int Index1)
    {
        int i, j;
        //char ch;
        string val = Value;
        flag = false;
        if (val.Length > Size && val.Length == 0)
        {
            return flag;
        }


        try
        {
            int k = 0;
            for (i = 0; i < val.Length; i++)
            {

                for (j = 0; j < charset.Length; j++)
                {
                    if (val[i] == charset[j])
                    {
                        k++;
                        break;
                    }

                }

            }

            if (k == i)
            {

                int index = val.IndexOf('-');
                if (index == Index1)
                {
                    flag = true;
                    return flag;
                }
                else
                {

                }
            }




        }
        catch (Exception err)
        {
        }

        return flag;
    }
    public bool CheckPatternOfString(string Value, int Size, string charset, int Nos)
    {
        int countLengthOfValue = Value.Length;

        int i, j, l;
        bool Flag1 = true;


        if (countLengthOfValue > Size)
        {
            Flag1 = false;
            return Flag1;
        }
        else if (countLengthOfValue == 0)
        {
            return Flag1;
        }
        else if (countLengthOfValue <= 0)
        {
            try
            {
                int k = 0;
                string[] SplitValue = Value.Split(',');

                int countNofSplit = SplitValue.Length;

                for (l = 0; l < countNofSplit; l++)
                {
                    if (SplitValue[l].Length == Nos)
                    {
                        string val = SplitValue[l];
                        for (i = 0; i < Nos; i++)
                        {

                            for (j = 0; j < charset.Length; j++)
                            {
                                if (val[i] == charset[j])
                                {
                                    k++;
                                    break;
                                }

                            }

                        }
                    }
                    else
                    {
                        return false;
                    }
                }


                if (k == countNofSplit * Nos)
                {
                    flag = true;
                    return flag;
                }



            }
            catch (Exception err)
            {
            }

        }
        return flag;

    }
    public bool CheckMail(string Value, int Size)
    {

        //Regex reg = new Regex(@"/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/");
        Regex reg = new Regex(@"^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z\.][a-zA-Z]{1,3}$");
        if (reg.IsMatch(Value))
        {
            flag = true;
        }
        else
        {
            flag = false;
        }
        return flag;


    }
    public bool CheckDoubleSpace(string value)
    {
        bool x = true;
        int count = 0;
        char[] c = value.ToCharArray();
        for (int i = 0; i < c.Length; i++)
        {
            if (c[i] == ' ')
            {
                count++;
                if (count == 2)
                {

                    x = false;
                    break;
                }

            }
            else
            {
                count = 0;
                x = true;
            }
        }
        return x;
    }
    public void CheckCachecontrol()
    {
        HttpContext.Current.Response.Cache.SetExpires(DateTime.UtcNow.AddDays(-1));
        HttpContext.Current.Response.Cache.SetValidUntilExpires(false);
        HttpContext.Current.Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);
        HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        HttpContext.Current.Response.Cache.SetNoStore();

    }
    public bool IsValidNumeric(string value, int MinSize, int MaxSize)
    {
        return Regex.IsMatch(value, "^[0-9]{" + MinSize + "," + MaxSize + "}$");
    }
    public bool IsValidNumericWithComma(string value, int MinSize, int MaxSize)
    {
        return Regex.IsMatch(value, "^[0-9,]{" + MinSize + "," + MaxSize + "}$");
    }

    public bool IsValidNumericWithDot(string value, int MinSize, int MaxSize)
    {
        return Regex.IsMatch(value, "^[0-9.]{" + MinSize + "," + MaxSize + "}$");
    }

    public bool IsValidAlphaNumeric(string value, int MinSize, int MaxSize)
    {
        return Regex.IsMatch(value, "^[A-Za-z0-9]{" + MinSize + "," + MaxSize + "}$");
    }

    public bool IsValidAlphaNumericWithSpace(string value, int MinSize, int MaxSize)
    {
        return Regex.IsMatch(value, "^[A-Za-z0-9 ]{" + MinSize + "," + MaxSize + "}$");
    }

    public bool IsValidAlphaNumericWithSpaceSpChar(string value, int MinSize, int MaxSize)
    {
        return Regex.IsMatch(value, "^[A-Za-z0-9 /.,():-]{" + MinSize + "," + MaxSize + "}$");
    }

    public bool IsValidAlphabetsWithSpace(string value, int MinSize, int MaxSize)
    {
        return Regex.IsMatch(value, "^[A-Za-z ]{" + MinSize + "," + MaxSize + "}$");
    }

    public bool IsValidPercentage(string value)
    {
        //return Regex.IsMatch(value, @"^[1]{0,1}[0-9]{1,2}\.\d{1,}$");
        return Regex.IsMatch(value, @"^\d+([.]\d+)?%?$");
    }

    public bool IsValidSmallAlphaNumeric(string value, int MinSize, int MaxSize)
    {
        return Regex.IsMatch(value, "^[a-z0-9]{" + MinSize + "," + MaxSize + "}$");
    }

    public bool IsValidString(string value, int MinSize, int MaxSize)
    {
        return Regex.IsMatch(value, "^[A-Za-z ]{" + MinSize + "," + MaxSize + "}$");
    }
    public bool IsValidHiddenVaue(string value, int MinSize, int MaxSize)
    {
        return Regex.IsMatch(value, "^[A-Za-z0-9=/+]{" + MinSize + "," + MaxSize + "}$");
    }
    public bool IsValidPasswords(string value, int MinSize, int MaxSize)
    {
        return Regex.IsMatch(value, "^[a-z0-9]{" + MinSize + "," + MaxSize + "}$");
    }
    public bool IsValidRandomNo(string value, int MinSize, int MaxSize)
    {
        return Regex.IsMatch(value, "^[A-Za-z0-9]{" + MinSize + "," + MaxSize + "}$");
    }
    public bool IsValidMF(string value, int MinSize, int MaxSize)
    {
        return Regex.IsMatch(value, "^[MF]{" + MinSize + "," + MaxSize + "}$");
    }
    public bool IsValidInstituteType(string value, int MinSize, int MaxSize)
    {
        return Regex.IsMatch(value, "^[AGP]{" + MinSize + "," + MaxSize + "}$");
    }
    public bool IsValidMaritalStatus(string value, int MinSize, int MaxSize)
    {
        return Regex.IsMatch(value, "^[MU]{" + MinSize + "," + MaxSize + "}$");
    }

    public bool IsValidPassword(string value, int MinSize, int MaxSize)
    {
        return Regex.IsMatch(value, "^[A-Za-z0-9~!@#$^_*]{" + MinSize + "," + MaxSize + "}$");
    }
}