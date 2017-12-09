<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="SupplierLedger.aspx.vb" Inherits="Pages_SupplierLedger"  Title="^SupplierLedger^Supplier Ledger^SupplierLedger^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^SupplierLedger^Supplier Ledger^SupplierLedger^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="SupplierLedger" data-show-view-selector="false" data-auto-highlight-first-row="true"></div>
  </div>
</asp:Content>