<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="InventoryWebChart.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <dx:WebChartControl ID="inventoryChart" runat="server" CrosshairEnabled="True" 
            DataSourceID="BOInventory" Height="350px" 
            Width="600px" ClientInstanceName="inventoryChart">
            <diagramserializable>
                <dx:XYDiagram>
                    <axisx visibleinpanesserializable="-1">
                        <range alwaysshowzerolevel="True" sidemarginsenabled="True" />
                    <VisualRange AutoSideMargins="True"></VisualRange>

<WholeRange AutoSideMargins="True"></WholeRange>
</axisx>
                    <axisy visibleinpanesserializable="-1">
                        <range alwaysshowzerolevel="True" sidemarginsenabled="True" />
                    <VisualRange AutoSideMargins="True"></VisualRange>

<WholeRange AutoSideMargins="True"></WholeRange>
</axisy>
                </dx:XYDiagram>
            </diagramserializable>
<FillStyle><OptionsSerializable>
<dx:SolidFillOptions></dx:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

            <legend alignmenthorizontal="Center" alignmentvertical="TopOutside"></legend>
            <seriesserializable>
                <dx:Series ArgumentDataMember="CategoryName" Name="CategoryUnits" 
                    ValueDataMembersSerializable="CategorySum" 
                    LegendText="Categories - Units in stock" ArgumentScaleType="Qualitative">
                    <viewserializable>
                        <dx:SideBySideBarSeriesView>
                        </dx:SideBySideBarSeriesView>
                    </viewserializable>
                    <labelserializable>
                        <dx:SideBySideBarSeriesLabel LineVisible="True">
                            <fillstyle>
                                <optionsserializable>
                                    <dx:SolidFillOptions />
                                </optionsserializable>
                            </fillstyle>
                            <pointoptionsserializable>
                                <dx:PointOptions>
                                </dx:PointOptions>
                            </pointoptionsserializable>
                        </dx:SideBySideBarSeriesLabel>
                    </labelserializable>
                    <legendpointoptionsserializable>
                        <dx:PointOptions>
                        </dx:PointOptions>
                    </legendpointoptionsserializable>
                </dx:Series>
            </seriesserializable>

<SeriesTemplate><ViewSerializable>
<dx:SideBySideBarSeriesView></dx:SideBySideBarSeriesView>
</ViewSerializable>
<LabelSerializable>
<dx:SideBySideBarSeriesLabel LineVisible="True">
<FillStyle><OptionsSerializable>
<dx:SolidFillOptions></dx:SolidFillOptions>
</OptionsSerializable>
</FillStyle>
<PointOptionsSerializable>
<dx:PointOptions></dx:PointOptions>
</PointOptionsSerializable>
</dx:SideBySideBarSeriesLabel>
</LabelSerializable>
<LegendPointOptionsSerializable>
<dx:PointOptions></dx:PointOptions>
</LegendPointOptionsSerializable>
</SeriesTemplate>
<ClientSideEvents ObjectSelected="function(s, e) {
  if (e.additionalHitObject != null) {
    productsChart.PerformCallback(e.additionalHitObject.argument);
	productsPopup.SetHeaderText(e.additionalHitObject.argument + ' - Products');
	productsPopup.ShowAtPos(e.x, e.y);
 }
}"></ClientSideEvents>

<CrosshairOptions><CommonLabelPositionSerializable>
<dx:CrosshairMousePosition></dx:CrosshairMousePosition>
</CommonLabelPositionSerializable>
</CrosshairOptions>

<ToolTipOptions><ToolTipPositionSerializable>
<dx:ToolTipMousePosition></dx:ToolTipMousePosition>
</ToolTipPositionSerializable>
</ToolTipOptions>
        </dx:WebChartControl>
        <asp:ObjectDataSource ID="BOInventory" runat="server" 
            SelectMethod="GetAllCategories" TypeName="InventoryWebChart.BO">
        </asp:ObjectDataSource>
    
        <dx:ASPxPopupControl ID="productsPopup" runat="server" 
            ClientInstanceName="productsPopup" Height="400px" RenderMode="Lightweight" 
            Width="500px" HeaderText="Products">
            <ContentCollection>
<dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
    <dx:WebChartControl ID="productsChart" runat="server" 
        ClientInstanceName="productsChart" CrosshairEnabled="True" 
        DataSourceID="BOProducts" Height="400px" 
        OnCustomCallback="WebChartControl1_CustomCallback" 
        Width="500px">
        <diagramserializable>
            <dx:SimpleDiagram EqualPieSize="False">
            </dx:SimpleDiagram>
        </diagramserializable>
        <legend visible="False"></legend>
        <seriesserializable>
            <dx:Series ArgumentDataMember="ProductName" Name="ProductUnits" 
                ValueDataMembersSerializable="ProductQty">
                <viewserializable>
                    <dx:PieSeriesView RuntimeExploding="False">
                    </dx:PieSeriesView>
                </viewserializable>
                <labelserializable>
                    <dx:PieSeriesLabel>
                        <pointoptionsserializable>
                            <dx:PiePointOptions PercentOptions-ValueAsPercent="False" 
                                PointView="ArgumentAndValues">
                                <valuenumericoptions format="Number" precision="0" />
<ValueNumericOptions Format="Number" Precision="0"></ValueNumericOptions>
                            </dx:PiePointOptions>
                        </pointoptionsserializable>
                    </dx:PieSeriesLabel>
                </labelserializable>
                <legendpointoptionsserializable>
                    <dx:PiePointOptions PercentOptions-ValueAsPercent="False" 
                        PointView="ArgumentAndValues">
                        <valuenumericoptions format="Number" precision="0" />
<ValueNumericOptions Format="Number" Precision="0"></ValueNumericOptions>
                    </dx:PiePointOptions>
                </legendpointoptionsserializable>
            </dx:Series>
        </seriesserializable>
        <seriestemplate>
            <viewserializable>
                <dx:PieSeriesView RuntimeExploding="False">
                </dx:PieSeriesView>
            </viewserializable>
            <labelserializable>
                <dx:PieSeriesLabel>
                    <pointoptionsserializable>
                        <dx:PiePointOptions>
                            <valuenumericoptions format="General" />
<ValueNumericOptions Format="General"></ValueNumericOptions>
                        </dx:PiePointOptions>
                    </pointoptionsserializable>
                </dx:PieSeriesLabel>
            </labelserializable>
            <legendpointoptionsserializable>
                <dx:PiePointOptions>
                    <valuenumericoptions format="General" />
<ValueNumericOptions Format="General"></ValueNumericOptions>
                </dx:PiePointOptions>
            </legendpointoptionsserializable>
        </seriestemplate>
    </dx:WebChartControl>
                </dx:PopupControlContentControl>
</ContentCollection>
        </dx:ASPxPopupControl>
        <asp:ObjectDataSource ID="BOProducts" runat="server" 
            SelectMethod="GetProductsByCategory" TypeName="InventoryWebChart.BO" >
            <SelectParameters>
                <asp:Parameter Name="categoryID" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>
