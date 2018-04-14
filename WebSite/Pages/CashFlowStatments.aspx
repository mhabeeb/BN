<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="CashFlowStatments.aspx.vb" Inherits="Pages_CashFlowStatments"  Title="^CashFlowStatments^Cash Flow Statements^CashFlowStatments^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^CashFlowStatments^Cash Flow Statements^CashFlowStatments^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div data-activator="Tab|">
      <div id="view1" data-controller="CashFlowStatments" data-view="grid1" data-show-in-summary="true" data-page-size="25" data-show-view-selector="false" data-show-modal-forms="true" data-search-on-start="true" data-show-row-number="true"></div>
    </div>
  </div>
  <div data-flow="row" style="padding-top:8px">
    <div data-activator="Tab|^CasFloSta^Cash Flow Statement^CasFloSta^">
      <div id="view2" data-controller="CashFlowStatments" data-show-in-summary="true" data-page-size="25" data-show-view-selector="false" data-search-by-first-letter="true" data-show-row-number="true"></div>
    </div>
    <div data-activator="Tab|^CashFlowyearlySummary^Cash Flow yearly Summary^CashFlowyearlySummary^">
      <div id="view3" data-controller="CashFlowYearlySummary" data-show-view-selector="false"></div>
    </div>
    <div data-activator="Tab|^SupplierAgeing^Supplier Ageing^SupplierAgeing^">
      <div id="view4" data-controller="AP_Ageing" data-show-view-selector="false"></div>
    </div>
    <div data-activator="Tab|^CustomerAgeing^Customer Ageing^CustomerAgeing^">
      <div id="view5" data-controller="AR_Ageing" data-show-view-selector="false"></div>
    </div>
  </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SideBarPlaceHolder" runat="Server">
  <div class="TaskBox About">
    <div class="Inner">
      <div class="Header">About</div>
      <div class="Value">This page allows cash flow statments management.</div>
    </div>
  </div>
</asp:Content>