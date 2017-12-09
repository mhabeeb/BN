<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="DefineInvoiceTypes.aspx.vb" Inherits="Pages_DefineInvoiceTypes"  Title="^DefineInvoiceTypes^Define Invoice Types^DefineInvoiceTypes^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^DefineInvoiceTypes^Define Invoice Types^DefineInvoiceTypes^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Customer_Invoice_Types" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true"></div>
  </div>
</asp:Content>