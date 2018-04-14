<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="CustomerReceipt.aspx.vb" Inherits="Pages_CustomerReceipt"  Title="^CustomerReceipt^Customer Receipt^CustomerReceipt^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^CustomerReceipt^Customer Receipt^CustomerReceipt^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="AR_Customer_Receipt" data-view="grid1" data-show-in-summary="true" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true" data-show-details-in-list-mode="false" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^AppliedInvoice^Applied Invoice^AppliedInvoice^">
      <div id="view2" data-controller="APAR_Invoice_Apply_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="PaymentID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^OpenInvoices^Open Invoices^OpenInvoices^">
      <div id="view3" data-controller="Apply_Invoices" data-view="grid1" data-filter-source="view1" data-filter-fields="Sys_Number,PaymentID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true" data-visible-when="[Master.Rec_Status]==0"></div>
    </div>
    <div data-activator="Tab|^ViewAccounting^View Accounting^ViewAccounting^">
      <div id="view4" data-controller="ViewAccounting" data-view="grid1" data-filter-source="view1" data-filter-fields="PaymentID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>