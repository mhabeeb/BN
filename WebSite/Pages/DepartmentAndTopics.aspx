<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="DepartmentAndTopics.aspx.vb" Inherits="Pages_DepartmentAndTopics"  Title="Department And Topics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">Department And Topics</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Parties_Evaluation_Departments"></div>
    <div id="view2" data-controller="Parties_Evaluation_Topics" data-view="grid1" data-filter-source="view1" data-filter-fields="Evaluation_Type,Dept_Code" data-page-size="5" data-auto-hide="self" data-show-modal-forms="true"></div>
  </div>
</asp:Content>