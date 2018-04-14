<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="PurchaseOrder.aspx.vb" Inherits="Pages_PurchaseOrder"  Title="^PurchaseOrder^Purchase Order^PurchaseOrder^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^PurchaseOrder^Purchase Order^PurchaseOrder^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="PO_Header" data-show-in-summary="true" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^POLines^PO Lines^POLines^">
      <div id="view2" data-controller="PO_Line_Items" data-view="grid1" data-show-in-summary="true" data-filter-source="view1" data-filter-fields="PO_NO" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-start-command-name="Select" data-show-modal-forms="true" data-auto-select-first-row="true" data-auto-highlight-first-row="true"></div>
    </div>
    <div data-activator="Tab|^AddFromPR^Add From PR^AddFromPR^">
      <div id="view4" data-controller="PR_Open_Pick" data-view="grid1" data-filter-source="view1" data-filter-fields="PO_NO" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^InventoryTransactions^Inventory Transactions^InventoryTransactions^">
      <div id="view6" data-controller="View_Inventory_Lines" data-filter-source="view1" data-filter-fields="PO_NO" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^Invoices^Invoices^Invoices^">
      <div id="view7" data-controller="View_Invoice_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="PO_NO" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^AddFromBOQSO^Add From BOQ/SO^AddFromBOQSO^">
      <div id="view5" data-controller="Pick_SO_PO" data-view="grid1" data-filter-source="view1" data-filter-fields="PO_NO" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^AddfromDR^Add from DR^AddfromDR^">
      <div id="view8" data-controller="Pick_for_PO_From_DR" data-view="grid1" data-filter-source="view1" data-filter-fields="PO_NO" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div id="view3" data-controller="Pick_Item_Master" data-view="grid1" data-filter-source="view2" data-filter-fields="Item_Code" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    <div data-activator="Tab|^ParLoc^Party Locations^ParLoc^">
      <div id="view9" data-controller="tbl_Locations" data-view="grid1" data-filter-source="view1" data-filter-fields="Sys_Number" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>