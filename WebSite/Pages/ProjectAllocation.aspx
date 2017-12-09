<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ProjectAllocation.aspx.vb" Inherits="Pages_ProjectAllocation"  Title="^ProjectAllocation^Project Allocation^ProjectAllocation^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^ProjectAllocation^Project Allocation^ProjectAllocation^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Project_Cost_Allocation" data-show-modal-forms="true"></div>
    <div data-activator="Tab|">
      <div id="view2" data-controller="Recurring_Trx_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="RecurringID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>