<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ViewPRLines.aspx.vb" Inherits="Pages_ViewPRLines"  Title="^ViePRLin^View PR Lines^ViePRLin^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^ViePRLin^View PR Lines^ViePRLin^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="View_PR_Lines" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
  </div>
</asp:Content>