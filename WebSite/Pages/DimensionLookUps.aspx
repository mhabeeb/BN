<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="DimensionLookUps.aspx.vb" Inherits="Pages_DimensionLookUps"  Title="^DimensionLookUps^Dimension Look Ups^DimensionLookUps^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^DimensionLookUps^Dimension Look Ups^DimensionLookUps^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Dimension_ValueSet_Master" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div class="DataViewHeader">^DimensionValues^Dimension Values^DimensionValues^</div>
    <div id="view2" data-controller="Dimension_Values_Child" data-view="grid1" data-filter-source="view1" data-filter-fields="LookUpType" data-page-size="5" data-show-view-selector="false" data-auto-hide="self" data-show-modal-forms="true"></div>
  </div>
</asp:Content>