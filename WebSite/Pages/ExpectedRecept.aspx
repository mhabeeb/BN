<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ExpectedRecept.aspx.vb" Inherits="Pages_ExpectedRecept"  Title="Expected Recept" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">Expected Recept</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Expected_Shipment"></div>
    <div class="DataViewHeader">View _Inventory _Lines</div>
    <div id="view2" data-controller="View_Inventory_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-auto-hide="self" data-show-modal-forms="true"></div>
  </div>
</asp:Content>