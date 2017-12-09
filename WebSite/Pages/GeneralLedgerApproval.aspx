<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="GeneralLedgerApproval.aspx.vb" Inherits="Pages_GeneralLedgerApproval"  Title="JV Approval" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">JV Approval</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div class="DataViewHeader">JV Approval</div>
    <div id="view1" data-controller="App_HotelApproval_GL"></div>
  </div>
</asp:Content>