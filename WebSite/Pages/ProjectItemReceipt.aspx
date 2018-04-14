<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ProjectItemReceipt.aspx.vb" Inherits="Pages_ProjectItemReceipt"  Title="^ProjectItemReceipt^Project Item Receipt^ProjectItemReceipt^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^ProjectItemReceipt^Project Item Receipt^ProjectItemReceipt^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Misc_Inventory_Receipt" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^ItemReceiptLine^Item Receipt Line^ItemReceiptLine^">
      <div id="view2" data-controller="Misc_Inventory_Line_BOQ_Receipt" data-view="grid1" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^ViewAccounting^View Accounting^ViewAccounting^">
      <div id="view3" data-controller="ViewAccounting" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div class="DataViewHeader">^Locator^Locator Control^Locator^</div>
    <div id="view5" data-controller="tbl_Transactions_Locator" data-view="grid1" data-filter-source="view2" data-filter-fields="Trx_Line_ID,Item_Code" data-page-size="5" data-show-view-selector="false" data-auto-hide="self" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
  </div>
</asp:Content>