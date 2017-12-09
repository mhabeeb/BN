<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="PurchaseReturn.aspx.vb" Inherits="Pages_PurchaseReturn"  Title="^PurchaseReturn^Purchase Return^PurchaseReturn^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^PurchaseReturn^Purchase Return^PurchaseReturn^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="PO_Receipt_Header_Return" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^ReturnLines^Return Lines^ReturnLines^">
      <div id="view2" data-controller="PO_Receipt_Line_Return" data-view="grid1" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false"></div>
    </div>
    <div data-activator="Tab|^PickFromPOReceipt^Pick From PO Receipt^PickFromPOReceipt^">
      <div id="view4" data-controller="Pick_RGS_PO" data-filter-source="view1" data-filter-fields="Transaction_ID,Sys_Number" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^ViewAccounting^View Accounting^ViewAccounting^">
      <div id="view3" data-controller="ViewAccounting" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>