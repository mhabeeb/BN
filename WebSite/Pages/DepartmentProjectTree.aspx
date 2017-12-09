<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="DepartmentProjectTree.aspx.vb" Inherits="Pages_DepartmentProjectTree"  Title="^DepartmentProjectTree^Department Project Tree^DepartmentProjectTree^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^DepartmentProjectTree^Department Project Tree^DepartmentProjectTree^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="tbl_Department" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true"></div>
    <div id="view2" data-controller="Pick_Project" data-view="grid1" data-filter-source="view1" data-filter-fields="Dept_Code" data-page-size="5" data-show-view-selector="false" data-auto-hide="self" data-show-modal-forms="true"></div>
  </div>
</asp:Content>