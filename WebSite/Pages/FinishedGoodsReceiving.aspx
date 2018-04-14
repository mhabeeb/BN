<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="FinishedGoodsReceiving.aspx.vb" Inherits="Pages_FinishedGoodsReceiving"  Title="^FinishedGoodsReceiving^Finished Goods Receiving^FinishedGoodsReceiving^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^FinishedGoodsReceiving^Finished Goods Receiving^FinishedGoodsReceiving^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view4" data-controller="Finished_Goods_Recv_Header" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true" data-search-by-first-letter="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^Lines^Lines^Lines^">
      <div id="view2" data-controller="Finished_Goods_Recv_Line" data-view="grid1" data-filter-source="view4" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^VieAcc^View Accounting^VieAcc^">
      <div id="view1" data-controller="ViewAccounting" data-filter-source="view4" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div class="DataViewHeader">^Locator^Locator Control^Locator^</div>
    <div id="view3" data-controller="tbl_Transactions_Locator" data-view="Readonly1" data-filter-source="view2" data-filter-fields="Item_Code,StoreID,Trx_Line_ID" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-auto-hide="self" data-show-modal-forms="true" data-visible-when="[Master.LocatorYN] ==1"></div>
  </div>
</asp:Content>