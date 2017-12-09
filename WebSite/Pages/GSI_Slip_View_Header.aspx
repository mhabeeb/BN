<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="GSI_Slip_View_Header.aspx.vb" Inherits="Pages_GSI_Slip_View_Header"  Title="GSI Slip View Header" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">GSI Slip View Header</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="GSI_TRX_HEADER_II"></div>
    <div id="view2" data-controller="GSI_Slip_Line_View" data-view="grid1" data-filter-source="view1" data-filter-fields="TRX_HEADER_ID,ORG_CODE" data-page-size="5" data-auto-hide="self" data-show-modal-forms="true"></div>
  </div>
</asp:Content>