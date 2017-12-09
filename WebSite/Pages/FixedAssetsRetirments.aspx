<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="FixedAssetsRetirments.aspx.vb" Inherits="Pages_FixedAssetsRetirments"  Title="^FixedAssetsRetirments^Fixed Assets Retirments^FixedAssetsRetirments^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^FixedAssetsRetirments^Fixed Assets Retirments^FixedAssetsRetirments^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view2" data-controller="FA_Assets_Assignments" data-show-in-summary="true" data-show-view-selector="false" data-auto-highlight-first-row="true"></div>
    <div id="view1" data-controller="FA_Assets_Retirment" data-view="grid1" data-filter-source="view2" data-filter-fields="AssignmentID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true" data-visible-when="[Master.Assigment_Status] == 0"></div>
  </div>
</asp:Content>