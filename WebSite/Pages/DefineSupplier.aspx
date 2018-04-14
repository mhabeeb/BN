<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="DefineSupplier.aspx.vb" Inherits="Pages_DefineSupplier"  Title="^DefineSupplier^Define Supplier^DefineSupplier^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^DefineSupplier^Define Supplier^DefineSupplier^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="SupplierMaster" data-view="grid1" data-show-in-summary="true" data-page-size="10" data-show-description="false" data-show-view-selector="false" data-start-command-name="Select" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^Contacts^Contacts^Contacts^">
      <div id="view2" data-controller="ContactsInformation" data-view="grid1" data-filter-source="view1" data-filter-fields="Sys_Number" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^ParLoc^Party Locations^ParLoc^">
      <div id="view3" data-controller="tbl_Locations" data-filter-source="view1" data-filter-fields="Sys_Number" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^SupplierBanks^Supplier Banks^SupplierBanks^">
      <div id="view6" data-controller="CustomerSupplierBanks" data-view="grid1" data-filter-source="view1" data-filter-fields="Sys_Number" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^ViewInvoices^View Invoices^ViewInvoices^">
      <div id="view4" data-controller="View_Invoices" data-view="grid1" data-filter-source="view1" data-filter-fields="Sys_Number" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^ViewPayments^View Payments^ViewPayments^">
      <div id="view5" data-controller="View_Payments" data-view="grid1" data-filter-source="view1" data-filter-fields="Sys_Number" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^AccountsDimension^Accounts Dimension^AccountsDimension^">
      <div id="view7" data-controller="SYS_Default_Account" data-view="grid1" data-filter-source="view1" data-filter-fields="Sys_Number" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div class="DataViewHeader">^SupLocAcc^Supplier Location Account^SupLocAcc^</div>
    <div id="view8" data-controller="SYS_Default_Account_Loc" data-view="grid1" data-filter-source="view3" data-filter-fields="LocationID" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-auto-hide="self" data-show-modal-forms="true"></div>
  </div>
</asp:Content>