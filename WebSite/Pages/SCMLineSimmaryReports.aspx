<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="SCMLineSimmaryReports.aspx.vb" Inherits="Pages_SCMLineSimmaryReports"  Title="^SCMLineSimmaryReports^SCM Line Simmary Reports^SCMLineSimmaryReports^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^SCMLineSimmaryReports^SCM Line Simmary Reports^SCMLineSimmaryReports^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="SCM_Cross_Tab_Lines_Reports" data-show-description="false" data-show-view-selector="false"></div>
  </div>
</asp:Content>