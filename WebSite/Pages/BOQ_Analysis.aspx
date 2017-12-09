<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="BOQ_Analysis.aspx.vb" Inherits="Pages_BOQ_Analysis"  Title="^BOQAnalysis^BOQ Analysis^BOQAnalysis^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^BOQAnalysis^BOQ Analysis^BOQAnalysis^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="SOBOQ_View_Analysis" data-show-in-summary="true" data-show-view-selector="false" data-search-by-first-letter="true" data-auto-highlight-first-row="true"></div>
  </div>
</asp:Content>