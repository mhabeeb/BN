<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="AssetsDepreciations.aspx.vb" Inherits="Pages_AssetsDepreciations"  Title="^AssetsDepreciations^View Depreciations^AssetsDepreciations^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^AssetsDepreciations^View Depreciations^AssetsDepreciations^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="FA_Depreciation" data-show-in-summary="true" data-show-view-selector="false" data-auto-highlight-first-row="true"></div>
  </div>
</asp:Content>