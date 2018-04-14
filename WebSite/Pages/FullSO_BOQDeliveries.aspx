<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="FullSO_BOQDeliveries.aspx.vb" Inherits="Pages_FullSO_BOQDeliveries"  Title="^FullSOBOQDeliveries^Full SO/BOQ Deliveries^FullSOBOQDeliveries^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^FullSOBOQDeliveries^Full SO/BOQ Deliveries^FullSOBOQDeliveries^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Auto_Expected_SO_Deliveries" data-show-in-summary="true" data-show-view-selector="false" data-auto-highlight-first-row="true"></div>
    <div id="view2" data-controller="View_SO_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="SO_NO" data-page-size="5" data-show-view-selector="false"></div>
    <div class="DataViewHeader">^LocTra^Locator Transactions^LocTra^</div>
    <div id="view4" data-controller="tbl_Transactions_Locator_Readonly" data-view="Readonly1" data-filter-source="view2" data-filter-fields="Trx_Line_ID" data-page-size="5" data-show-view-selector="false" data-auto-hide="self" data-show-modal-forms="true"></div>
    <div data-activator="Tab|^PicFroLoc^Pick From Locator^PicFroLoc^">
      <div id="view3" data-controller="Pick_from_Locator" data-view="grid1" data-filter-source="view2" data-filter-fields="Trx_Line_ID,StoreID,Item_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>