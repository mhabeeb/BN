<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="BankReconciliation.aspx.vb" Inherits="Pages_BankReconciliation"  Title="^BankReconciliation^Bank Reconciliation^BankReconciliation^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^BankReconciliation^Bank Reconciliation^BankReconciliation^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="BankReconciliations" data-show-in-summary="true" data-show-view-selector="false" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|">
      <div id="view2" data-controller="ViewAccounting" data-filter-source="view1" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>