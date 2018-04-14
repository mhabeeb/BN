<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ItemAccountLedger.aspx.vb" Inherits="Pages_ItemAccountLedger"  Title="^ItemAccountLedger^Item Account Ledger^ItemAccountLedger^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^ItemAccountLedger^Item Account Ledger^ItemAccountLedger^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div class="DataViewHeader">^IteAccLed^Item Account Ledger^IteAccLed^</div>
    <div id="view1" data-controller="rpt_Accunt_Item_Ledger" data-show-in-summary="true" data-show-view-selector="false"></div>
    <div id="view2" data-controller="ViewAccounting" data-view="grid1" data-filter-source="view1" data-filter-fields="Item_Code,CalcDate,OPU_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
  </div>
</asp:Content>