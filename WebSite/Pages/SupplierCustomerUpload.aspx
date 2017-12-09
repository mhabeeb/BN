<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="SupplierCustomerUpload.aspx.vb" Inherits="Pages_SupplierCustomerUpload"  Title="^SupplierCustomerUpload^Supplier Customer Upload^SupplierCustomerUpload^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^SupplierCustomerUpload^Supplier Customer Upload^SupplierCustomerUpload^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Upload_Customer_Supplier" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
  </div>
</asp:Content>