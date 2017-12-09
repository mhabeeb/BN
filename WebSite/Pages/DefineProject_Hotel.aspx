<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="DefineProject_Hotel.aspx.vb" Inherits="Pages_DefineProject_Hotel"  Title="Projects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">Projects</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="ProjectMaster" data-show-in-summary="true" data-page-size="5" data-show-modal-forms="true" data-search-by-first-letter="true"></div>
    <div data-activator="Tab|^InventoryTransactions^Inventory Transactions^InventoryTransactions^">
      <div id="view2" data-controller="View_Inventory_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="Project_Code" data-page-size="5" data-auto-hide="self" data-show-modal-forms="true" data-roles="Administrators,Super Admin"></div>
    </div>
    <div data-activator="Tab|">
      <div id="view3" data-controller="View_Invoice_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="Project_Code" data-page-size="5" data-show-modal-forms="true" data-roles="Administrators,Super Admin,HIDE"></div>
    </div>
    <div data-activator="Tab|^POLines^PO Lines^POLines^">
      <div id="view4" data-controller="View_PO_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="Project_Code" data-page-size="5" data-auto-hide="self" data-show-modal-forms="true" data-roles="Super Admin,HIDE"></div>
    </div>
    <div data-activator="Tab|^RequisitionLines^Requisition Lines^RequisitionLines^">
      <div id="view5" data-controller="View_PR_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="Project_Code" data-page-size="5" data-auto-hide="self" data-show-modal-forms="true" data-roles="Super Admin,HIDE"></div>
    </div>
    <div data-activator="Tab|^BOQOrderLines^BOQ/Order Lines^BOQOrderLines^">
      <div id="view6" data-controller="View_SO_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="Project_Code" data-page-size="5" data-auto-hide="self" data-show-modal-forms="true" data-roles="Super Admin,HIDE"></div>
    </div>
    <div data-activator="Tab|">
      <div id="view7" data-controller="ViewAccounting" data-view="grid1" data-filter-source="view1" data-filter-fields="Project_Code" data-page-size="5" data-show-modal-forms="true" data-roles="Administrators,Super Admin,HIDE"></div>
    </div>
    <div data-activator="Tab|">
      <div id="view8" data-controller="ProjectsSites" data-view="grid1" data-filter-source="view1" data-filter-fields="Project_Code" data-page-size="5" data-show-modal-forms="true" data-roles="Administrators,Super Admin,HIDE"></div>
    </div>
    <div data-activator="Tab|Status By Milestone">
      <div id="view9" data-controller="StatusByMilestone" data-view="grid1" data-show-in-summary="true" data-filter-source="view1" data-filter-fields="Project_Code" data-page-size="5" data-show-modal-forms="true"></div>
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