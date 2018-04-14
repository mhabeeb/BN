<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="InterOrgReceipt.aspx.vb" Inherits="Pages_InterOrgReceipt"  Title="^InterOrgReceipt^Inter Org Receipt^InterOrgReceipt^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^InterOrgReceipt^Inter Org Receipt^InterOrgReceipt^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row" style="padding-top:8px">
    <div id="view2" data-controller="Inter_Org_Receipt" data-show-in-summary="true" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^InterOrgLines^Inter Org Lines^InterOrgLines^">
      <div id="view1" data-controller="Misc_Inventory_Line" data-view="grid1" data-filter-source="view2" data-filter-fields="Transaction_ID" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^ViewAccounting^View Accounting^ViewAccounting^">
      <div id="view3" data-controller="ViewAccounting" data-filter-source="view2" data-filter-fields="Transaction_ID" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div class="DataViewHeader">^Locator^Locator Control^Locator^</div>
    <div id="view4" data-controller="tbl_Transactions_Locator" data-view="grid1" data-filter-source="view1" data-filter-fields="Trx_Line_ID,Item_Code,StoreID" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true" data-visible-when="[Master.LocatorYN] ==1"></div>
  </div>
</asp:Content>