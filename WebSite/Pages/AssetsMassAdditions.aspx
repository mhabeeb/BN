<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="AssetsMassAdditions.aspx.vb" Inherits="Pages_AssetsMassAdditions"  Title="^AssetsMassAdditions^Assets Mass Additions^AssetsMassAdditions^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^AssetsMassAdditions^Assets Mass Additions^AssetsMassAdditions^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row" style="padding-top:8px">
    <div id="view1" data-controller="FA_Assets_MassAdditions" data-show-in-summary="true" data-show-view-selector="false" data-auto-highlight-first-row="true"></div>
  </div>
</asp:Content>