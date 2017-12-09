<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="DefineBranch.aspx.vb" Inherits="Pages_DefineBranch"  Title="^DefineBranch^Define Branch^DefineBranch^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^DefineBranch^Define Branch^DefineBranch^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="tbl_BranchInfo" data-show-in-summary="true" data-show-modal-forms="true" data-search-by-first-letter="true"></div>
  </div>
</asp:Content>