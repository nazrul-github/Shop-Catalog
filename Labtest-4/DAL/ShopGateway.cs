using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using Labtest_4.Models;
using Labtest_4.Models.ViewModels;

namespace Labtest_4.DAL
{
    public class ShopGateway
    {
        private string connectionString = WebConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        public bool SaveShopInformation(Shop shop)
        {

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_SaveShop",connection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ShopName", shop.ShopName);
                cmd.Parameters.AddWithValue("@Contact", shop.Contact);
                cmd.Parameters.AddWithValue("@LabelId", shop.LevelId);
                cmd.Parameters.AddWithValue("@BlockId", shop.BlockId);
                connection.Open();
                int rowAffected = cmd.ExecuteNonQuery();
                connection.Close();
                if (rowAffected > 0)
                {
                    return true;
                }

                return false;
            }
        }

        public List<Shop> GetAllShops()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_GetAllShops", connection);
                cmd.CommandType = CommandType.StoredProcedure;
                List<Shop> shops = new List<Shop>();
                connection.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    shops.Add(new Shop()
                    {
                        ShopName = reader["ShopName"].ToString(),
                        BlockId = (int) reader["BlockId"],
                        Contact = reader["Contact"].ToString(),
                        LevelId = (int) reader["LabelId"],
                        ShopId = (int) reader["ShopId"]
                    });
                }
                reader.Close();
                connection.Close();
                return shops;
            }
        }
    }
}
