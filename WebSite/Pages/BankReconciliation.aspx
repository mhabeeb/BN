<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="BankReconciliation.aspx.vb" Inherits="Pages_BankReconciliation"  Title="^BanRec^Bank Reconcilation^BanRec^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^BanRec^Bank Reconcilation^BanRec^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="BankReconciliations" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|Uncleared">
      <div id="view2" data-controller="ViewAccounting" data-view="grid1" data-filter-source="view1" data-filter-fields="PaymentID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|Cleared">
      <div id="view3" data-controller="ViewAccountingUnclear" data-view="grid1" data-filter-source="view1" data-filter-fields="PaymentID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>