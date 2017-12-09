<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="Home.aspx.vb" Inherits="Pages_Home"  Title="Workflow Notification" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">Workflow Notification</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="column" data-width="70%">
    <div id="view1" data-controller="InBox" data-page-size="14" data-show-action-buttons="bottom" data-show-view-selector="false" data-show-details-in-list-mode="false" data-show-page-size="false" data-show-quick-find="false" data-show-search-bar="false"></div>
    <div data-activator="Tab|^NotificationComments^Notification Comments^NotificationComments^">
      <div id="view3" data-controller="NotificationComments" data-view="grid1" data-filter-source="view1" data-filter-fields="DocumentID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^ViewLineDetails^View Line Details^ViewLineDetails^">
      <div id="view5" data-controller="XX_Email_View" data-view="grid1" data-filter-source="view1" data-filter-fields="DocumentID" data-page-size="5" data-show-description="false" data-show-modal-forms="true"></div>
    </div>
  </div>
  <div data-flow="column" style="padding-left:5px" data-width="29%">
    <div id="view2" data-controller="UsersProfile" data-show-action-bar="false" data-show-action-buttons="bottom" data-show-description="false" data-show-view-selector="false" data-show-details-in-list-mode="false" data-show-page-size="false" data-show-quick-find="false" data-show-search-bar="false"></div>
  </div>
</asp:Content>