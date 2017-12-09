<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="DR_Header.aspx.vb" Inherits="Pages_DR_Header"  Title="DR Header" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">DR Header</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="DR_Header" data-view="grid1" data-show-in-summary="true" data-search-on-start="true"></div>
  </div>
  <div data-flow="row">
    <div data-activator="Tab|DR Lines">
      <div id="view2" data-controller="DR_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="DR_ID" data-page-size="5" data-auto-hide="container" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SideBarPlaceHolder" runat="Server">
  <div class="TaskBox About">
    <div class="Inner">
      <div class="Header">About</div>
      <div class="Value">This page allows dr header management.</div>
    </div>
  </div>
</asp:Content>