<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="App.aspx.vb" Inherits="Pages_App"  Title="App" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">App</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Approval_BI_Project_Major_MileStone"></div>
    <div id="view2" data-controller="Approval_BI_Project_Status_By_Phase"></div>
    <div id="view3" data-controller="Approval_BI_ProjectImages"></div>
    <div id="view4" data-controller="Approve_BI_ProjectDefineCurve"></div>
    <div id="view5" data-controller="Approve_BI_ProjectPlanVsActual"></div>
  </div>
</asp:Content>