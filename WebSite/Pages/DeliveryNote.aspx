<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="DeliveryNote.aspx.vb" Inherits="Pages_DeliveryNote"  Title="^DeliveryNote^Delivery Note^DeliveryNote^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^DeliveryNote^Delivery Note^DeliveryNote^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div data-activator="Tab|^InvoiceLines^Invoice Lines^InvoiceLines^">
      <div id="view8" data-controller="View_Invoice_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div id="view1" data-controller="Delivery_Note_Header" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true"></div>
    <div data-activator="Tab|^DeliveryLines^Delivery Lines^DeliveryLines^">
      <div id="view2" data-controller="Delivery_Note_Line" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^PickFromDeliveryRequest^Pick From Delivery Request^PickFromDeliveryRequest^">
      <div id="view6" data-controller="Pick_DR_for_DV" data-view="grid1" data-filter-source="view1" data-filter-fields="Transaction_ID,Sys_Number" data-page-size="5" data-show-view-selector="false"></div>
    </div>
    <div data-activator="Tab|^PicFroLoc^Pick From Locator^PicFroLoc^">
      <div id="view10" data-controller="Pick_from_Locator" data-view="grid1" data-filter-source="view2" data-filter-fields="Line_ID,StoreID,Item_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true" data-visible-when="[Master.LocatorYN] ==1"></div>
    </div>
    <div data-activator="Tab|^AddFromBOQSO^Add From BOQ/SO^AddFromBOQSO^">
      <div id="view3" data-controller="Delivery_Note_from_SO" data-view="grid1" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^ViewAccounting^View Accounting^ViewAccounting^">
      <div id="view5" data-controller="ViewAccounting" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^StockOnHand^Stock On Hand^StockOnHand^">
      <div id="view7" data-controller="View_Item_Stock" data-view="grid1" data-filter-source="view3" data-filter-fields="Item_Code" data-page-size="10" data-show-description="false" data-show-view-selector="false" data-show-details-in-list-mode="false" data-show-page-size="false" data-show-quick-find="false"></div>
    </div>
    <div data-activator="Tab|^StockByBatchSerialNo^Stock By Batch/Serial No.^StockByBatchSerialNo^">
      <div id="view4" data-controller="Pick_SerialBatchExpiry" data-view="grid1" data-filter-source="view3" data-filter-fields="Item_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^AddFromProject^Add From Project^AddFromProject^">
      <div id="view9" data-controller="Delivery_Note_from_SO_Project" data-view="grid1" data-filter-source="view1" data-filter-fields="Project_Code,Transaction_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div class="DataViewHeader">^LocTra^Locator Transactions^LocTra^</div>
    <div id="view11" data-controller="tbl_Transactions_Locator_Readonly" data-view="Readonly1" data-filter-source="view2" data-filter-fields="Trx_Line_ID" data-page-size="5" data-show-view-selector="false" data-auto-hide="self" data-show-modal-forms="true" data-visible-when="[Master.LocatorYN] ==1"></div>
  </div>
</asp:Content>