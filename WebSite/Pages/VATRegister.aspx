<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="VATRegister.aspx.vb" Inherits="Pages_VATRegister"  Title="^VATReg^VAT Register^VATReg^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^VATReg^VAT Register^VATReg^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="VATRegister" data-show-in-summary="true" data-show-description="false" data-show-view-selector="false"></div>
    <div id="view2" data-controller="View_Invoice_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="Trx_ID" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
  </div>
</asp:Content>