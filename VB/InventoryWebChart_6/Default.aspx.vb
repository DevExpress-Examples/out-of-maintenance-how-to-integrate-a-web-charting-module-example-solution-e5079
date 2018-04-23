Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.IO
Imports System.Drawing
Imports System.Drawing.Imaging

Namespace InventoryWebChart
	Partial Public Class [Default]
		Inherits System.Web.UI.Page
		Private db As New NorthwindEntities()
		Private Const queryName As String = "CategoryName"
		Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
			If Request.QueryString(queryName) IsNot Nothing Then
				Dim categoryName As String = Convert.ToString(Request.QueryString(queryName))
				Dim categoryImage = (From c In db.Categories _
				                     Where c.Category_Name = categoryName _
				                     Select c.Picture).First()
				If categoryImage IsNot Nothing Then

						Dim converter As New ImageConverter()
						Dim img As Bitmap = CType(converter.ConvertFrom(categoryImage), Bitmap)
						WriteBitmapToResponse(img)
				End If
			End If
		End Sub



		Private Sub WriteBitmapToResponse(ByVal bitmap As Bitmap)
			Dim ms As New MemoryStream()
			bitmap.Save(ms, ImageFormat.Png)
			Dim bytes() As Byte = ms.ToArray()
			ms.Close()
			Response.Buffer = True
			Response.Charset = ""
			Response.Cache.SetCacheability(HttpCacheability.Public)
			Response.Cache.SetExpires(DateTime.Now.AddMinutes(5))
			Response.ContentType = "image/png"
			Response.BinaryWrite(bytes)
			Response.Flush()
			Response.End()
		End Sub

		Protected Sub WebChartControl1_CustomCallback(ByVal sender As Object, ByVal e As DevExpress.XtraCharts.Web.CustomCallbackEventArgs)
			Me.BOProducts.SelectParameters("categoryID").DefaultValue = e.Parameter
			Me.productsChart.DataBind()
		End Sub


	End Class
End Namespace