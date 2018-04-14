<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="AccountLedgers.aspx.vb" Inherits="Pages_AccountLedgers"  Title="^AccLed^Account Ledger^AccLed^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^AccLed^Account Ledger^AccLed^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div class="DataViewHeader">^BanAccLed^Bank Account Ledger^BanAccLed^</div>
    <div id="view1" data-controller="rpt_Account_Ledger" data-show-in-summary="true" data-show-view-selector="false" data-auto-highlight-first-row="true"></div>
  </div>
</asp:Content>