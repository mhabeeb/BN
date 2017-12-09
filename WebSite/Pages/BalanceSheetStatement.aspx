<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="BalanceSheetStatement.aspx.vb" Inherits="Pages_BalanceSheetStatement"  Title="^BalanceSheetStatement^Balance Sheet Statement^BalanceSheetStatement^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^BalanceSheetStatement^Balance Sheet Statement^BalanceSheetStatement^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view2" data-controller="Balance_Sheet_View" data-show-in-summary="true" data-page-size="15" data-show-view-selector="false" data-auto-highlight-first-row="true" data-show-row-number="true"></div>
  </div>
</asp:Content>