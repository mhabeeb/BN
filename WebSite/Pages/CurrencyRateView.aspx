<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="CurrencyRateView.aspx.vb" Inherits="Pages_CurrencyRateView"  Title="^CurrencyRateView^Currency Rate View^CurrencyRateView^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^CurrencyRateView^Currency Rate View^CurrencyRateView^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row" style="padding-top:8px">
    <div id="view1" data-controller="tbl_Currency_Rates" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true"></div>
  </div>
</asp:Content>