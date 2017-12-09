<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="DepartmentMaster.aspx.vb" Inherits="Pages_DepartmentMaster"  Title="^DepartmentMaster^Department Master^DepartmentMaster^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^DepartmentMaster^Department Master^DepartmentMaster^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="DepartmentMaster" data-show-in-summary="true" data-show-view-selector="false" data-search-by-first-letter="true"></div>
    <div id="view2" data-controller="Pick_Project" data-view="grid1" data-filter-source="view1" data-filter-fields="Dept_Code" data-page-size="5" data-show-modal-forms="true"></div>
  </div>
</asp:Content>