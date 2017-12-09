﻿<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ItemMisc_Issue.aspx.vb" Inherits="Pages_ItemMisc_Issue"  Title="^ItemMiscIssue^Item Misc. Issue^ItemMiscIssue^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^ItemMiscIssue^Item Misc. Issue^ItemMiscIssue^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Misc_Inventory_Issue" data-show-in-summary="true" data-page-size="7" data-show-view-selector="false" data-show-modal-forms="true" data-search-by-first-letter="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^MiscLine^Misc. Line^MiscLine^">
      <div id="view2" data-controller="Misc_Inventory_Line" data-view="grid1" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true" data-show-row-number="true"></div>
    </div>
    <div data-activator="Tab|^ViewAccounting^View Accounting^ViewAccounting^">
      <div id="view3" data-controller="ViewAccounting" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^ImportMiscIssue^Import Misc.Issue^ImportMiscIssue^">
      <div id="view4" data-controller="Import_Inventory_Balance" data-view="grid1" data-filter-source="view1" data-filter-fields="Transaction_ID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>