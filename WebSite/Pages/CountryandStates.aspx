<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="CountryandStates.aspx.vb" Inherits="Pages_CountryandStates"  Title="^CountryandStates^Country and States^CountryandStates^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^CountryandStates^Country and States^CountryandStates^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="tbl_Countries" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true"></div>
    <div id="view2" data-controller="tbl_States" data-view="grid1" data-filter-source="view1" data-filter-fields="CountryName" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
  </div>
</asp:Content>