<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="InterOrgShipments.aspx.vb" Inherits="Pages_InterOrgShipments"  Title="^InterOrgShipments^Inter Org Shipments^InterOrgShipments^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^InterOrgShipments^Inter Org Shipments^InterOrgShipments^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Inter_Org_Shipment" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^InterOrgLines^Inter Org Lines^InterOrgLines^">
      <div id="view3" data-controller="Misc_Inventory_Line" data-view="grid1" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^ViewAccounting^View Accounting^ViewAccounting^">
      <div id="view2" data-controller="ViewAccounting" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^PicFroLoc^Pick From Locator^PicFroLoc^">
      <div id="view6" data-controller="Pick_from_Locator" data-view="grid1" data-filter-source="view3" data-filter-fields="Line_ID,StoreID,Item_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true" data-visible-when="[Master.LocatorYN] ==1"></div>
    </div>
    <div class="DataViewHeader">^LocTra^Locator Transactions^LocTra^</div>
    <div id="view5" data-controller="tbl_Transactions_Locator_Readonly" data-view="Readonly1" data-filter-source="view3" data-filter-fields="Trx_Line_ID" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true" data-visible-when="[Master.LocatorYN] ==1"></div>
  </div>
</asp:Content>