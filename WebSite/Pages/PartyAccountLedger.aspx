<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="PartyAccountLedger.aspx.vb" Inherits="Pages_PartyAccountLedger"  Title="^PartyAccountLedger^Party Account Ledger^PartyAccountLedger^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^PartyAccountLedger^Party Account Ledger^PartyAccountLedger^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div class="DataViewHeader">Party Account Ledger</div>
    <div id="view1" data-controller="rpt_Customer_Supplier_Accounts_ledger" data-show-in-summary="true" data-show-view-selector="false" data-auto-highlight-first-row="true"></div>
    <div id="view2" data-controller="ViewAccounting" data-view="grid1" data-filter-source="view1" data-filter-fields="Sys_Number,CalcDate,OPU_Code" data-page-size="5" data-show-view-selector="false" data-auto-hide="self" data-show-modal-forms="true"></div>
  </div>
</asp:Content>