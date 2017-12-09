<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="LedgerConsolidations.aspx.vb" Inherits="Pages_LedgerConsolidations"  Title="^LedgerConsolidations^Ledger Consolidations^LedgerConsolidations^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^LedgerConsolidations^Ledger Consolidations^LedgerConsolidations^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Ledger_Consolidations" data-show-view-selector="false" data-auto-highlight-first-row="true"></div>
    <div id="view2" data-controller="Ledger_Consolidation_Details" data-view="grid1" data-filter-source="view1" data-filter-fields="Cons_ID" data-page-size="5" data-show-view-selector="false" data-auto-hide="self" data-show-modal-forms="true"></div>
  </div>
</asp:Content>