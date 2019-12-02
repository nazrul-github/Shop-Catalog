using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using Labtest_4.Models;
using Labtest_4.Models.ViewModels;

namespace Labtest_4.DAL
{
    public class ShopLevelBlockViewModelGateway
    {
        private string connectionString = WebConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        public List<ShopLevlBLockViewModels> GetAllShopsByBlockLevel(string shopName)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("sp_GetAllShopInfo", connection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ShopName", shopName);
                List<ShopLevlBLockViewModels> shopLevlBLockView = new List<ShopLevlBLockViewModels>();
                connection.Open();
               
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                  
                    shopLevlBLockView.Add(new ShopLevlBLockViewModels()
                    {
                        ShopName = reader["ShopName"].ToString(),
                        BlockName = reader["BlockLevel"].ToString(),
                        Contact = reader["Contact"].ToString(),
                        LevelName = reader["LevelName"].ToString()
                    });
                }
                reader.Close();
                connection.Close();
                return shopLevlBLockView;
            }

        }
    }
}