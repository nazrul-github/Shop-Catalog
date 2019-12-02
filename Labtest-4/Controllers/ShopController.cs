using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Labtest_4.BLL;
using Labtest_4.Models;
using Labtest_4.Models.ViewModels;

namespace Labtest_4.Controllers
{
    public class ShopController : Controller
    {
        ShopManager _shopManager = new ShopManager();
        LevelManager _levelManager = new LevelManager();
        BlockManager _blockManager = new BlockManager();
        ShopLevelBlockViewModelManager _shopLevelBlockViewModelManager = new ShopLevelBlockViewModelManager();
        // GET: Shop
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Create()
        {
            ViewBag.Level = _levelManager.GetAllLevels();
            ViewBag.Block = _blockManager.GetAllBlocks();
            ViewBag.ShopExist = false;
            return View();
        }
        [HttpPost]
        public ActionResult Create(Shop shop)
        {
            bool isSaved = _shopManager.SaveShopInformation(shop);
            if (isSaved)
            {
                ViewBag.ShopExist = false;
                return RedirectToAction("Index");
            }
            ViewBag.ShopExist = true;
            ViewBag.Level = _levelManager.GetAllLevels();
            ViewBag.Block = _blockManager.GetAllBlocks();
            return View();
        }

       

        [HttpGet]
        public ActionResult Search()
        {
            ViewBag.Searched = false;
            return View();
        }
        [HttpPost]
        public ActionResult Search(string ShopName)
        {
            ViewBag.Searched = true;
            IEnumerable<ShopLevlBLockViewModels> shopLevelBLockViews =
                _shopLevelBlockViewModelManager.GetAllShopsByBlockLevel(ShopName);
            return View(shopLevelBLockViews);
        }
    }
}