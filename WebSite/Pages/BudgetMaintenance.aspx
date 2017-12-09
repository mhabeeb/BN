<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="BudgetMaintenance.aspx.vb" Inherits="Pages_BudgetMaintenance"  Title="^BudgetMaintenance^Budget Maintenance^BudgetMaintenance^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^BudgetMaintenance^Budget Maintenance^BudgetMaintenance^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row" style="padding-top:8px">
    <div id="view1" data-controller="GL_Budget_Master" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^BudgetLines^Budget Lines^BudgetLines^">
      <div id="view2" data-controller="GL_Budgeting" data-view="grid1" data-filter-source="view1" data-filter-fields="BudgetCode" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^Obligation^Obligation^Obligation^">
      <div id="view6" data-controller="View_PR_Lines_Bud" data-view="grid1" data-filter-source="view1" data-filter-fields="BudgetCode" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^Comitments^Comitments^Comitments^">
      <div id="view3" data-controller="View_PO_Lines_Bud" data-view="grid1" data-filter-source="view1" data-filter-fields="BudgetCode" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^Actuals^Actuals^Actuals^">
      <div id="view5" data-controller="ViewAccounting" data-view="grid1" data-filter-source="view1" data-filter-fields="BudgetCode" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>