<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="AssetsMaster.aspx.vb" Inherits="Pages_AssetsMaster"  Title="^AssetsMaster^Assets Master^AssetsMaster^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^AssetsMaster^Assets Master^AssetsMaster^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div class="DataViewHeader">^Assets^Assets^Assets^</div>
    <div id="view1" data-controller="FA_Assets" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|Cost History">
      <div id="view4" data-controller="Assets_CostHistory" data-view="grid1" data-filter-source="view1" data-filter-fields="AssetID" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|Location">
      <div id="view7" data-controller="AssetLocation" data-view="grid1" data-filter-source="view1" data-filter-fields="Asset_ID" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^AssetsAsignments^Assets Asignments^AssetsAsignments^">
      <div id="view5" data-controller="FA_Assets_Assignments" data-view="grid1" data-filter-source="view1" data-filter-fields="AssetID" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^CostAdjustment^Cost Adjustment^CostAdjustment^">
      <div id="view6" data-controller="Assets_CostAdjustments" data-view="grid1" data-filter-source="view1" data-filter-fields="AssetID,BookID" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|Retirements">
      <div id="view8" data-controller="FA_Assets_Retirment" data-view="grid1" data-filter-source="view1" data-filter-fields="AssetID" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^DepreciationDetails^Depreciation Details^DepreciationDetails^">
      <div id="view2" data-controller="FA_Depreciation" data-filter-source="view1" data-filter-fields="AssetID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^ViewAccounting^View Accounting^ViewAccounting^">
      <div id="view3" data-controller="ViewAccounting" data-show-in-summary="true" data-filter-source="view1" data-filter-fields="AssetID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>