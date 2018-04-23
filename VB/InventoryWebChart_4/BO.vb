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

		Public Function GetProductsByCategory(ByVal categoryID As String) As List(Of ProductItem)

            Dim productItems As List(Of ProductItem) = (From p In db.Products _
                                                              Where p.Category.Category_Name = categoryID
                                                              Select New ProductItem() With {.ProductID = p.Product_ID,
                                                                                              .ProductName = p.Product_Name,
                                                                                             .ProductQty = p.Units_In_Stock,
                                                                                             .CategoryID = p.Category_ID}).ToList()
			Return productItems
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

		Public Class ProductItem
			Private privateProductID As Integer
			Public Property ProductID() As Integer
				Get
					Return privateProductID
				End Get
				Set(ByVal value As Integer)
					privateProductID = value
				End Set
			End Property
			Private privateCategoryID As Nullable(Of Integer)
			Public Property CategoryID() As Nullable(Of Integer)
				Get
					Return privateCategoryID
				End Get
				Set(ByVal value As Nullable(Of Integer))
					privateCategoryID = value
				End Set
			End Property
			Private privateProductName As String
			Public Property ProductName() As String
				Get
					Return privateProductName
				End Get
				Set(ByVal value As String)
					privateProductName = value
				End Set
			End Property
			Private privateProductQty As Nullable(Of Integer)
			Public Property ProductQty() As Nullable(Of Integer)
				Get
					Return privateProductQty
				End Get
				Set(ByVal value As Nullable(Of Integer))
					privateProductQty = value
				End Set
			End Property
		End Class

	End Class
End Namespace
