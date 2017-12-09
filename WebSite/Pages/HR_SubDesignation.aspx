<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="HR_SubDesignation.aspx.vb" Inherits="Pages_HR_SubDesignation"  Title="HR Sub Designation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">HR Sub Designation</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="HR_SubDesignation" data-view="grid1" data-show-in-summary="true" data-search-on-start="true"></div>
  </div>
  <div data-flow="row">
    <div data-activator="Tab|Employees">
      <div id="view2" data-controller="Employees" data-view="grid1" data-filter-source="view1" data-filter-fields="SubDesignation_ID" data-page-size="5" data-auto-hide="container" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SideBarPlaceHolder" runat="Server">
  <div class="TaskBox About">
    <div class="Inner">
      <div class="Header">About</div>
      <div class="Value">This page allows hr sub designation management.</div>
    </div>
  </div>
</asp:Content>