<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="Quotation.aspx.vb" Inherits="Pages_Quotation"  Title="^Quotation^Quotation^Quotation^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^Quotation^Quotation^Quotation^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="tbl_Quotation_Header" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^QuotationLine^Quotation Line^QuotationLine^">
      <div id="view2" data-controller="tbl_Quotation_Lines" data-view="grid1" data-show-in-summary="true" data-filter-source="view1" data-filter-fields="QT_NO" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div class="DataViewHeader">^ViewItemReservation^View Item Reservation^ViewItemReservation^</div>
    <div id="view4" data-controller="View_Item_Reservation" data-view="grid1" data-filter-source="view2" data-filter-fields="LineID,Item_Code" data-page-size="5" data-show-view-selector="false" data-auto-hide="self" data-show-modal-forms="true" data-visible-when="[Master.QT_Qty] > 0"></div>
    <div data-activator="Tab|^StoreStock^Store Stock^StoreStock^">
      <div id="view3" data-controller="View_Store_Stock" data-view="grid1" data-filter-source="view2" data-filter-fields="Item_Code" data-page-size="5" data-show-view-selector="false" data-auto-hide="self" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>