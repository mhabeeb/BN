<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="StockValueReport.aspx.vb" Inherits="Pages_StockValueReport"  Title="^StockValueReport^Stock Value Report^StockValueReport^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^StockValueReport^Stock Value Report^StockValueReport^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Inventory_Stock_Values_Report" data-show-in-summary="true" data-show-view-selector="false"></div>
    <div id="view2" data-controller="View_Inventory_Lines" data-filter-source="view1" data-filter-fields="Item_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
  </div>
</asp:Content>