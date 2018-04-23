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

        public List<ProductItem> GetProductsByCategory(string categoryID)
        {

            List<ProductItem> productItems = (from p in db.Products where p.Category.Category_Name == categoryID
                                     select new ProductItem()
                                     {
                                         ProductID = p.Product_ID,
                                         CategoryID = p.Category_ID,
                                         ProductName = p.Product_Name,
                                         ProductQty = p.Units_In_Stock
                                     }
                        ).ToList<ProductItem>();
            return productItems;
        }

        public class CategoryItem
        {
            public int CategoryID { get; set; }
            public string CategoryName { get; set; }
            public int? CategorySum { get; set; }
            public byte[] Picture { get; set; }
        }

        public class ProductItem
        {
            public int ProductID { get; set; }
            public int? CategoryID { get; set; }
            public string ProductName { get; set; }
            public int? ProductQty { get; set; }
        }

    }
}
