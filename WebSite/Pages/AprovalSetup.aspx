<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="AprovalSetup.aspx.vb" Inherits="Pages_AprovalSetup"  Title="^AprovalSetup^Aproval Setup^AprovalSetup^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^AprovalSetup^Aproval Setup^AprovalSetup^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="TBL_DocumetTypes" data-show-in-summary="true" data-search-by-first-letter="true"></div>
  </div>
  <div data-flow="row" style="padding-top:8px">
    <div id="view2" data-controller="TBL_ApprovalGroups" data-view="grid1" data-filter-source="view1" data-filter-fields="DocTypeID" data-page-size="5" data-auto-hide="container" data-show-modal-forms="true"></div>
  </div>
</asp:Content>