<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="Misc_CashExpence.aspx.vb" Inherits="Pages_Misc_CashExpence"  Title="^MiscCasExp^Misc Cash Expense^MiscCasExp^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^MiscCasExp^Misc Cash Expense^MiscCasExp^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="AP_MiscCashExpence" data-show-in-summary="true" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div id="view2" data-controller="ViewAccounting" data-filter-source="view1" data-filter-fields="PaymentID" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
  </div>
</asp:Content>