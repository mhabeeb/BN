<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ViewReceipt.aspx.vb" Inherits="Pages_ViewReceipt"  Title="^ViewReceipt^View Receipt^ViewReceipt^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^ViewReceipt^View Receipt^ViewReceipt^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="View_Payments_AR" data-show-view-selector="false"></div>
  </div>
</asp:Content>