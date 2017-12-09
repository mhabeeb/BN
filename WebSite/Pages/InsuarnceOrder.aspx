<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="InsuarnceOrder.aspx.vb" Inherits="Pages_InsuarnceOrder"  Title="Insuarnce Order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">Insuarnce Order</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="SO_Header" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true" data-search-by-first-letter="true"></div>
    <div data-activator="Tab|SO Lines">
      <div id="view2" data-controller="SO_Line_Items" data-view="grid1" data-filter-source="view1" data-filter-fields="SO_NO" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|Open Quotations">
      <div id="view3" data-controller="Pick_Qoutation_for_SO" data-view="grid1" data-filter-source="view1" data-filter-fields="Sys_Number,SO_NO" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>