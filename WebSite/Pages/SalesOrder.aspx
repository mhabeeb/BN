<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="SalesOrder.aspx.vb" Inherits="Pages_SalesOrder"  Title="^SalesOrder^Sales Order^SalesOrder^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^SalesOrder^Sales Order^SalesOrder^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="SO_Header" data-show-in-summary="true" data-show-action-buttons="top" data-show-view-selector="false" data-show-modal-forms="true" data-show-details-in-list-mode="false" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^SOLines^SO Lines^SOLines^">
      <div id="view2" data-controller="SO_Line_Items" data-view="grid1" data-show-in-summary="true" data-filter-source="view1" data-filter-fields="SO_NO" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true" data-show-row-number="true"></div>
    </div>
    <div data-activator="Tab|^OpenQuotations^Open Quotations^OpenQuotations^">
      <div id="view3" data-controller="Pick_Qoutation_for_SO" data-view="grid1" data-filter-source="view1" data-filter-fields="SO_NO" data-page-size="5" data-show-view-selector="false"></div>
    </div>
    <div data-activator="Tab|^PurchaseOrder^Purchase Order^PurchaseOrder^">
      <div id="view4" data-controller="View_PO_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="SO_NO" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^Requisitions^Requisitions^Requisitions^">
      <div id="view5" data-controller="View_PR_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="SO_NO" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^Invoices^Invoices^Invoices^">
      <div id="view6" data-controller="View_Invoice_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="SO_NO" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^InventoryTransactions^InventoryTransactions^InventoryTransactions^">
      <div id="view7" data-controller="View_Inventory_Lines" data-filter-source="view1" data-filter-fields="SO_NO" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div class="DataViewHeader">^StockOnHand^Stock On Hand^StockOnHand^</div>
    <div id="view8" data-controller="Pick_Item_Master" data-view="grid1" data-show-in-summary="true" data-filter-source="view2" data-filter-fields="Item_Code" data-page-size="5" data-show-view-selector="false" data-auto-hide="self" data-show-modal-forms="true"></div>
    <div id="view9" data-controller="View_Item_Reservation" data-view="grid1" data-filter-source="view2" data-filter-fields="SO_Line_No" data-page-size="5" data-show-modal-forms="true"></div>
  </div>
</asp:Content>