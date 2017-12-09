<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="FullSO_BOQDeliveries.aspx.vb" Inherits="Pages_FullSO_BOQDeliveries"  Title="^FullSOBOQDeliveries^Full SO/BOQ Deliveries^FullSOBOQDeliveries^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^FullSOBOQDeliveries^Full SO/BOQ Deliveries^FullSOBOQDeliveries^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Auto_Expected_SO_Deliveries" data-show-in-summary="true" data-show-view-selector="false" data-search-by-first-letter="true" data-auto-highlight-first-row="true"></div>
    <div id="view2" data-controller="View_SO_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="SO_NO" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
  </div>
</asp:Content>