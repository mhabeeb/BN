<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="AccounLedgerDetails.aspx.vb" Inherits="Pages_AccounLedgerDetails"  Title="^AccountLedgerDetails^Account Ledger Details^AccountLedgerDetails^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^AccountLedgerDetails^Account Ledger Details^AccountLedgerDetails^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="rpt_Account_Proj_Dept_Sites" data-show-in-summary="true" data-show-view-selector="false"></div>
    <div id="view2" data-controller="ViewAccounting" data-view="grid1" data-filter-source="view1" data-filter-fields="Project_Code,CalcDate,OPU_Code,Dept_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
  </div>
</asp:Content>