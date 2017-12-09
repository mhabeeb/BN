<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="Assets.aspx.vb" Inherits="Pages_Assets"  Title="Assets" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">Assets</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Assets" data-view="grid1" data-show-in-summary="true" data-search-on-start="true"></div>
  </div>
  <div data-flow="row">
    <div data-activator="Tab|Depreciation">
      <div id="view2" data-controller="Depreciation" data-view="grid1" data-filter-source="view1" data-filter-fields="AssetID" data-page-size="5" data-auto-hide="container" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SideBarPlaceHolder" runat="Server">
  <div class="TaskBox About">
    <div class="Inner">
      <div class="Header">About</div>
      <div class="Value">This page allows assets management.</div>
    </div>
  </div>
</asp:Content>