<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="StoreAccountLedger.aspx.vb" Inherits="Pages_StoreAccountLedger"  Title="^StoreAccountLedger^Store Account Ledger^StoreAccountLedger^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^StoreAccountLedger^Store Account Ledger^StoreAccountLedger^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="rpt_Account_Store" data-show-in-summary="true" data-show-view-selector="false"></div>
    <div id="view2" data-controller="ViewAccounting" data-view="grid1" data-filter-source="view1" data-filter-fields="Store_ID,CalcDate,OPU_Code" data-page-size="5" data-show-view-selector="false" data-auto-hide="self" data-show-modal-forms="true"></div>
  </div>
</asp:Content>