Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Text
Imports System.Collections
Imports System.Drawing

Namespace InventoryWebChart
	Public Class BO
		Private db As New NorthwindEntities()

		Public Function GetAllCategories() As List(Of CategoryItem)
            Dim categoryItems As List(Of CategoryItem) = (From c In db.Categories _
                               Select New CategoryItem() With {.CategoryID = c.Category_ID,
                                                               .CategoryName = c.Category_Name,
                                                               .CategorySum = c.Products.Sum(Function(p) p.Units_In_Stock)}).ToList()
			Return categoryItems
		End Function

		Public Class CategoryItem
			Private privateCategoryID As Integer
			Public Property CategoryID() As Integer
				Get
					Return privateCategoryID
				End Get
				Set(ByVal value As Integer)
					privateCategoryID = value
				End Set
			End Property
			Private privateCategoryName As String
			Public Property CategoryName() As String
				Get
					Return privateCategoryName
				End Get
				Set(ByVal value As String)
					privateCategoryName = value
				End Set
			End Property
			Private privateCategorySum As Nullable(Of Integer)
			Public Property CategorySum() As Nullable(Of Integer)
				Get
					Return privateCategorySum
				End Get
				Set(ByVal value As Nullable(Of Integer))
					privateCategorySum = value
				End Set
			End Property
		End Class

	End Class
End Namespace
