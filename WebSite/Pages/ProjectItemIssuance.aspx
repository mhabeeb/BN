<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ProjectItemIssuance.aspx.vb" Inherits="Pages_ProjectItemIssuance"  Title="^ProjectItemIssuance^Project Item Issuance^ProjectItemIssuance^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^ProjectItemIssuance^Project Item Issuance^ProjectItemIssuance^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Misc_Inventory_Issue" data-show-in-summary="true" data-page-size="7" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^MiscItemLine^Misc Item Line^MiscItemLine^">
      <div id="view2" data-controller="Misc_Inventory_Line_BOQ_Issue" data-view="grid1" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^ViewAccounting^View Accounting^ViewAccounting^">
      <div id="view3" data-controller="ViewAccounting" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^PicFroLoc^Pick From Locator^PicFroLoc^">
      <div id="view4" data-controller="Pick_from_Locator" data-view="grid1" data-filter-source="view2" data-filter-fields="Trx_Line_ID,StoreID,Item_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true" data-show-search-bar="false"></div>
    </div>
    <div class="DataViewHeader">^LocTra^Locator Transactions^LocTra^</div>
    <div id="view5" data-controller="tbl_Transactions_Locator_Readonly" data-view="Readonly1" data-filter-source="view2" data-filter-fields="Trx_Line_ID" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-auto-hide="self" data-show-modal-forms="true"></div>
  </div>
</asp:Content>