<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="FullPOReceipt.aspx.vb" Inherits="Pages_FullPOReceipt"  Title="^FullPOReceipt^Full PO Receipt^FullPOReceipt^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^FullPOReceipt^Full PO Receipt^FullPOReceipt^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Auto_Expected_PO_Receipt" data-show-in-summary="true" data-show-view-selector="false" data-auto-highlight-first-row="true"></div>
    <div id="view2" data-controller="View_PO_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="PO_NO" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
  </div>
</asp:Content>