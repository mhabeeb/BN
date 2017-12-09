<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="CustomerReceipt_1.aspx.vb" Inherits="Pages_CustomerReceipt_1"  Title="^CustomerCreditMemo^Customer Credit Memo^CustomerCreditMemo^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^CustomerCreditMemo^Customer Credit Memo^CustomerCreditMemo^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="AR_Customer_CreditMemo" data-show-in-summary="true" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true" data-show-details-in-list-mode="false" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^AppliedInvoices^Applied Invoices^AppliedInvoices^">
      <div id="view2" data-controller="APAR_Invoice_Apply_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="PaymentID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^AvailableInvoices^Available Invoices^AvailableInvoices^">
      <div id="view3" data-controller="Apply_Invoices" data-view="grid1" data-filter-source="view1" data-filter-fields="PaymentID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^ViewAccounting^View Accounting^ViewAccounting^">
      <div id="view4" data-controller="ViewAccounting" data-view="grid1" data-filter-source="view1" data-filter-fields="PaymentID" data-page-size="5" data-show-view-selector="false" data-start-command-name="Select" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>