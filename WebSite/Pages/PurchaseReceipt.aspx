<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="PurchaseReceipt.aspx.vb" Inherits="Pages_PurchaseReceipt"  Title="^PurchaseReceipt^Purchase Receipt^PurchaseReceipt^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^PurchaseReceipt^Purchase Receipt^PurchaseReceipt^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="PO_Receipt_Header" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^ReceiptLines^Receipt Lines^ReceiptLines^">
      <div id="view2" data-controller="PO_Receipt_line" data-view="grid1" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false"></div>
    </div>
    <div data-activator="Tab|^ExpectedShipment^Expected Shipment^ExpectedShipment^">
      <div id="view3" data-controller="PO_Receipt_Expected" data-view="grid1" data-filter-source="view1" data-filter-fields="Transaction_ID,Sys_Number" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^ViewAccounting^View Accounting^ViewAccounting^">
      <div id="view4" data-controller="ViewAccounting" data-view="grid1" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^LandedCost^Landed Cost^LandedCost^">
      <div id="view5" data-controller="PO_Receipt_LCM" data-view="grid1" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^QAQC^QA/QC^QAQC^">
      <div id="view6" data-controller="QAQC_Recording" data-view="grid1" data-filter-source="view2" data-filter-fields="Line_ID" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-start-command-argument="XXXXX" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^Rejected^Rejected^Rejected^">
      <div id="view7" data-controller="PO_Receipt_line_Reject" data-view="grid1" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div class="DataViewHeader">^Locator^Locator Control^Locator^</div>
    <div id="view8" data-controller="tbl_Transactions_Locator" data-view="grid1" data-filter-source="view2" data-filter-fields="Trx_Line_ID,Item_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true" data-visible-when="[Master.LocatorYN] ==1"></div>
  </div>
</asp:Content>