<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="CreditSales.aspx.vb" Inherits="Pages_CreditSales"  Title="Credit Sales Invoice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">Credit Sales Invoice</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Credit_Sales_Header" data-show-view-selector="false" data-show-modal-forms="true" data-search-by-first-letter="true"></div>
    <div data-activator="Tab|Invoice Line">
      <div id="view2" data-controller="Credit_Sales_Line" data-view="grid1" data-filter-source="view1" data-filter-fields="Trx_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|View Accounting">
      <div id="view3" data-controller="ViewAccounting" data-view="grid1" data-filter-source="view1" data-filter-fields="Trx_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|View Payment">
      <div id="view4" data-controller="View_Payments" data-view="grid1" data-filter-source="view1" data-filter-fields="Trx_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>