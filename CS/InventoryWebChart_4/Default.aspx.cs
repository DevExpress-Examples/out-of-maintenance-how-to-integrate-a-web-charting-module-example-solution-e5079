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

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void WebChartControl1_CustomCallback(object sender, DevExpress.XtraCharts.Web.CustomCallbackEventArgs e) {
            this.BOProducts.SelectParameters["categoryID"].DefaultValue = e.Parameter;
            this.productsChart.DataBind();
        }

    }
}