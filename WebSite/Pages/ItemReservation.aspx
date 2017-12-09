<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ItemReservation.aspx.vb" Inherits="Pages_ItemReservation"  Title="^ItemReservation^Item Reservation^ItemReservation^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^ItemReservation^Item Reservation^ItemReservation^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="tbl_Item_Reservations" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^BOQSalesLines^BOQ/Sales Lines^BOQSalesLines^">
      <div id="view4" data-controller="View_SO_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="SO_Line_No" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^StoreStock^Store Stock^StoreStock^">
      <div id="view2" data-controller="View_Store_Stock" data-view="grid1" data-filter-source="view1" data-filter-fields="Item_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>