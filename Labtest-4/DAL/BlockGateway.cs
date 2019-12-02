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
    public class BlockGateway
    {
        private string connectionString = WebConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        public List<Block> GetAllBlocks()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_GetAllBlocks", connection);
                cmd.CommandType = CommandType.StoredProcedure;
                List<Block> blocks = new List<Block>();
                connection.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    blocks.Add(new Block()
                    {
                        BlockId = (int)reader["BlockId"],
                        BlockName = reader["BlockLevel"].ToString()
                    });
                }
                reader.Close();
                connection.Close();
                return blocks;
            }

        }
    }
}