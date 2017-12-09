<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="BalanceSheetByProject.aspx.vb" Inherits="Pages_BalanceSheetByProject"  Title="^BalanceSheetByProject^Balance Sheet By Project ^BalanceSheetByProject^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^BalanceSheetByProject^Balance Sheet By Project ^BalanceSheetByProject^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="GL_DataWareHouse_BalanceSheet" data-show-in-summary="true" data-show-view-selector="false"></div>
  </div>
</asp:Content>