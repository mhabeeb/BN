<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="RequestForDelivery.aspx.vb" Inherits="Pages_RequestForDelivery"  Title="^RequestForDelivery^Request For Delivery^RequestForDelivery^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^RequestForDelivery^Request For Delivery^RequestForDelivery^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="DR_Header" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true" data-search-by-first-letter="true" data-auto-highlight-first-row="true"></div>
    <div class="DataViewHeader">^DRLines^DR Lines^DRLines^</div>
    <div id="view2" data-controller="DR_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="DR_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
  </div>
</asp:Content>