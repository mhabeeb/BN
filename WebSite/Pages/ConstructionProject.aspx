<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ConstructionProject.aspx.vb" Inherits="Pages_ConstructionProject"  Title="Construction Project" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">Construction Project</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="ProjectMaster" data-show-in-summary="true" data-page-size="5" data-show-modal-forms="true" data-search-by-first-letter="true"></div>
    <div data-activator="Tab|Status By Milestone">
      <div id="view9" data-controller="StatusByMilestone" data-view="grid1" data-show-in-summary="true" data-filter-source="view1" data-page-size="5" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|Status By Phase">
      <div id="view10" data-controller="StatusByPhase" data-view="grid1" data-show-in-summary="true" data-filter-source="view1" data-filter-fields="Project_Code" data-page-size="5" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|Define S-Curve">
      <div id="view11" data-controller="DefineSCurve" data-view="grid1" data-show-in-summary="true" data-filter-source="view1" data-filter-fields="Project_Code" data-page-size="5" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|Plan Vs Actual">
      <div id="view13" data-controller="PlanVsActual" data-view="grid1" data-show-in-summary="true" data-filter-source="view1" data-filter-fields="Project_Code" data-page-size="5" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|Project Gallery">
      <div id="view12" data-controller="ProjectGallery" data-view="grid1" data-show-in-summary="true" data-filter-source="view1" data-filter-fields="Project_Code" data-page-size="5" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>