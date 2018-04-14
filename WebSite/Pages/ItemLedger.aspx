<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ItemLedger.aspx.vb" Inherits="Pages_ItemLedger"  Title="^ItemLedger^Item Ledger^ItemLedger^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^ItemLedger^Item Ledger^ItemLedger^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="ItemLedger" data-show-in-summary="true" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    <div class="DataViewHeader">^ViewInventoryTransactions^View Inventory Transactions^ViewInventoryTransactions^</div>
    <div id="view2" data-controller="View_Inventory_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="Item_Code" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
  </div>
</asp:Content>