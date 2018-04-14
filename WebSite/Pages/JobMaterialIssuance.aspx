<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="JobMaterialIssuance.aspx.vb" Inherits="Pages_JobMaterialIssuance"  Title="^JobMaterialIssuance^Job Material Issuance^JobMaterialIssuance^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^JobMaterialIssuance^Job Material Issuance^JobMaterialIssuance^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Job_Inventory_Issue" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true" data-search-by-first-letter="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^IssuedLines^Issued Lines^IssuedLines^">
      <div id="view2" data-controller="Job_Inventory_Line" data-view="grid1" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true" data-show-row-number="true"></div>
    </div>
    <div data-activator="Tab|^PicFroLoc^Pick From Locator^PicFroLoc^">
      <div id="view6" data-controller="Pick_from_Locator" data-view="grid1" data-filter-source="view2" data-filter-fields="Item_Code,StoreID,Line_ID" data-page-size="5" data-show-modal-forms="true" data-visible-when="[Master.LocatorYN] ==1"></div>
    </div>
    <div data-activator="Tab|^ViewAccounting^View Accounting^ViewAccounting^">
      <div id="view4" data-controller="ViewAccounting" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^OpenJobRequests^Open Job Requests^OpenJobRequests^">
      <div id="view3" data-controller="Job_Order_Balance_Issuance" data-show-view-selector="false"></div>
    </div>
    <div id="view7" data-controller="tbl_Transactions_Locator_Readonly" data-view="Readonly1" data-filter-source="view2" data-filter-fields="Trx_Line_ID,Item_Code,StoreID" data-page-size="5" data-auto-hide="self" data-show-modal-forms="true"></div>
  </div>
</asp:Content>