<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="AccountLedger.aspx.vb" Inherits="Pages_AccountLedger"  Title="^AccountLedger^Account Ledger^AccountLedger^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^AccountLedger^Account Ledger^AccountLedger^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="GL_DataWareHouse" data-show-in-summary="true" data-show-view-selector="false" data-auto-highlight-first-row="true"></div>
  </div>
</asp:Content>