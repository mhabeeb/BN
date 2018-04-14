<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="DimensionLookUps.aspx.vb" Inherits="Pages_DimensionLookUps"  Title="^DimensionLookUps^Dimension Look Ups^DimensionLookUps^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^DimensionLookUps^Dimension Look Ups^DimensionLookUps^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view3" data-controller="C_Dimension_Details" data-show-description="false" data-show-view-selector="false"></div>
    <div id="view1" data-controller="Dimension_Values_Child_Entry" data-view="grid1" data-filter-source="view3" data-filter-fields="SEGMENT6" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-auto-hide="self" data-show-modal-forms="true"></div>
  </div>
</asp:Content>