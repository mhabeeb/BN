<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="TrialBalance.aspx.vb" Inherits="Pages_TrialBalance"  Title="^TrialBalance^Trial Balance^TrialBalance^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^TrialBalance^Trial Balance^TrialBalance^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view2" data-controller="Trail_Balance_View" data-show-in-summary="true" data-page-size="15" data-show-view-selector="false" data-auto-select-first-row="true" data-auto-highlight-first-row="true"></div>
  </div>
</asp:Content>