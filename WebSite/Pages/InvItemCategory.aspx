<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="InvItemCategory.aspx.vb" Inherits="Pages_InvItemCategory"  Title="^ItemCategory^Item Category^ItemCategory^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^ItemCategory^Item Category^ItemCategory^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="ItemCategory" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div id="view2" data-controller="Tax_On_ItemCategory" data-view="grid1" data-filter-source="view1" data-filter-fields="Item_Category" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
  </div>
</asp:Content>