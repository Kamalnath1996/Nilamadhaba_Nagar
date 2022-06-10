using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DAL
/// </summary>
public class DAL
{
    public DAL()
    {
       public static string strcon = ConfigurationManager.ConnectionStrings["conString"].ConnectionString.ToString();

    public static SqlConnection OpenConnection()
    {
        try
        {
            SqlConnection cn = new SqlConnection(strcon);
            if (cn.State == ConnectionState.Closed)
            {
                cn.Open();
            }
            return cn;
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    /// <summary>
    /// This is used for disconnect the database connectivity.
    /// </summary>
    /// <returns></returns>
    public static SqlConnection CloseConnection()
    {
        SqlConnection cn = new SqlConnection(strcon);
        try
        {
            if (cn.State == ConnectionState.Open)
            {
                cn.Close();
            }
        }
        catch (Exception ex)
        {
        }
        return cn;
    }

    /// <summary>
    /// Used for execute some DML statement
    /// </summary>
    /// <param name="strQuery">DML Sql statement( insert,update or delete) </param>
    /// <returns></returns>
    public static int ExecuteQuery(string strQuery)
    {
        SqlConnection cn;
        SqlCommand cmd;
        cn = OpenConnection();
        int intRows = 0;
        try
        {
            cmd = new SqlCommand(strQuery, cn);
            intRows = cmd.ExecuteNonQuery();
            return intRows;
        }
        catch (Exception ex)
        {
        }
        return intRows;
    }

    public static int AutoGenNo(string strTab, string strCol)
    {
        int maxVal = 0;
        DataSet ds = new DataSet();
        ds = DataAccess.GetDataSet("select isnull(max(" + strCol + "),0)slno from " + strTab);
        maxVal = Convert.ToInt32(ds.Tables[0].Rows[0].ItemArray[0].ToString()) + 1;
        return maxVal;
    }

    /// <summary>
    ///
    /// </summary>
    /// <param name="strQuery"></param>
    /// <returns></returns>

    public static int ExecuteQuery(string strQuery, SqlConnection cn)
    {
        SqlCommand cmd;
        int intRows = 0;
        try
        {
            cmd = new SqlCommand(strQuery, cn);
            intRows = cmd.ExecuteNonQuery();
            return intRows;
        }
        catch (Exception ex)
        {
        }
        return intRows;
    }

    public static int ExecuteStoredProcedure(string procedureName, SqlParameter[] parameter)
    {
        var connection = OpenConnection();
        var command = new SqlCommand
        {
            CommandText = procedureName,
            CommandType = CommandType.StoredProcedure,
            Connection = connection
        };
        command.Parameters.AddRange(parameter);
        command.CommandTimeout = 99999999;
        var value = command.ExecuteNonQuery();
        return value;
    }

    /// <summary>
    /// Return first column of first row against some condition.
    /// </summary>
    /// <param name="tableName">required table Name</param>
    /// <param name="getColumn">required column name which do u want</param>
    /// <param name="provideColumn">required column name of condition</param>
    /// <param name="providevalue">required value of condition</param>
    /// <param name="blnString">required false/true is the value string or not</param>
    /// <returns></returns>
    public static object ExecuteScalarValue(string tableName, string getColumn, string provideColumn, string providevalue, bool blnString)
    {
        object obj = "";
        SqlConnection cn;
        SqlCommand cmd;
        cn = OpenConnection();

        try
        {
            if (blnString)
                cmd = new SqlCommand("select " + getColumn + " from " + tableName + " where " + provideColumn + "='" + providevalue + "'", cn);
            else
            {
                cmd = new SqlCommand("select " + getColumn + " from " + tableName + " where " + provideColumn + "=" + providevalue, cn);
            }
            obj = cmd.ExecuteScalar();
            cn = CloseConnection();
        }
        catch (Exception ex)
        {
            cn = CloseConnection();
        }

        return obj;
    }

    /// <summary>
    ///
    /// </summary>
    /// <param name="strQuery">Sql statement that returns first row of first column</param>
    /// <returns></returns>
    public static object ExecuteScalarValue(string strQuery)
    {
        object obj = "";
        SqlConnection cn;
        SqlCommand cmd;
        cn = OpenConnection();

        try
        {
            cmd = new SqlCommand(strQuery, cn);
            obj = cmd.ExecuteScalar();
            cn = CloseConnection();
        }
        catch (Exception ex)
        {
            cn = CloseConnection();
        }

        return obj;
    }

    public static object ExecuteScalarForStoreProcedure(string strQuery, SqlConnection cn)
    {
        object obj = "";
        SqlCommand cmd;
        try
        {
            cmd = new SqlCommand(strQuery, cn);
            obj = cmd.ExecuteScalar();
        }
        catch (Exception ex)
        {
        }

        return obj;
    }

    public static object ExecuteScalarValue(string strQuery, SqlConnection cn)
    {
        object obj = "";
        SqlCommand cmd;

        try
        {
            cmd = new SqlCommand(strQuery, cn);
            obj = cmd.ExecuteScalar();
        }
        catch (Exception ex)
        {
        }

        return obj;
    }

    /// <summary>
    ///
    /// </summary>
    /// <param name="strQuery">Sql statement which returns a record set of data after execution</param>
    /// <returns></returns>
    public static DataSet GetDataSet(string strQuery)
    {
        SqlConnection cn = new SqlConnection();

        cn = OpenConnection();
        SqlDataAdapter da = new SqlDataAdapter(strQuery, cn);
        DataSet ds = new DataSet();
        try
        {
            da.Fill(ds);
            cn.Close();
        }
        catch (Exception ex)
        {
        }
        return ds;
    }

    public static DataTable GetDataTable(string query)
    {
        SqlConnection cn = new SqlConnection();

        cn = OpenConnection();
        SqlDataAdapter da = new SqlDataAdapter(query, cn);

        var dt = new DataTable();
        try
        {
            da.Fill(dt);
            cn.Close();
        }
        catch (Exception ex)
        {
        }
        finally
        {
            CloseConnection();
        }
        return dt;
    }

    public static DataRow GetDataRow(string query)
    {
        var dt = GetDataTable(query);
        if (dt.Rows.Count > 0)
            return dt.Rows[0];
        else
            return null;
    }

    public static DataSet GetDataSet(string strQuery, string strTableName)
    {
        SqlConnection cn = new SqlConnection();
        cn = OpenConnection();
        SqlDataAdapter da = new SqlDataAdapter(strQuery, cn);
        DataSet ds1 = new DataSet();
        da.Fill(ds1, strTableName);

        cn.Close();
        return ds1;
    }

    public static SqlDataReader GetDataReader(string strQuery)
    {
        SqlConnection cn = new SqlConnection();
        cn = OpenConnection();
        SqlCommand cmd = new SqlCommand(strQuery, cn);
        SqlDataReader dr;
        dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        cn = CloseConnection();
        return dr;
    }

    public static DataTable GetDataTable(string procedureName, int id = 0)
    {
        var connection = OpenConnection();
        var dataAdapter = new SqlDataAdapter(procedureName, connection)
        {
            SelectCommand = { CommandType = CommandType.StoredProcedure }
        };
        var dataTable = new DataTable();
        dataAdapter.Fill(dataTable);
        CloseConnection();
        return dataTable;
    }

    public static DataSet GetDataSet(string sp, Hashtable ht)
    {
        DataSet dataSet = new DataSet();
        SqlConnection con = new SqlConnection();
        con = OpenConnection();
        try
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlCommand selectCommand = new SqlCommand(sp, con);
            selectCommand.CommandType = CommandType.StoredProcedure;
            selectCommand.CommandTimeout = 0;
            foreach (DictionaryEntry dictionaryEntry in ht)
                selectCommand.Parameters.Add((string)dictionaryEntry.Key, dictionaryEntry.Value);
            new SqlDataAdapter(selectCommand).Fill(dataSet);
            con.Close();
            selectCommand.Dispose();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                CloseConnection();
            if (con != null)
                con = (SqlConnection)null;
        }
        return dataSet;
    }

    public static DataTable GetDataTable(string sp, Hashtable ht)
    {
        DataTable dataTable = new DataTable();
        SqlConnection con = new SqlConnection();
        con = OpenConnection();
        try
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlCommand selectCommand = new SqlCommand(sp, con);
            selectCommand.CommandType = CommandType.StoredProcedure;
            selectCommand.CommandTimeout = 999999;
            foreach (DictionaryEntry dictionaryEntry in ht)
                selectCommand.Parameters.Add((string)dictionaryEntry.Key, dictionaryEntry.Value);
            new SqlDataAdapter(selectCommand).Fill(dataTable);
            con.Close();
            selectCommand.Dispose();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
        return dataTable;
    }

    public static void ExcuteProcInsUpdt(string sp, Hashtable ht)
    {
        SqlConnection con = new SqlConnection();
        try
        {
            con = OpenConnection();
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlCommand sqlCommand = new SqlCommand(sp, con);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            foreach (DictionaryEntry dictionaryEntry in ht)
                sqlCommand.Parameters.Add((string)dictionaryEntry.Key, dictionaryEntry.Value);
            sqlCommand.ExecuteNonQuery();
            sqlCommand.Dispose();
            if (con.State != ConnectionState.Open)
                return;
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
    }

    public static string ExecuteScalar(string sp, Hashtable ht)
    {
        string str = "";
        SqlConnection con = new SqlConnection();
        try
        {
            con = OpenConnection();
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlCommand sqlCommand = new SqlCommand(sp, con);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            foreach (DictionaryEntry dictionaryEntry in ht)
                sqlCommand.Parameters.Add((string)dictionaryEntry.Key, dictionaryEntry.Value);
            str = Convert.ToString(sqlCommand.ExecuteScalar());
            sqlCommand.Dispose();
            con.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
        return str;
    }

    public DataTable GetDataTableQry(string qry)
    {
        DataTable dataTable = new DataTable();
        SqlConnection cn = new SqlConnection();
        cn = OpenConnection();
        try
        {
            if (cn.State == ConnectionState.Closed)
                cn.Open();
            SqlCommand selectCommand = new SqlCommand(qry, cn);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(selectCommand);
            sqlDataAdapter.Fill(dataTable);
            cn.Close();
            selectCommand.Dispose();
            sqlDataAdapter.Dispose();
            return dataTable;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            if (cn.State == ConnectionState.Open)
                cn.Close();
        }
    }
    public string ExecuteScalarQry(string qry)
    {
        string str;
        SqlConnection cn = new SqlConnection();
        cn = OpenConnection();
        try
        {
            if (cn.State == ConnectionState.Closed)
                cn.Open();
            SqlCommand sqlCommand = new SqlCommand(qry, cn);
            sqlCommand.CommandTimeout = 0;
            str = Convert.ToString(sqlCommand.ExecuteScalar());
            sqlCommand.Dispose();
            cn.Close();

        }
        catch
        {
            throw;
        }
        return str;
    }
    public DataTable GetDataTablePr(string sp, Hashtable ht)
    {
        DataTable dataTable = new DataTable();
        SqlConnection cn = new SqlConnection();
        cn = OpenConnection();
        try
        {
            if (cn.State == ConnectionState.Closed)
                cn.Open();
            SqlCommand selectCommand = new SqlCommand(sp, cn);
            selectCommand.CommandType = CommandType.StoredProcedure;
            selectCommand.CommandTimeout = 0;
            foreach (DictionaryEntry dictionaryEntry in ht)
                selectCommand.Parameters.Add((string)dictionaryEntry.Key, dictionaryEntry.Value);
            new SqlDataAdapter(selectCommand).Fill(dataTable);
            cn.Close();
            selectCommand.Dispose();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            if (cn.State == ConnectionState.Open)
                cn.Close();
        }
        return dataTable;
    
}
}