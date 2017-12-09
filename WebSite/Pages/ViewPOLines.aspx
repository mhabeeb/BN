<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ViewPOLines.aspx.vb" Inherits="Pages_ViewPOLines"  Title="^ViewPOLines^View POLines^ViewPOLines^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^ViewPOLines^View POLines^ViewPOLines^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="View_PO_Lines"></div>
  </div>
</asp:Content>