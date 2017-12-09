<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="AccountStatments.aspx.vb" Inherits="Pages_AccountStatments"  Title="^AccountStatement^Account Statement^AccountStatement^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^AccountStatement^Account Statement^AccountStatement^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="GLAccountOfStatments" data-show-in-summary="true" data-show-view-selector="false"></div>
  </div>
</asp:Content>