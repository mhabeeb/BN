<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="CashPurchase.aspx.vb" Inherits="Pages_CashPurchase"  Title="^CashPurchase^Cash Purchase^CashPurchase^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^CashPurchase^Cash Purchase^CashPurchase^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="CashPurchase_Header" data-show-in-summary="true" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^CashPurchaseLines^Cash Purchase Lines^CashPurchaseLines^">
      <div id="view2" data-controller="CashPurchase_Line" data-view="grid1" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^Payment^Payment^Payment^">
      <div id="view4" data-controller="CashSalePurch_Payment" data-view="grid1" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^ItemStock^Item Stock^ItemStock^">
      <div id="view5" data-controller="Pick_Item_Master" data-view="grid1" data-filter-source="view2" data-filter-fields="Item_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^StoreWiseStock^Store Wise Stock^StoreWiseStock^">
      <div id="view6" data-controller="View_Item_Stock" data-view="grid1" data-filter-source="view2" data-filter-fields="Item_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^BatchSerialStock^Batch &amp; Serial Stock^BatchSerialStock^">
      <div id="view7" data-controller="Pick_SerialBatchExpiry" data-view="grid1" data-filter-source="view2" data-filter-fields="Item_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>