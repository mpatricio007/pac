using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace DAL
{
    public class ClassDB
    {        
        private MySqlCommand mySqlCmd;
        private MySqlConnection mySqlConn;
        MySqlTransaction mySqlTran;
        public string CommandSQL
        {
            get
            {
                return mySqlCmd.CommandText;
            }
            set
            {
                mySqlCmd.CommandText = value;
                mySqlCmd.Parameters.Clear();
            }
        }

        public ClassDB()
        {
            mySqlCmd = new MySqlCommand();
            mySqlConn = new MySqlConnection();            
            mySqlConn.ConnectionString = ConfigurationManager.ConnectionStrings["MySqlConnection"].ToString();
            mySqlCmd.Connection = mySqlConn;
        }

        private void Open()
        {
            mySqlCmd.Connection.Open();
        }

        private void Close()
        {
            mySqlCmd.Connection.Close();
        }

        public MySqlDataReader ExecuteReader()
        {
            MySqlDataReader reader = null;
            try
            {
                this.Open();
                mySqlCmd.CommandType = CommandType.Text;
                reader = mySqlCmd.ExecuteReader(CommandBehavior.CloseConnection);
            }
            catch (Exception ex)
            {
                ex.ToString();
            }

            return reader;
        }

        public MySqlDataReader ExecuteReader(string commandSQL)
        {
            MySqlDataReader reader = null;
            try
            {
                this.Open();
                mySqlCmd.CommandType = CommandType.Text;
                mySqlCmd.CommandText = commandSQL;
                reader = mySqlCmd.ExecuteReader(CommandBehavior.CloseConnection);
            }
            catch (Exception ex)
            {
                ex.ToString();
            }

            return reader;
        }

        public bool ExecuteNonQuery()
        {
            int i = -1;
            try
            {
                this.Open();
                mySqlCmd.CommandType = CommandType.Text;
                i = mySqlCmd.ExecuteNonQuery();
            }
            catch (MySqlException ex)
            {
                ex.ToString();
            }
            finally
            {
                this.Dispose();
                this.Close();
            }
            return (i > 0);
        }

        public bool ExecuteTransaction()
        {
            int i = -1;
            this.Open();

            mySqlTran = mySqlConn.BeginTransaction();
            mySqlCmd.Transaction = mySqlTran;
            mySqlCmd.CommandType = CommandType.Text;
            try
            {
                i = mySqlCmd.ExecuteNonQuery();
                mySqlTran.Commit();
            }
            catch (Exception ex)
            {
                mySqlTran.Rollback();
                ex.ToString();
            }
            finally
            {               
                mySqlTran.Dispose();
                this.Dispose();
                this.Close();
            }
            return (i > 0);
        }

        public DataSet ExecuteDataSet()
        {
            MySqlDataAdapter da = null;
            DataSet ds = null;
            try
            {
                da = new MySqlDataAdapter();
                da.SelectCommand = mySqlCmd;
                ds = new DataSet();
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
            finally
            {
                this.Dispose();
                this.Close();
            }

            return ds;
        }

        public DataSet ExecuteDataSet(string commandSQL)
        {
            DataSet ds = null;
            try
            {
                mySqlCmd.CommandText = commandSQL;
                ds = this.ExecuteDataSet();
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
            return ds;
        }

        private MySqlParameterCollection sqlParams;

        public MySqlParameterCollection SqlParams
        {
            get { return sqlParams; }
            set { sqlParams = value; }
        }

        public MySqlParameterCollection SqlParameters
        {
            get
            {
                return mySqlCmd.Parameters;
            }
        }

        public void InsertParameter(MySqlParameter param)
        {
            mySqlCmd.Parameters.Add(param);
        }

        public void AddParameter(string pNameParam, object pValue, ParameterDirection pDirection)
        {
            MySqlParameter param = new MySqlParameter();
            param.ParameterName = pNameParam;
            param.Value = pValue;
            param.Direction = pDirection;
            mySqlCmd.Parameters.Add(param);
        }

        public void AddParameter(string pNameParam, object pValue)
        {
            MySqlParameter param = new MySqlParameter(pNameParam, pValue);
            mySqlCmd.Parameters.Add(param);
        }

        public void AddParameter(MySqlParameter param)
        {
            mySqlCmd.Parameters.Add(param);
        }

        public static object NullToDbNull(object o)
        {
            if (o != null)
            {

                if (o.GetType().Equals(typeof(System.DateTime)))
                    return ClassDB.MinDateTimeDBNull((DateTime)o);
                else
                    return (o.Equals(0)) ? DBNull.Value : o;
            }

            else
                return DBNull.Value;
        }

        public static object MinDateTimeDBNull(DateTime dt)
        {
            if (dt.Equals(DateTime.MinValue))
            {
                return DBNull.Value;
            }
            else
            {
                return dt;
            }
        }

        #region IDisposable Members

        public void Dispose()
        {
            mySqlCmd.Dispose();
        }

        #endregion
    }
}


    