<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="Users.aspx.vb" Inherits="Pages_Users"  Title="^Users^Users^Users^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^Users^Users^Users^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Users" data-show-in-summary="true" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true" data-roles="Administrators"></div>
    <div data-activator="Tab|^UserRoles^User Roles^UserRoles^">
      <div id="view2" data-controller="UserRoles" data-view="grid1" data-filter-source="view1" data-filter-fields="UserID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true" data-roles="Administrators"></div>
    </div>
    <div data-activator="Tab|^CompanyAccess^Company Access^CompanyAccess^">
      <div id="view3" data-controller="UserBranchAccess" data-view="grid1" data-filter-source="view1" data-filter-fields="UserID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true" data-roles="Administrators"></div>
    </div>
    <div data-activator="Tab|^UserProjects^User Projects^UserProjects^">
      <div id="view4" data-controller="UserProjectAccess" data-view="grid1" data-filter-source="view1" data-filter-fields="UserID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^DepartmentAccess^Department Access^DepartmentAccess^">
      <div id="view5" data-controller="UserDepartmentAccess" data-view="grid1" data-filter-source="view1" data-filter-fields="UserID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^AssetBookAccess^Asset Book Access^AssetBookAccess^">
      <div id="view6" data-controller="AssetsBookAccess" data-view="grid1" data-filter-source="view1" data-filter-fields="UserID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^StoreAccess^Store Access^StoreAccess^">
      <div id="view7" data-controller="UserStoreAccess" data-view="grid1" data-filter-source="view1" data-filter-fields="UserID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^ConsolidationAccess^Consolidation Access^ConsolidationAccess^">
      <div id="view8" data-controller="UserConsolidationAccess" data-view="grid1" data-filter-source="view1" data-filter-fields="UserID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^UseAppGroAcc^UserApprovalGroupAcces^UseAppGroAcc^">
      <div id="view9" data-controller="UserApprovalGroupAccess" data-view="grid1" data-filter-source="view1" data-filter-fields="UserID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^CrossValidations^CrossValidations^CrossValidations^">
      <div id="view10" data-controller="UserCrossValidationAccess" data-view="grid1" data-filter-source="view1" data-filter-fields="UserID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>