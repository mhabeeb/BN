<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="SupplierInvoiceAgeing.aspx.vb" Inherits="Pages_SupplierInvoiceAgeing"  Title="^SupplierInvoiceAgeing^Supplier Invoice Ageing^SupplierInvoiceAgeing^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^SupplierInvoiceAgeing^Supplier Invoice Ageing^SupplierInvoiceAgeing^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="AP_Ageing" data-show-in-summary="true" data-show-view-selector="false"></div>
    <div data-activator="Tab|^ViewAccounting^View Accounting^ViewAccounting^">
      <div id="view2" data-controller="ViewAccounting" data-view="grid1" data-filter-source="view1" data-filter-fields="Trx_ID" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^ViewPayments^View Payments^ViewPayments^">
      <div id="view6" data-controller="View_Payments_Applied" data-view="grid1" data-filter-source="view1" data-filter-fields="Trx_ID" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^InvLin^Invoice Lines^InvLin^">
      <div id="view3" data-controller="View_Invoice_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="Trx_ID" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>