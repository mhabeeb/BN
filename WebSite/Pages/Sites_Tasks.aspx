<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="Sites_Tasks.aspx.vb" Inherits="Pages_Sites_Tasks"  Title="^SitesandTasks^Sites and Tasks^SitesandTasks^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^SitesandTasks^Sites and Tasks^SitesandTasks^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="ProjectsSites" data-show-in-summary="true" data-page-size="4" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|Project Tasks">
      <div id="view2" data-controller="ProjectTasks" data-view="grid1" data-filter-source="view1" data-filter-fields="SiteCode,Project_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|Project Resources">
      <div id="view3" data-controller="Project_BatchCosting_Resources" data-view="grid1" data-filter-source="view1" data-filter-fields="Project_Code,SiteCode" data-page-size="5" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^InvoiceLines^Invoice Lines^InvoiceLines^">
      <div id="view4" data-controller="View_Invoice_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="SiteCode" data-page-size="5" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^InventoryTransactions^Inventory Transactions^InventoryTransactions^">
      <div id="view5" data-controller="View_Inventory_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="SiteCode" data-page-size="5" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^POLines^PO Lines^POLines^">
      <div id="view6" data-controller="View_PO_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="SiteCode" data-page-size="5" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^RequisitionLines^Requisition Lines^RequisitionLines^">
      <div id="view7" data-controller="View_PR_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="SiteCode" data-page-size="5" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^BOQOrderLines^BOQ/Order Lines^BOQOrderLines^">
      <div id="view8" data-controller="View_SO_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="SiteCode" data-page-size="5" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^ViewAccounting^View Accounting^ViewAccounting^">
      <div id="view9" data-controller="ViewAccounting" data-view="grid1" data-filter-source="view1" data-filter-fields="SiteCode" data-page-size="5" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^BudgetObligations^Budget Obligations^BudgetObligations^">
      <div id="view10" data-controller="View_PR_Lines_Bud" data-view="grid1" data-show-in-summary="true" data-filter-source="view1" data-filter-fields="SiteCode" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    </div>
    <div data-activator="Tab|^BudgetComitments^Budget Commitments^BudgetComitments^">
      <div id="view11" data-controller="View_PO_Lines_Bud" data-view="grid1" data-show-in-summary="true" data-filter-source="view1" data-filter-fields="SiteCode" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    </div>
  </div>
</asp:Content>