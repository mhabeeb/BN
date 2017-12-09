<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="COA.aspx.vb" Inherits="Pages_COA"  Title="^ChartofAccounts^Chart of Accounts^ChartofAccounts^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^ChartofAccounts^Chart of Accounts^ChartofAccounts^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="COA_Natural_Account" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^ViewLedger^View Ledger^ViewLedger^">
      <div id="view2" data-controller="ViewAccounting_COA" data-view="grid1" data-filter-source="view1" data-filter-fields="Account_Type" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^IncomeStatmentSummary^Income Statment Summary^IncomeStatmentSummary^">
      <div id="view3" data-controller="GL_InComeStatments" data-view="grid1" data-filter-source="view1" data-filter-fields="AccountID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>