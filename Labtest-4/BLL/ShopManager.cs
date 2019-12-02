using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Labtest_4.DAL;
using Labtest_4.Models;

namespace Labtest_4.BLL
{
    public class ShopManager
    {
        ShopGateway shopGateway = new ShopGateway();

        public bool SaveShopInformation(Shop shop)
        {
            bool isShopExist = shopGateway.GetAllShops().Any(s => s.ShopName == shop.ShopName);
            if (isShopExist)
            {
                return false;
            }

            shopGateway.SaveShopInformation(shop);
            return true;
        }
    }
}