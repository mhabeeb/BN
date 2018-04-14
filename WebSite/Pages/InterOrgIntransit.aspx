<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="InterOrgIntransit.aspx.vb" Inherits="Pages_InterOrgIntransit"  Title="^InterOrgIntransit^Inter Org Intransit^InterOrgIntransit^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^InterOrgIntransit^Inter Org Intransit^InterOrgIntransit^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Inter_Org_Intransit" data-show-in-summary="true" data-show-description="false" data-show-view-selector="false" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^InterOrgLines^Inter Org Lines^InterOrgLines^">
      <div id="view2" data-controller="View_Inventory_Lines" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^ViewAccounting^View Accounting^ViewAccounting^">
      <div id="view3" data-controller="ViewAccounting" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>