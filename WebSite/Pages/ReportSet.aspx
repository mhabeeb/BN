<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ReportSet.aspx.vb" Inherits="Pages_ReportSet"  Title="^ReportSet^Report Set^ReportSet^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^ReportSet^Report Set^ReportSet^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Rpt_Group_Reports_Set" data-show-view-selector="false" data-auto-highlight-first-row="true"></div>
  </div>
</asp:Content>