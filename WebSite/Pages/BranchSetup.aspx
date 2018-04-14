<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="BranchSetup.aspx.vb" Inherits="Pages_BranchSetup"  Title="^BranchSetup^Branch Setup^BranchSetup^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^BranchSetup^Branch Setup^BranchSetup^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div class="DataViewHeader">^Bra^Branch^Bra^</div>
    <div id="view1" data-controller="tbl_BranchInfo" data-show-in-summary="true" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^Store^Store^Store^">
      <div id="view2" data-controller="tbl_Store" data-view="grid1" data-filter-source="view1" data-filter-fields="OPU_Code" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^Projects^Projects^Projects^">
      <div id="view3" data-controller="ProjectMaster" data-view="grid1" data-filter-source="view1" data-filter-fields="OPU_Code" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^LOGO^LOGO^LOGO^">
      <div id="view4" data-controller="AABranch_Logo" data-view="grid1" data-filter-source="view1" data-filter-fields="BranchID" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^Approvals^Approvals^Approvals^">
      <div id="view5" data-controller="tbl_Branch_Default_Approvals" data-view="grid1" data-filter-source="view1" data-filter-fields="BranchID" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>