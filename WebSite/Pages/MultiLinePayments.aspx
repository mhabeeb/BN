<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="MultiLinePayments.aspx.vb" Inherits="Pages_MultiLinePayments"  Title="^MultiLinePayments^Multi Line Payments^MultiLinePayments^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^MultiLinePayments^Multi Line Payments^MultiLinePayments^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="AP_MiscCashExpenceMultiLine" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^DistributionLines^Distribution Lines^DistributionLines^">
      <div id="view2" data-controller="APAR_Payments_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="PaymentID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^ViewAccounting^View Accounting^ViewAccounting^">
      <div id="view3" data-controller="ViewAccounting" data-filter-source="view1" data-filter-fields="PaymentID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>