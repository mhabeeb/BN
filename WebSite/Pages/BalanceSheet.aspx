<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="BalanceSheet.aspx.vb" Inherits="Pages_BalanceSheet"  Title="Balance Sheet By Project" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">Balance Sheet By Project</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="BI_BALANCE_SHEET"></div>
  </div>
</asp:Content>