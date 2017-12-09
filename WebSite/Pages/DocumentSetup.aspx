<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="DocumentSetup.aspx.vb" Inherits="Pages_DocumentSetup"  Title="^DocumentSetup^Document Setup^DocumentSetup^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^DocumentSetup^Document Setup^DocumentSetup^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="TBL_DocumetTypes" data-show-in-summary="true" data-show-description="false" data-show-view-selector="false"></div>
    <div id="view2" data-controller="TBL_DocumetTypes_Child" data-view="grid1" data-filter-source="view1" data-filter-fields="DocTypeID_Parent" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-auto-hide="self" data-show-modal-forms="true"></div>
  </div>
</asp:Content>