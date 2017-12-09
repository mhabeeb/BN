<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="FinishedGoodsReceiving.aspx.vb" Inherits="Pages_FinishedGoodsReceiving"  Title="^FinishedGoodsReceiving^Finished Goods Receiving^FinishedGoodsReceiving^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^FinishedGoodsReceiving^Finished Goods Receiving^FinishedGoodsReceiving^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view4" data-controller="Finished_Goods_Recv_Header" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true" data-search-by-first-letter="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|">
      <div id="view2" data-controller="Finished_Goods_Recv_Line" data-view="grid1" data-filter-source="view4" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|">
      <div id="view1" data-controller="ViewAccounting" data-filter-source="view4" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>