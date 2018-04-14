<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="PhysicalCount.aspx.vb" Inherits="Pages_PhysicalCount"  Title="^PhysicalCount^Physical Count^PhysicalCount^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^PhysicalCount^Physical Count^PhysicalCount^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Inventory_Physical_Header" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    <div class="DataViewHeader">^PhysicalCountLine^Physical Count Line^PhysicalCountLine^</div>
    <div id="view2" data-controller="Inventory_Pysical_Line" data-view="grid1" data-filter-source="view1" data-filter-fields="PhysicalCountID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
  </div>
</asp:Content>