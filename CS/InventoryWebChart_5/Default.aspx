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

            <clientsideevents objectselected="function(s, e) {
	productsPopup.ShowWindowAtPos(e.x, e.y);
}" />

<ClientSideEvents ObjectSelected="function(s, e) {
  if (e.additionalHitObject != null) {
    productsChart.PerformCallback(e.additionalHitObject.argument);
	productsPopup.SetHeaderText(e.additionalHitObject.argument + ' - Products');
	productsPopup.ShowAtPos(e.x, e.y);
 }
}" customdrawcrosshair="function(s, e) {
   	for (var i = 0; i &lt; e.crosshairElements.length; i++) {
		var category = e.crosshairElements[i].Point.point.argument.toString();
		var categoryUrl = encodeURI(&quot;Default.aspx?CategoryName=&quot; + category);
       	e.crosshairElements[i].LabelElement.marker = 
    &quot;&lt;div style='width:240px; height:150px; background-image: url(&quot; + categoryUrl + &quot;);' /&gt;&quot;;
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
        OnCustomCallback="WebChartControl1_CustomCallback" ToolTipEnabled="True" 
        Width="500px">
        <diagramserializable>
            <dx:SimpleDiagram EqualPieSize="False">
            </dx:SimpleDiagram>
        </diagramserializable>
        <legend visible="False"></legend>
        <seriesserializable>
            <dx:Series ArgumentDataMember="ProductName" Name="ProductUnits" 
                ToolTipPointPattern="{A} - {V} unit(s) ({VP:P2} of total)" 
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
                            </dx:PiePointOptions>
                        </pointoptionsserializable>
                    </dx:PieSeriesLabel>
                </labelserializable>
                <legendpointoptionsserializable>
                    <dx:PiePointOptions PercentOptions-ValueAsPercent="False" 
                        PointView="ArgumentAndValues">
                        <valuenumericoptions format="Number" precision="0" />
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
                        </dx:PiePointOptions>
                    </pointoptionsserializable>
                </dx:PieSeriesLabel>
            </labelserializable>
            <legendpointoptionsserializable>
                <dx:PiePointOptions>
                    <valuenumericoptions format="General" />
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
