<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ApprovalGroup.aspx.vb" Inherits="Pages_ApprovalGroup"  Title="^ApprovalGroup^Approval Group^ApprovalGroup^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^ApprovalGroup^Approval Group^ApprovalGroup^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="TBL_DocumetTypes" data-show-in-summary="true" data-show-view-selector="false"></div>
    <div id="view2" data-controller="ApprovalGroups_Line" data-filter-source="view1" data-page-size="5" data-show-view-selector="false" data-auto-hide="self" data-show-modal-forms="true"></div>
  </div>
</asp:Content>