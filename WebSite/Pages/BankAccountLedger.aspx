<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="BankAccountLedger.aspx.vb" Inherits="Pages_BankAccountLedger"  Title="^BankAccountLedger^Bank Account Ledger^BankAccountLedger^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^BankAccountLedger^Bank Account Ledger^BankAccountLedger^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="rpt_Account_Bank_ledger" data-show-in-summary="true" data-show-view-selector="false"></div>
    <div id="view2" data-controller="ViewAccounting" data-view="grid1" data-filter-source="view1" data-filter-fields="CashBankID,CalcDate,OPU_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
  </div>
</asp:Content>