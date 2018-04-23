using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;

namespace InventoryWebChart
{
    public partial class Default : System.Web.UI.Page
    {
        NorthwindEntities db = new NorthwindEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            var categorySales = (from c in db.Categories
                                 select new {
                                     CategoryID = c.Category_ID,
                                     CategoryName = c.Category_Name,
                                     CategorySum = c.Products.Sum(p => p.Units_In_Stock)
                                 }
                     ).ToList();
            this.inventoryChart.Series["CategoryUnits"].DataSource = categorySales;
            this.inventoryChart.Series["CategoryUnits"].ArgumentDataMember = "CategoryName";
            this.inventoryChart.Series["CategoryUnits"].ValueDataMembers.AddRange(new string[] { "CategorySum" });
        }

    }
}