<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="CustomerInvoiceAgeing.aspx.vb" Inherits="Pages_CustomerInvoiceAgeing"  Title="^CustomerInvoiceAgeing^Customer Invoice Ageing^CustomerInvoiceAgeing^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^CustomerInvoiceAgeing^Customer Invoice Ageing^CustomerInvoiceAgeing^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="AR_Ageing" data-show-in-summary="true" data-show-description="false" data-show-view-selector="false" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|View Accounting">
      <div id="view2" data-controller="ViewAccounting" data-view="grid1" data-filter-source="view1" data-filter-fields="Trx_ID" data-page-size="5" data-show-view-selector="false" data-auto-hide="self" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    </div>
    <div data-activator="Tab|^ViewReceipt^View Receipt^ViewReceipt^">
      <div id="view5" data-controller="View_Payments_Applied" data-view="grid1" data-filter-source="view1" data-filter-fields="Trx_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^InvLin^Invoice Lines^InvLin^">
      <div id="view3" data-controller="View_Invoice_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="Trx_ID" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>