<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="AccounLedgerDimenssion.aspx.vb" Inherits="Pages_AccounLedgerDimenssion"  Title="^AccountLedgerDimenssion^Account Ledger Dimenssion^AccountLedgerDimenssion^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^AccountLedgerDimenssion^Account Ledger Dimenssion^AccountLedgerDimenssion^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="rpt_Account_Ledger_Dimenssion" data-show-in-summary="true" data-show-view-selector="false"></div>
    <div id="view2" data-controller="ViewAccounting" data-view="grid1" data-filter-source="view1" data-filter-fields="AccountID,CalcDate,OPU_Code,Project_Code,Dept_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
  </div>
</asp:Content>