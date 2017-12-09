<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="FiscalYearDefination.aspx.vb" Inherits="Pages_FiscalYearDefination"  Title="^FiscalYearDefination^Fiscal Year Defination^FiscalYearDefination^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^FiscalYearDefination^Fiscal Year Defination^FiscalYearDefination^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Calendar_Defination" data-show-in-summary="true" data-show-action-buttons="top" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div id="view2" data-controller="GL_Month_Closing" data-view="grid1" data-filter-source="view1" data-filter-fields="FY_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
  </div>
</asp:Content>