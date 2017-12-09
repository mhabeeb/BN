<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ProjectCostMoving.aspx.vb" Inherits="Pages_ProjectCostMoving"  Title="^ProjectCostMoving^Project Cost Moving^ProjectCostMoving^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^ProjectCostMoving^Project Cost Moving^ProjectCostMoving^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="PROJECT_EXPENCE_MOVING" data-show-in-summary="true" data-show-view-selector="false" data-auto-highlight-first-row="true"></div>
  </div>
</asp:Content>