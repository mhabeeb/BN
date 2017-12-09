﻿<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Chart_CashFlowYearlySummary_Graph.ascx.vb" Inherits="Controls_Chart_CashFlowYearlySummary_Graph"  %><asp:Chart ID="Chart1" runat="server" BackColor="211, 223, 240" ImageLocation="~/TempImages/ChartPic_#SEQ(300,3)" Width="412px" Height="296px" BorderlineDashStyle="Solid" BackGradientStyle="TopBottom" BorderWidth="2px" BorderColor="#1A3B69" DataSourceID="ControllerDataSource1"><Legends><asp:Legend IsTextAutoFit="True" Name="Default" BackColor="Transparent" Font="Trebuchet MS, 8.25pt, style=Bold" Enabled="False" /></Legends><Series><asp:Series ChartArea="ChartArea1" IsValueShownAsLabel="True" Name="January" XValueMember="AccountDesription1" YValuesPerPoint="4" YValueMembers="January" ChartType="Bar" LabelFormat="{0:N2}" LegendText="^Jan^January^Jan^" />
    <asp:Series ChartArea="ChartArea1" IsValueShownAsLabel="True" Name="February" XValueMember="AccountDesription1" YValuesPerPoint="4" YValueMembers="February" ChartType="Bar" LabelFormat="{0:N2}" LegendText="^Feb^February^Feb^" />
    <asp:Series ChartArea="ChartArea1" IsValueShownAsLabel="True" Name="March" XValueMember="AccountDesription1" YValuesPerPoint="4" YValueMembers="March" ChartType="Bar" LabelFormat="{0:N2}" LegendText="^March^March^March^" />
    <asp:Series ChartArea="ChartArea1" IsValueShownAsLabel="True" Name="April" XValueMember="AccountDesription1" YValuesPerPoint="4" YValueMembers="April" ChartType="Bar" LabelFormat="{0:N2}" LegendText="^April^April^April^" />
    <asp:Series ChartArea="ChartArea1" IsValueShownAsLabel="True" Name="May" XValueMember="AccountDesription1" YValuesPerPoint="4" YValueMembers="May" ChartType="Bar" LabelFormat="{0:N2}" LegendText="^May^May^May^" />
    <asp:Series ChartArea="ChartArea1" IsValueShownAsLabel="True" Name="June" XValueMember="AccountDesription1" YValuesPerPoint="4" YValueMembers="June" ChartType="Bar" LabelFormat="{0:N2}" LegendText="^June^June^June^" />
    <asp:Series ChartArea="ChartArea1" IsValueShownAsLabel="True" Name="July" XValueMember="AccountDesription1" YValuesPerPoint="4" YValueMembers="July" ChartType="Bar" LabelFormat="{0:N2}" LegendText="^July^July^July^" />
    <asp:Series ChartArea="ChartArea1" IsValueShownAsLabel="True" Name="August" XValueMember="AccountDesription1" YValuesPerPoint="4" YValueMembers="August" ChartType="Bar" LabelFormat="{0:N2}" LegendText="^August^August^August^" />
    <asp:Series ChartArea="ChartArea1" IsValueShownAsLabel="True" Name="September" XValueMember="AccountDesription1" YValuesPerPoint="4" YValueMembers="September" ChartType="Bar" LabelFormat="{0:N2}" LegendText="^Sep^September^Sep^" />
    <asp:Series ChartArea="ChartArea1" IsValueShownAsLabel="True" Name="October" XValueMember="AccountDesription1" YValuesPerPoint="4" YValueMembers="October" ChartType="Bar" LabelFormat="{0:N2}" LegendText="^Oct^October^Oct^" />
    <asp:Series ChartArea="ChartArea1" IsValueShownAsLabel="True" Name="November" XValueMember="AccountDesription1" YValuesPerPoint="4" YValueMembers="November" ChartType="Bar" LabelFormat="{0:N2}" LegendText="^Nov^November^Nov^" />
    <asp:Series ChartArea="ChartArea1" IsValueShownAsLabel="True" Name="December" XValueMember="AccountDesription1" YValuesPerPoint="4" YValueMembers="December" ChartType="Bar" LabelFormat="{0:N2}" LegendText="^Dec^December^Dec^" /></Series><ChartAreas><asp:ChartArea Name="ChartArea1" BorderColor="64, 64, 64, 64" BackSecondaryColor="Transparent" BackColor="64, 165, 191, 228" ShadowColor="Transparent" BackGradientStyle="TopBottom"><Area3DStyle Rotation="10" Perspective="10" Enable3D="True" Inclination="15" IsRightAngleAxes="False" WallWidth="0" IsClustered="False"></Area3DStyle><AxisY LineColor="64, 64, 64, 64"><LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" Format="N2"></LabelStyle><MajorGrid LineColor="64, 64, 64, 64"></MajorGrid></AxisY><AxisX LineColor="64, 64, 64, 64"><LabelStyle Font="Arial, 8.25pt, style=Bold"></LabelStyle><MajorGrid LineColor="64, 64, 64, 64"></MajorGrid></AxisX></asp:ChartArea></ChartAreas></asp:Chart>
<aquarium:ControllerDataSource ID="ControllerDataSource1" runat="server" DataController="CashFlowYearlySummary" DataView="Graph" PageRequestParameterName="r" />