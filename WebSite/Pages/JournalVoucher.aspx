<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="JournalVoucher.aspx.vb" Inherits="Pages_JournalVoucher"  Title="^JournalVoucher^Journal Voucher^JournalVoucher^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^JournalVoucher^Journal Voucher^JournalVoucher^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="GL_Transaction_Header" data-show-in-summary="true" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div id="view2" data-controller="GL_Transaction_Line" data-view="grid1" data-filter-source="view1" data-filter-fields="GL_Serial_No" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
  </div>
</asp:Content>