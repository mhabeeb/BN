<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="CustomerInvoice.aspx.vb" Inherits="Pages_CustomerInvoice"  Title="^CustomerInvoice^Customer Invoice^CustomerInvoice^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^CustomerInvoice^Customer Invoice^CustomerInvoice^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="AR_Inv_Header" data-show-in-summary="true" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^InvoiceLines^Invoice Lines^InvoiceLines^">
      <div id="view8" data-controller="AR_Inv_Line" data-view="grid1" data-filter-source="view1" data-filter-fields="Trx_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^UnbilledShipment^Unbilled Shipment^UnbilledShipment^">
      <div id="view3" data-controller="Pick_Inv_Shipment" data-view="grid1" data-filter-source="view1" data-filter-fields="Sys_Number,Trx_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true" data-show-row-number="true"></div>
    </div>
    <div data-activator="Tab|^ViewAccounting^View Accounting^ViewAccounting^">
      <div id="view4" data-controller="ViewAccounting" data-filter-source="view1" data-filter-fields="Trx_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^ViewReceipt^View Receipt^ViewReceipt^">
      <div id="view5" data-controller="View_Payments_Applied" data-view="grid1" data-filter-source="view1" data-filter-fields="Trx_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^AvailablePaymentstoApplied^Available Payments to Applied^AvailablePaymentstoApplied^">
      <div id="view6" data-controller="Apply_Invoices_From_Invoices" data-view="grid1" data-filter-source="view1" data-filter-fields="Trx_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^ProjectUnbilled^Project Unbilled^ProjectUnbilled^">
      <div id="view7" data-controller="Pick_Inv_Shipment_Projects" data-view="grid1" data-filter-source="view1" data-filter-fields="Trx_ID,Project_Code,Sys_Number" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>