<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="CustomerInvoiceAgeing.aspx.vb" Inherits="Pages_CustomerInvoiceAgeing"  Title="^CustomerInvoiceAgeing^Customer Invoice Ageing^CustomerInvoiceAgeing^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^CustomerInvoiceAgeing^Customer Invoice Ageing^CustomerInvoiceAgeing^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="AR_Ageing" data-show-in-summary="true" data-show-view-selector="false" data-auto-highlight-first-row="true"></div>
  </div>
  <div data-flow="row" style="padding-top:8px">
    <div id="view2" data-controller="ViewAccounting" data-filter-source="view1" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
  </div>
</asp:Content>