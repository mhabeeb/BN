<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ProjectWiseInComeStatment.aspx.vb" Inherits="Pages_ProjectWiseInComeStatment"  Title="^ProjectWiseIncomeStatement^Project Wise Income Statement^ProjectWiseIncomeStatement^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^ProjectWiseIncomeStatement^Project Wise Income Statement^ProjectWiseIncomeStatement^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Profit_and_Loss_Project" data-show-in-summary="true" data-show-view-selector="false" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^ViewAccounting^View Accounting^ViewAccounting^">
      <div id="view2" data-controller="ViewAccounting" data-filter-source="view1" data-filter-fields="TrxYear,Project_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>