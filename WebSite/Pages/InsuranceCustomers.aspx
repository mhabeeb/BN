<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="InsuranceCustomers.aspx.vb" Inherits="Pages_InsuranceCustomers"  Title="Insurance Customers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">Insurance Customers</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="CustomerMaster"></div>
    <div data-activator="Tab|Contact Information">
      <div id="view2" data-controller="ContactsInformation" data-view="grid1" data-filter-source="view1" data-filter-fields="Sys_Number" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|Customer Locations">
      <div id="view3" data-controller="tbl_Locations" data-view="grid1" data-filter-source="view1" data-filter-fields="Sys_Number" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>