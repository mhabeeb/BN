<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="HR_Designation.aspx.vb" Inherits="Pages_HR_Designation"  Title="HR Designation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">HR Designation</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="HR_Designation" data-view="grid1" data-show-in-summary="true" data-search-on-start="true"></div>
  </div>
  <div data-flow="row">
    <div data-activator="Tab|HR Sub Designation">
      <div id="view2" data-controller="HR_SubDesignation" data-view="grid1" data-filter-source="view1" data-filter-fields="Designation_ID" data-page-size="5" data-auto-hide="container" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SideBarPlaceHolder" runat="Server">
  <div class="TaskBox About">
    <div class="Inner">
      <div class="Header">About</div>
      <div class="Value">This page allows hr designation management.</div>
    </div>
  </div>
</asp:Content>