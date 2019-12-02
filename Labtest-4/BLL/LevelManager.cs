using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Labtest_4.DAL;
using Labtest_4.Models;

namespace Labtest_4.BLL
{
    public class LevelManager
    {
        LevelGateway levelGateway = new LevelGateway();

        public List<Level> GetAllLevels()
        {
            return levelGateway.GetAllLevels();
        }
    }
}