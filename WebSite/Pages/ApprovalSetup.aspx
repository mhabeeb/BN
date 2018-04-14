<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ApprovalSetup.aspx.vb" Inherits="Pages_ApprovalSetup"  Title="^ApprovalSetup^Approval Setup^ApprovalSetup^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^ApprovalSetup^Approval Setup^ApprovalSetup^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="TBL_ApprovalGroups_Header" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div id="view2" data-controller="ApprovalGroups_Line" data-view="grid1" data-filter-source="view1" data-filter-fields="AppGroupID" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
  </div>
</asp:Content>