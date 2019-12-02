using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Labtest_4.DAL;
using Labtest_4.Models.ViewModels;

namespace Labtest_4.BLL
{
    public class ShopLevelBlockViewModelManager
    {
        ShopLevelBlockViewModelGateway shopLevelBlockViewModelGateway = new ShopLevelBlockViewModelGateway();

        public List<ShopLevlBLockViewModels> GetAllShopsByBlockLevel(string shopName)
        {
            return shopLevelBlockViewModelGateway.GetAllShopsByBlockLevel(shopName);
        }
    }
}