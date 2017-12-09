<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="InterCompanyJV_s.aspx.vb" Inherits="Pages_InterCompanyJV_s"  Title="^InterCompanyJVs^Inter Company JV's^InterCompanyJVs^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^InterCompanyJVs^Inter Company JV's^InterCompanyJVs^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Inter_Company_JVs_Rpt" data-show-in-summary="true" data-show-view-selector="false"></div>
  </div>
</asp:Content>