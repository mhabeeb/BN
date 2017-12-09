<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ViewInventoryTransactions.aspx.vb" Inherits="Pages_ViewInventoryTransactions"  Title="^ViewInventoryTransactions^View Inventory Transactions^ViewInventoryTransactions^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^ViewInventoryTransactions^View Inventory Transactions^ViewInventoryTransactions^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="View_Inventory_Lines" data-show-in-summary="true"></div>
  </div>
</asp:Content>