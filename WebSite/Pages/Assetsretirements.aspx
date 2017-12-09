<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="Assetsretirements.aspx.vb" Inherits="Pages_Assetsretirements"  Title="^AssetsRetirments^Assets Retirements^AssetsRetirments^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^AssetsRetirments^Assets Retirements^AssetsRetirments^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="FA_Assets_Retirments" data-show-in-summary="true" data-show-view-selector="false"></div>
  </div>
</asp:Content>