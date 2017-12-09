<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="AssetsCategory.aspx.vb" Inherits="Pages_AssetsCategory"  Title="^AssetsCategory^Assets Category^AssetsCategory^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^AssetsCategory^Assets Category^AssetsCategory^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="FA_Assets_Catory" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^AccountSetup^Account Setup^AccountSetup^">
      <div id="view2" data-controller="SYS_Default_Account" data-view="grid1" data-filter-source="view1" data-filter-fields="AssetCategoryID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>