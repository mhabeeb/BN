<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="DSRTransaction.aspx.vb" Inherits="Pages_DSRTransaction"  Title="DSR Transaction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">DSR Transaction</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="DSR_Transaction_Header" data-show-modal-forms="true"></div>
    <div id="view2" data-controller="DSR_Transaction_Line" data-view="grid1" data-filter-source="view1" data-filter-fields="GL_Serial_No" data-page-size="5" data-auto-hide="self" data-show-modal-forms="true"></div>
  </div>
</asp:Content>