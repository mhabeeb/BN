<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ViewPayments.aspx.vb" Inherits="Pages_ViewPayments"  Title="^ViewPayments^View Payments^ViewPayments^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^ViewPayments^View Payments^ViewPayments^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="View_Payments_AP" data-show-in-summary="true" data-show-view-selector="false"></div>
  </div>
</asp:Content>