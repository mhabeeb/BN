<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="CashSales.aspx.vb" Inherits="Pages_CashSales"  Title="^CashSales^Cash Sales^CashSales^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^CashSales^Cash Sales^CashSales^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div data-activator="Tab|^ViewAccounting^View Accounting^ViewAccounting^">
      <div id="view3" data-controller="ViewAccounting" data-filter-fields="Transaction_ID" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^StockByBatch^Stock By Batch^StockByBatch^">
      <div id="view5" data-controller="Pick_SerialBatchExpiry" data-show-description="false" data-show-view-selector="false"></div>
    </div>
    <div data-activator="Tab|^PicFroLoc^Pick From Locator^PicFroLoc^">
      <div id="view7" data-controller="Pick_from_Locator" data-view="grid1" data-filter-fields="Line_ID,StoreID,Item_Code" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div class="DataViewHeader">Locator Transactions</div>
    <div id="view6" data-controller="tbl_Transactions_Locator_Readonly" data-view="grid1" data-filter-fields="Trx_Line_ID" data-page-size="5" data-auto-hide="self" data-show-modal-forms="true"></div>
  </div>
</asp:Content>