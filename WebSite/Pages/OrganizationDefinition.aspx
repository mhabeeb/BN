<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="OrganizationDefinition.aspx.vb" Inherits="Pages_OrganizationDefinition"  Title="^OrganizationDefinition^Organization Definition^OrganizationDefinition^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^OrganizationDefinition^Organization Definition^OrganizationDefinition^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="tbl_CompanyInformation" data-show-in-summary="true" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^Branch^Branch^Branch^">
      <div id="view2" data-controller="tbl_BranchInfo" data-view="grid1" data-filter-source="view1" data-filter-fields="CompanyID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^DimensionSetup^Dimension Setup^DimensionSetup^">
      <div id="view3" data-controller="Accouting_Dimensions" data-view="grid1" data-filter-source="view1" data-filter-fields="Company_Code" data-page-size="5" data-show-view-selector="false"></div>
    </div>
    <div data-activator="Tab|^LOGO^LOGO^LOGO^">
      <div id="view5" data-controller="AABranch_Logo" data-view="grid1" data-filter-source="view1" data-filter-fields="BranchID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div id="view4" data-controller="tbl_Store" data-view="grid1" data-filter-source="view2" data-filter-fields="OPU_Code" data-page-size="5" data-show-view-selector="false" data-auto-hide="self" data-show-modal-forms="true"></div>
  </div>
</asp:Content>