<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="CustomerMaster.aspx.vb" Inherits="Pages_CustomerMaster"  Title="^Customers13^Customer Master^Customers13^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^Customers13^Customer Master^Customers13^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="CustomerMaster" data-show-in-summary="true" data-show-modal-forms="true" data-search-by-first-letter="true"></div>
    <div data-activator="Tab|^CustomerContact1^Contact Information^CustomerContact1^">
      <div id="view2" data-controller="ContactsInformation" data-view="grid1" data-filter-source="view1" data-filter-fields="Sys_Number" data-page-size="5" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^Customerlocation1^Customer Locations^Customerlocation1^">
      <div id="view3" data-controller="tbl_Locations" data-view="grid1" data-filter-source="view1" data-filter-fields="Sys_Number" data-page-size="5" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^Customerbank1^Customer Banks^Customerbank1^">
      <div id="view6" data-controller="CustomerSupplierBanks" data-view="grid1" data-filter-source="view1" data-filter-fields="Sys_Number" data-page-size="5" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^Customerinvoice1^View Invoices^Customerinvoice1^">
      <div id="view4" data-controller="View_Invoices" data-view="grid1" data-filter-source="view1" data-filter-fields="Sys_Number" data-page-size="5" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^Customerpayment1^View Payment^Customerpayment1^">
      <div id="view5" data-controller="View_Payments" data-view="grid1" data-filter-source="view1" data-filter-fields="Sys_Number" data-page-size="5" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>