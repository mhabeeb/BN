<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="PaymentTerms.aspx.vb" Inherits="Pages_PaymentTerms"  Title="^PaymentTerms^Payment Terms^PaymentTerms^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^PaymentTerms^Payment Terms^PaymentTerms^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="LookUp_PaymentTerms" data-show-view-selector="false" data-auto-highlight-first-row="true"></div>
  </div>
</asp:Content>