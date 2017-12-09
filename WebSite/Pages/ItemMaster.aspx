<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ItemMaster.aspx.vb" Inherits="Pages_ItemMaster"  Title="^ItemMaster^Item Master^ItemMaster^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^ItemMaster^Item Master^ItemMaster^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="ItemMaster" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^PurchaseRequisitions^View PR^PurchaseRequisitions^">
      <div id="view2" data-controller="View_PR_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="Item_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^PurchaseOrders^View PO^PurchaseOrders^">
      <div id="view3" data-controller="View_PO_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="Item_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^BOQSalesLines^BOQ/Sales Lines^BOQSalesLines^">
      <div id="view4" data-controller="View_SO_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="Item_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^InventoryTransactions^Inventory Trx^InventoryTransactions^">
      <div id="view5" data-controller="View_Inventory_Lines" data-filter-source="view1" data-filter-fields="Item_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^Invoices^Invoices^Invoices^">
      <div id="view6" data-controller="View_Invoice_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="Item_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^ViewItemReservation^View Item Reservation^ViewItemReservation^">
      <div id="view8" data-controller="View_Item_Reservation" data-view="grid1" data-filter-source="view1" data-filter-fields="Item_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^TaxSetup^Tax Setup^TaxSetup^">
      <div id="view10" data-controller="Tax_On_GoodsAndServices_Setup" data-view="grid1" data-filter-source="view1" data-filter-fields="Item_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^ItemByStore^Item By Store^ItemByStore^">
      <div id="view11" data-controller="View_Store_Stock" data-view="grid1" data-filter-source="view1" data-filter-fields="Item_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^AccountsDimension^Accounts Dimension^AccountsDimension^">
      <div id="view9" data-controller="SYS_Default_Account" data-view="grid1" data-filter-source="view1" data-filter-fields="Item_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^ViewAccounting^View Accounting^ViewAccounting^">
      <div id="view7" data-controller="ViewAccounting" data-filter-source="view1" data-filter-fields="Item_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>