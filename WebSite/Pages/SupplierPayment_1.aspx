<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="SupplierPayment_1.aspx.vb" Inherits="Pages_SupplierPayment_1"  Title="^SupplierDebitMemo^Supplier Debit Memo^SupplierDebitMemo^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^SupplierDebitMemo^Supplier Debit Memo^SupplierDebitMemo^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="AP_Supplier_DebitMemo" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^AppliedInvoices^Applied Invoices^AppliedInvoices^">
      <div id="view2" data-controller="APAR_Invoice_Apply_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="PaymentID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^OpenInvoices^Open Invoices^OpenInvoices^">
      <div id="view3" data-controller="Apply_Invoices" data-filter-source="view1" data-filter-fields="PaymentID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^ViewAccounting^View Accounting^ViewAccounting^">
      <div id="view4" data-controller="ViewAccounting" data-filter-source="view1" data-filter-fields="PaymentID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>