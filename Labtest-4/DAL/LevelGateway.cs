using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using Labtest_4.Models;

namespace Labtest_4.DAL
{
    public class LevelGateway
    {
        private string connectionString = WebConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        public List<Level> GetAllLevels()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_GetAllLevel",connection);
                cmd.CommandType = CommandType.StoredProcedure;
                List<Level> levels = new List<Level>();
                connection.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    levels.Add(new Level()
                    {
                        LevelId = (int) reader["LevelId"],
                        LevelName = reader["LevelName"].ToString()
                    });
                }
                reader.Close();
                connection.Close();
                return levels;
            }
            
        }
    }
}