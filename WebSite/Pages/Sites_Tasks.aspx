<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="Sites_Tasks.aspx.vb" Inherits="Pages_Sites_Tasks"  Title="^SitesandTasks^Sites and Tasks^SitesandTasks^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^SitesandTasks^Sites and Tasks^SitesandTasks^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="ProjectsSites" data-show-view-selector="false"></div>
    <div id="view2" data-controller="ProjectTasks" data-view="grid1" data-filter-source="view1" data-filter-fields="SiteCode,Project_Code" data-page-size="5" data-show-view-selector="false" data-auto-hide="self" data-show-modal-forms="true"></div>
  </div>
</asp:Content>