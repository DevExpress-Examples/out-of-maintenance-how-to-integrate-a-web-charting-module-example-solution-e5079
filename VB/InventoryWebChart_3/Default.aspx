<%@ Page Language="vb" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="InventoryWebChart.Default" %>

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

	</div>
	</form>
</body>
</html>
