<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="InvoicesImport.aspx.vb" Inherits="Pages_InvoicesImport"  Title="^InvoicesImport^Invoices Import^InvoicesImport^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^InvoicesImport^Invoices Import^InvoicesImport^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="UPLOAD_INVOICES" data-show-view-selector="false" data-show-modal-forms="true"></div>
  </div>
</asp:Content>