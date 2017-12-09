<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="QuoteAnalysis.aspx.vb" Inherits="Pages_QuoteAnalysis"  Title="^QuoteAnalysis^Quote Analysis^QuoteAnalysis^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^QuoteAnalysis^Quote Analysis^QuoteAnalysis^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="QuoteAnalysis" data-show-in-summary="true" data-page-size="15" data-show-view-selector="false" data-auto-highlight-first-row="true"></div>
  </div>
</asp:Content>