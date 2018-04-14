<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="SalesOrder_1.aspx.vb" Inherits="Pages_SalesOrder_1"  Title="^ContractBillOfQuantity^Contract Bill Of Quantity^ContractBillOfQuantity^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^ContractBillOfQuantity^Contract Bill Of Quantity^ContractBillOfQuantity^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="SOBOQ_Header" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^BOQLines^BOQ Lines^BOQLines^">
      <div id="view2" data-controller="SOBOQ_Line_Items" data-view="grid1" data-show-in-summary="true" data-filter-source="view1" data-filter-fields="SO_NO" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^PurchaseOrders^Purchase Orders^PurchaseOrders^">
      <div id="view7" data-controller="View_PO_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="SO_NO" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^Requsitions^Requsitions^Requsitions^">
      <div id="view4" data-controller="View_PR_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="SO_NO" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^InventoryTransaction^Inventory Transaction^InventoryTransaction^">
      <div id="view5" data-controller="View_Inventory_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="SO_NO" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^Invoices^Invoices^Invoices^">
      <div id="view6" data-controller="View_Invoice_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="SO_NO" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^ImportBOQ^ImportBOQ^ImportBOQ^">
      <div id="view8" data-controller="Import_BOQ" data-view="grid1" data-filter-source="view1" data-filter-fields="SO_NO" data-page-size="5" data-show-modal-forms="true"></div>
    </div>
    <div id="view3" data-controller="SOBOQ_Line_Items_Child" data-view="grid1" data-filter-source="view2" data-filter-fields="Parent_SO_Line_No,SO_NO,Project_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
  </div>
</asp:Content>