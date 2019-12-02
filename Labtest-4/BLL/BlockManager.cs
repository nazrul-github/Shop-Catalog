using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Razor.Parser.SyntaxTree;
using Labtest_4.DAL;
using Block = Labtest_4.Models.Block;

namespace Labtest_4.BLL
{
    public class BlockManager
    {
        BlockGateway blockGateway = new BlockGateway();

        public List<Block> GetAllBlocks()
        {
            return blockGateway.GetAllBlocks();
        }
    }
}