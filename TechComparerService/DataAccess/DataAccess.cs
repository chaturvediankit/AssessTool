using System;
using System.Data;
using System.Data.SqlClient;

namespace TechnologyComparerService.DataAccess
{
    public class DataAccessClass
    {
        string connString = @"Data Source=localhost\SQLEXPRESS;Initial Catalog=tech_comparer;Integrated Security=SSPI";

        public DataSet getFactors()
        {

            DataSet ds = new DataSet();
            try
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string sprocname = "getFactors";
                    using (SqlDataAdapter da = new SqlDataAdapter(sprocname, conn))
                    {
                        da.SelectCommand.CommandType = CommandType.StoredProcedure;
                        da.Fill(ds, "result_factors");
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Error getFactors(): " + e.Message);
            }
            return ds;
        }


        public DataSet getSectors()
        {
            DataSet ds = new DataSet();
            try
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string sprocname = "getSectors";
                    using (SqlDataAdapter da = new SqlDataAdapter(sprocname, conn))
                    {
                        da.SelectCommand.CommandType = CommandType.StoredProcedure;


                        da.Fill(ds, "result_Sectors");
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Error getSectors(): " + e.Message);
            }
            return ds;
        }


        public DataSet getValues()
        {
            DataSet ds = new DataSet();
            try
            {
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string sprocname = "getValues";
                    using (SqlDataAdapter da = new SqlDataAdapter(sprocname, conn))
                    {
                        da.SelectCommand.CommandType = CommandType.StoredProcedure;
                        da.Fill(ds, "result_Values");
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Error getValues(): " + e.Message);
            }
            return ds;
        }
    }       
}