<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="InventoryByBarcode.aspx.vb" Inherits="Pages_InventoryByBarcode"  Title="^InventoryByBarcode^Inventory By Barcode^InventoryByBarcode^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^InventoryByBarcode^Inventory By Barcode^InventoryByBarcode^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="BarcodeTransactions" data-show-in-summary="true" data-show-view-selector="false"></div>
  </div>
</asp:Content>