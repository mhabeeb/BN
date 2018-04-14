<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="InventoryTransactions.aspx.vb" Inherits="Pages_InventoryTransactions"  Title="^InventoryTransactions^View Inventory Transactions^InventoryTransactions^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^InventoryTransactions^View Inventory Transactions^InventoryTransactions^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="View_Inventory_Lines" data-show-in-summary="true" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
  </div>
</asp:Content>