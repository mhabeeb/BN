<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ProjectCostAllocation.aspx.vb" Inherits="Pages_ProjectCostAllocation"  Title="^ProjectCostAllocation^Project Cost Allocation^ProjectCostAllocation^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^ProjectCostAllocation^Project Cost Allocation^ProjectCostAllocation^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="ProjectCostAllocation" data-show-in-summary="true" data-show-view-selector="false" data-auto-highlight-first-row="true"></div>
  </div>
</asp:Content>