<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="CustomerRetention.aspx.vb" Inherits="Pages_CustomerRetention"  Title="^CustomerRetention^Customer Retention^CustomerRetention^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^CustomerRetention^Customer Retention^CustomerRetention^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="AR_Retention" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^ViewAccounting^View Accounting^ViewAccounting^">
      <div id="view4" data-controller="ViewAccounting" data-filter-source="view1" data-filter-fields="Trx_ID" data-page-size="5" data-show-view-selector="false" data-start-command-name="Select" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^AppliedPayments^Applied Payments^AppliedPayments^">
      <div id="view2" data-controller="APAR_Invoice_Apply_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="Trx_ID" data-page-size="5" data-show-view-selector="false" data-start-command-name="Select" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>