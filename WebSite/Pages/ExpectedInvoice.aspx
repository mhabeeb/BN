<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ExpectedInvoice.aspx.vb" Inherits="Pages_ExpectedInvoice"  Title="^UnbilledInvoices^Unbilled Invoices^UnbilledInvoices^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^UnbilledInvoices^Unbilled Invoices^UnbilledInvoices^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Auto_Unbilled_Shipment_AP" data-show-in-summary="true" data-show-view-selector="false"></div>
    <div data-activator="Tab|^ViewPOReceiptLines^View PO Receipt Lines^ViewPOReceiptLines^">
      <div id="view2" data-controller="View_Inventory_Lines" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^ViewAccounting^View Accounting^ViewAccounting^">
      <div id="view3" data-controller="ViewAccounting" data-view="grid1" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>