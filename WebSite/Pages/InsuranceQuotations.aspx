<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="InsuranceQuotations.aspx.vb" Inherits="Pages_InsuranceQuotations"  Title="Insurance Quotations" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">Insurance Quotations</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="tbl_Quotation_Header"></div>
    <div id="view2" data-controller="tbl_Quotation_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="QT_NO" data-page-size="5" data-auto-hide="self" data-show-modal-forms="true"></div>
  </div>
</asp:Content>