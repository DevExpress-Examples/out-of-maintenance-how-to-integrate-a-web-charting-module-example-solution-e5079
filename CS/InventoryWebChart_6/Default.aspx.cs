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
        const string queryName = "CategoryName";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString[queryName] != null) {
                string categoryName = Convert.ToString(Request.QueryString[queryName]);
                var categoryImage = (from c in db.Categories where c.Category_Name == categoryName select c.Picture).First();
                if (categoryImage != null) {

                        ImageConverter converter = new ImageConverter();
                        Bitmap img = (Bitmap)converter.ConvertFrom(categoryImage);
                        WriteBitmapToResponse(img);
                }
            }
        }



        void WriteBitmapToResponse(Bitmap bitmap) {
            MemoryStream ms = new MemoryStream();
            bitmap.Save(ms, ImageFormat.Png);
            byte[] bytes = ms.ToArray();
            ms.Close();
            Response.Buffer = true;
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.Public);
            Response.Cache.SetExpires(DateTime.Now.AddMinutes(5));
            Response.ContentType = "image/png";
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.End();
        }

        protected void WebChartControl1_CustomCallback(object sender, DevExpress.XtraCharts.Web.CustomCallbackEventArgs e) {
            this.BOProducts.SelectParameters["categoryID"].DefaultValue = e.Parameter;
            this.productsChart.DataBind();
        }


    }
}