<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ViewPOLines.aspx.vb" Inherits="Pages_ViewPOLines"  Title="^ViePOLin^View PO Lines^ViePOLin^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^ViePOLin^View PO Lines^ViePOLin^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="View_PO_Lines" data-show-in-summary="true"></div>
  </div>
</asp:Content>