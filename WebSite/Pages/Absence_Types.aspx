<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="Absence_Types.aspx.vb" Inherits="Pages_Absence_Types"  Title="Absence Types" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">Absence Types</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Absence_Types" data-view="grid1" data-show-in-summary="true" data-search-on-start="true"></div>
  </div>
  <div data-flow="row">
    <div data-activator="Tab|Emp Times">
      <div id="view2" data-controller="Emp_Times" data-view="grid1" data-filter-source="view1" data-filter-fields="Absence_Type_Id" data-page-size="5" data-auto-hide="container" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SideBarPlaceHolder" runat="Server">
  <div class="TaskBox About">
    <div class="Inner">
      <div class="Header">About</div>
      <div class="Value">This page allows absence types management.</div>
    </div>
  </div>
</asp:Content>