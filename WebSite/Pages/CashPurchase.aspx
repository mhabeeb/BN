<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="CashPurchase.aspx.vb" Inherits="Pages_CashPurchase"  Title="^CashPurchase^Cash Purchase^CashPurchase^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^CashPurchase^Cash Purchase^CashPurchase^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div data-activator="Tab|^ItemStock^Item Stock^ItemStock^">
      <div id="view5" data-controller="Pick_Item_Master" data-view="grid1" data-filter-fields="Item_Code" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^StoreWiseStock^Store Wise Stock^StoreWiseStock^">
      <div id="view6" data-controller="View_Item_Stock" data-view="grid1" data-filter-fields="Item_Code" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^BatchSerialStock^Batch &amp; Serial Stock^BatchSerialStock^">
      <div id="view7" data-controller="Pick_SerialBatchExpiry" data-view="grid1" data-filter-fields="Item_Code" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div class="DataViewHeader">^Locator^Locator Control^Locator^</div>
    <div id="view3" data-controller="tbl_Transactions_Locator" data-view="grid1" data-filter-fields="Trx_Line_ID,Item_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true" data-visible-when="[Master.LocatorYN] ==1"></div>
  </div>
</asp:Content>