<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ProgressDeliveryNote.aspx.vb" Inherits="Pages_ProgressDeliveryNote"  Title="^ProgressDeliveryNote^Progress Delivery Note^ProgressDeliveryNote^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^ProgressDeliveryNote^Progress Delivery Note^ProgressDeliveryNote^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Delivery_Note_Header_BOQ" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^DeliveryLines^Delivery Lines^DeliveryLines^">
      <div id="view2" data-controller="Delivery_Note_Line" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false"></div>
    </div>
    <div data-activator="Tab|^AddFromBOQ^Add From BOQ^AddFromBOQ^">
      <div id="view3" data-controller="Delivery_Note_from_SO" data-view="grid1" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false"></div>
    </div>
    <div data-activator="Tab|^InvoiceLines^Invoice Lines^InvoiceLines^">
      <div id="view8" data-controller="View_Invoice_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^ViewAccounting^View Accounting^ViewAccounting^">
      <div id="view5" data-controller="ViewAccounting" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^PicFroLoc^Pick From Locator^PicFroLoc^">
      <div id="view6" data-controller="Pick_from_Locator" data-view="grid1" data-filter-source="view2" data-filter-fields="Trx_Line_ID,StoreID,Item_Code" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div class="DataViewHeader">^LocTra^Locator Transactions^LocTra^</div>
    <div id="view4" data-controller="tbl_Transactions_Locator_Readonly" data-view="Readonly1" data-filter-source="view2" data-filter-fields="Trx_Line_ID" data-page-size="5" data-auto-hide="self" data-show-modal-forms="true"></div>
  </div>
</asp:Content>