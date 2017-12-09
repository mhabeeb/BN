<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="CashSales.aspx.vb" Inherits="Pages_CashSales"  Title="^CashSales^Cash Sales^CashSales^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^CashSales^Cash Sales^CashSales^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="CashSales_Header" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^CashSalesLines^Cash Sales Lines^CashSalesLines^">
      <div id="view2" data-controller="CashSales_Line" data-view="grid1" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^Payment^Payment^Payment^">
      <div id="view4" data-controller="CashSalePurch_Payment" data-view="grid1" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^ViewAccounting^View Accounting^ViewAccounting^">
      <div id="view3" data-controller="ViewAccounting" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^StockByBatch^Stock By Batch^StockByBatch^">
      <div id="view5" data-controller="Pick_SerialBatchExpiry" data-show-view-selector="false"></div>
    </div>
  </div>
</asp:Content>