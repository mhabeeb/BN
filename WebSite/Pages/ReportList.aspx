<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ReportList.aspx.vb" Inherits="Pages_ReportList"  Title="^ReportList^Report List^ReportList^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^ReportList^Report List^ReportList^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Rpt_Reports_List" data-show-view-selector="false" data-show-modal-forms="true"></div>
  </div>
</asp:Content>