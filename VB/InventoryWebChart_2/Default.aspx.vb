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

		Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
			Dim categorySales = (From c In db.Categories _
			                     Select New With {Key .CategoryID = c.Category_ID, Key .CategoryName = c.Category_Name, Key .CategorySum = c.Products.Sum(Function(p) p.Units_In_Stock)}).ToList()
			Me.inventoryChart.Series("CategoryUnits").DataSource = categorySales
			Me.inventoryChart.Series("CategoryUnits").ArgumentDataMember = "CategoryName"
			Me.inventoryChart.Series("CategoryUnits").ValueDataMembers.AddRange(New String() { "CategorySum" })
		End Sub

	End Class
End Namespace