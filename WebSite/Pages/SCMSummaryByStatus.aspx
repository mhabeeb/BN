<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="SCMSummaryByStatus.aspx.vb" Inherits="Pages_SCMSummaryByStatus"  Title="^SCMSummaryByStatus^SCM Summary By Status^SCMSummaryByStatus^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^SCMSummaryByStatus^SCM Summary By Status^SCMSummaryByStatus^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="SCM_Cross_Tab_Reports_Status" data-show-in-summary="true" data-show-view-selector="false"></div>
  </div>
</asp:Content>