﻿<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Chart_Trail_Balance_View_AnalyseTrailBalance.ascx.vb" Inherits="Controls_Chart_Trail_Balance_View_AnalyseTrailBalance"  %><asp:Chart ID="Chart1" runat="server" BackColor="211, 223, 240" ImageLocation="~/TempImages/ChartPic_#SEQ(300,3)" Width="412px" Height="296px" BorderlineDashStyle="Solid" BackGradientStyle="TopBottom" BorderWidth="2px" BorderColor="#1A3B69" DataSourceID="ControllerDataSource1"><Legends><asp:Legend IsTextAutoFit="True" Name="Default" BackColor="Transparent" Font="Trebuchet MS, 8.25pt, style=Bold" Enabled="True" /></Legends><Series><asp:Series ChartArea="ChartArea1" IsValueShownAsLabel="True" Name="Closing_Amount" XValueMember="Account_Type" YValuesPerPoint="4" YValueMembers="Closing_Amount" ChartType="Column" LabelFormat="{0:N2}" LegendText="^ClosingAmount^Closing Amount^ClosingAmount^" /></Series><ChartAreas><asp:ChartArea Name="ChartArea1" BorderColor="64, 64, 64, 64" BackSecondaryColor="Transparent" BackColor="64, 165, 191, 228" ShadowColor="Transparent" BackGradientStyle="TopBottom"><Area3DStyle Rotation="10" Perspective="10" Enable3D="True" Inclination="15" IsRightAngleAxes="False" WallWidth="0" IsClustered="False"></Area3DStyle><AxisY LineColor="64, 64, 64, 64"><LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" Format="N2"></LabelStyle><MajorGrid LineColor="64, 64, 64, 64"></MajorGrid></AxisY><AxisX LineColor="64, 64, 64, 64"><LabelStyle Font="Arial, 8.25pt, style=Bold"></LabelStyle><MajorGrid LineColor="64, 64, 64, 64"></MajorGrid></AxisX></asp:ChartArea></ChartAreas></asp:Chart>
<aquarium:ControllerDataSource ID="ControllerDataSource1" runat="server" DataController="Trail_Balance_View" DataView="AnalyseTrailBalance" PageRequestParameterName="r" />