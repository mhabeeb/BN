<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="JournalBatch.aspx.vb" Inherits="Pages_JournalBatch"  Title="^JournalBatch^JournalBatch^JournalBatch^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^JournalBatch^JournalBatch^JournalBatch^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="V_General_Ledger_Batch" data-show-in-summary="true" data-show-view-selector="false"></div>
    <div data-activator="Tab|^BatchSummary^Batch Summary^BatchSummary^">
      <div id="view2" data-controller="V_General_Leder_Batch_Details" data-view="grid1" data-filter-source="view1" data-filter-fields="Batch_Name" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^ViewAccounting^View Accounting^ViewAccounting^">
      <div id="view3" data-controller="ViewAccounting" data-view="grid1" data-filter-source="view1" data-filter-fields="Trx_YYYYMM,Batch_Name" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true" data-show-details-in-list-mode="false"></div>
    </div>
  </div>
</asp:Content>