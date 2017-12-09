<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ExpectedReceipts.aspx.vb" Inherits="Pages_ExpectedReceipts"  Title="Expected Receipts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">Expected Receipts</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Auto_Expected_PO_Receipt"></div>
  </div>
</asp:Content>