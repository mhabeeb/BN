<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ViewInventoryTransactions.aspx.vb" Inherits="Pages_ViewInventoryTransactions"  Title="^VieInvTra^View Inventory Transactions^VieInvTra^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^VieInvTra^View Inventory Transactions^VieInvTra^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="View_Inventory_Lines" data-show-in-summary="true" data-show-description="false" data-show-view-selector="false"></div>
  </div>
</asp:Content>