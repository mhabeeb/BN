<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="CustomerLedger.aspx.vb" Inherits="Pages_CustomerLedger"  Title="^CustomerLedger^Customer Ledger^CustomerLedger^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^CustomerLedger^Customer Ledger^CustomerLedger^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="CustomerLedger" data-show-view-selector="false" data-auto-highlight-first-row="true"></div>
  </div>
</asp:Content>