<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="SalesLinesStatus.aspx.vb" Inherits="Pages_SalesLinesStatus"  Title="^SalesLinesStatus^Sales Lines Status^SalesLinesStatus^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^SalesLinesStatus^Sales Lines Status^SalesLinesStatus^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div data-activator="Tab|^PurchaseRequsition^Purchase Requsition^PurchaseRequsition^">
      <div id="view3" data-controller="View_PR_Lines" data-view="grid1" data-show-in-summary="true" data-filter-fields="SO_Line_No" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true" data-search-by-first-letter="true"></div>
    </div>
    <div data-activator="Tab|^PurchaseOrder^Purchase Order^PurchaseOrder^">
      <div id="view2" data-controller="View_PO_Lines" data-view="grid1" data-filter-fields="SO_Line_No" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true" data-search-by-first-letter="true"></div>
    </div>
    <div data-activator="Tab|^InventoryTransactions^Inventory Transactions^InventoryTransactions^">
      <div id="view4" data-controller="View_Inventory_Lines" data-filter-fields="SO_Line_No,SO_NO" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true" data-search-by-first-letter="true"></div>
    </div>
    <div data-activator="Tab|^InvoiceTransactions^Invoice Transactions^InvoiceTransactions^">
      <div id="view5" data-controller="View_Invoice_Lines" data-view="grid1" data-filter-fields="SO_Line_No,SO_NO" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true" data-search-by-first-letter="true"></div>
    </div>
  </div>
</asp:Content>