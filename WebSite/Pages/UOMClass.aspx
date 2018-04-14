<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="UOMClass.aspx.vb" Inherits="Pages_UOMClass"  Title="^UomCla^UOM Class^UomCla^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^UomCla^UOM Class^UomCla^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="tbl_UOM" data-show-in-summary="true" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    <div id="view2" data-controller="tbl_UOM_Conversion" data-view="grid1" data-filter-source="view1" data-filter-fields="PrimaryUOM" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
  </div>
</asp:Content>