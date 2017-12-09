<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ViewSupplierListing.aspx.vb" Inherits="Pages_ViewSupplierListing"  Title="^ViewSupplierListing^View Supplier Listing^ViewSupplierListing^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^ViewSupplierListing^View Supplier Listing^ViewSupplierListing^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Pick_Supplier"></div>
  </div>
</asp:Content>