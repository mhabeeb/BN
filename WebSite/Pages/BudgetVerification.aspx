<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="BudgetVerification.aspx.vb" Inherits="Pages_BudgetVerification"  Title="^BudgetView^Budget View^BudgetView^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^BudgetView^Budget View^BudgetView^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Budget_Verification" data-show-in-summary="true" data-show-view-selector="false"></div>
  </div>
</asp:Content>