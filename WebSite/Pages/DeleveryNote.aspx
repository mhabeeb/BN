<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="DeleveryNote.aspx.vb" Inherits="Pages_DeleveryNote"  Title="^DeleveryNote^Delivery Note^DeleveryNote^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^DeleveryNote^Delivery Note^DeleveryNote^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Delivery_Note_Header" data-show-in-summary="true" data-show-modal-forms="true" data-search-by-first-letter="true"></div>
    <div data-activator="Tab|^DeliveryLines^Delivery Lines^DeliveryLines^">
      <div id="view2" data-controller="Delivery_Note_Line" data-view="grid1" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-row-number="true"></div>
    </div>
    <div data-activator="Tab|^AddFromBOQSO^Add From BOQ/SO^AddFromBOQSO^">
      <div id="view3" data-controller="Delivery_Note_from_SO" data-view="grid1" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5"></div>
    </div>
    <div data-activator="Tab|^ViewAccounting^View Accounting^ViewAccounting^">
      <div id="view5" data-controller="ViewAccounting" data-view="grid1" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^PickFromDeliveryRequest^Pick From Delivery Request^PickFromDeliveryRequest^">
      <div id="view6" data-controller="Pick_DR_for_DV" data-view="grid1" data-filter-source="view1" data-filter-fields="Transaction_ID,Sys_Number" data-page-size="5"></div>
    </div>
    <div data-activator="Tab|^InvoiceLines^Invoice Lines^InvoiceLines^">
      <div id="view8" data-controller="View_Invoice_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|Stock On Hand">
      <div id="view7" data-controller="View_Item_Stock" data-view="grid1" data-filter-source="view3" data-filter-fields="Item_Code" data-page-size="10" data-show-action-bar="false" data-show-description="false" data-show-view-selector="false" data-show-details-in-list-mode="false" data-show-page-size="false" data-show-quick-find="false" data-show-search-bar="false"></div>
    </div>
    <div data-activator="Tab|Stock By Batch/Serial No.">
      <div id="view4" data-controller="Pick_SerialBatchExpiry" data-view="grid1" data-filter-source="view3" data-filter-fields="Item_Code" data-page-size="5" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>