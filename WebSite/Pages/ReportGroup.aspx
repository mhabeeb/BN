<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ReportGroup.aspx.vb" Inherits="Pages_ReportGroup"  Title="^ReportGroup^Report Group^ReportGroup^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^ReportGroup^Report Group^ReportGroup^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Rpt_Group_Information" data-show-view-selector="false" data-auto-highlight-first-row="true"></div>
  </div>
</asp:Content>