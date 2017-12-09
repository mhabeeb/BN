<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="StockByBatch_Serial.aspx.vb" Inherits="Pages_StockByBatch_Serial"  Title="^StockByBatch&Serial^Stock By Batch & Serial^StockByBatch&Serial^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^StockByBatch&amp;Serial^Stock By Batch &amp; Serial^StockByBatch&amp;Serial^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="tbl_Transactions_Batch_Expiry" data-show-in-summary="true" data-show-view-selector="false"></div>
  </div>
</asp:Content>