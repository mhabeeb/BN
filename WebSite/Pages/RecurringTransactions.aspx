﻿<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="RecurringTransactions.aspx.vb" Inherits="Pages_RecurringTransactions"  Title="^RecurringTransactions^Recurring Transactions^RecurringTransactions^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^RecurringTransactions^Recurring Transactions^RecurringTransactions^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Recurring_Trx_Header" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true"></div>
    <div data-activator="Tab|">
      <div id="view2" data-controller="Recurring_Trx_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="RecurringID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>