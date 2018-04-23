using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using System.Drawing;

namespace InventoryWebChart
{
    public class BO
    {
        NorthwindEntities db = new NorthwindEntities();

        public List<CategoryItem> GetAllCategories()
        {
            List<CategoryItem> categoryItems = (from c in db.Categories
                            select new CategoryItem()
                            {
                                CategoryID = c.Category_ID,
                                CategoryName = c.Category_Name,
                                CategorySum = c.Products.Sum(p => p.Units_In_Stock)
                            }
                        ).ToList<CategoryItem>();
            return categoryItems;
        }

        public class CategoryItem
        {
            public int CategoryID { get; set; }
            public string CategoryName { get; set; }
            public int? CategorySum { get; set; }
        }

    }
}
