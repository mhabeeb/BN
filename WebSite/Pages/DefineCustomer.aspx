<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="DefineCustomer.aspx.vb" Inherits="Pages_DefineCustomer"  Title="^DefineCustomer^Define Customer^DefineCustomer^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^DefineCustomer^Define Customer^DefineCustomer^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="CustomerMaster" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^CustomerContact^Contact Information^CustomerContact^">
      <div id="view2" data-controller="ContactsInformation" data-view="grid1" data-filter-source="view1" data-filter-fields="Sys_Number" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^Customerlocation^Customer Locations^Customerlocation^">
      <div id="view3" data-controller="tbl_Locations" data-view="grid1" data-filter-source="view1" data-filter-fields="Sys_Number" data-page-size="5" data-show-view-selector="false"></div>
    </div>
    <div data-activator="Tab|^Customerbank1^Customer Banks^Customerbank1^">
      <div id="view6" data-controller="CustomerSupplierBanks" data-view="grid1" data-filter-source="view1" data-filter-fields="Sys_Number" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^Customerinvoice1^View Invoices^Customerinvoice1^">
      <div id="view4" data-controller="View_Invoices" data-view="grid1" data-filter-source="view1" data-filter-fields="Sys_Number" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^Customerpayment1^View Payment^Customerpayment1^">
      <div id="view5" data-controller="View_Payments" data-view="grid1" data-filter-source="view1" data-filter-fields="Sys_Number" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^AccountsDimension^Accounts Dimension^AccountsDimension^">
      <div id="view7" data-controller="SYS_Default_Account" data-view="grid1" data-filter-source="view1" data-filter-fields="Sys_Number" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div class="DataViewHeader">Customer Location Accounts</div>
    <div id="view8" data-controller="SYS_Default_Account_Loc" data-view="grid1" data-filter-source="view3" data-filter-fields="LocationID" data-page-size="5" data-show-modal-forms="true"></div>
  </div>
</asp:Content>