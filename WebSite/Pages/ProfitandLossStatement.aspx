<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ProfitandLossStatement.aspx.vb" Inherits="Pages_ProfitandLossStatement"  Title="^ProfitandLossStatement^Profit and Loss Statement^ProfitandLossStatement^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^ProfitandLossStatement^Profit and Loss Statement^ProfitandLossStatement^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row" style="padding-top:8px">
    <div id="view2" data-controller="Profit_and_Loss_View" data-show-in-summary="true" data-page-size="15" data-show-view-selector="false" data-auto-highlight-first-row="true"></div>
  </div>
</asp:Content>