<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="SupplierStatement.aspx.vb" Inherits="Pages_SupplierStatement"  Title="^SupplierStatement^Supplier Statement^SupplierStatement^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^SupplierStatement^Supplier Statement^SupplierStatement^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="SupplierStatement" data-show-in-summary="true" data-show-view-selector="false"></div>
  </div>
</asp:Content>