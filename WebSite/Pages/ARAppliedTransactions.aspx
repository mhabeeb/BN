<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ARAppliedTransactions.aspx.vb" Inherits="Pages_ARAppliedTransactions"  Title="^AppliedTransactions^Applied Transactions^AppliedTransactions^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^AppliedTransactions^Applied Transactions^AppliedTransactions^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="View_Payments_Applied_AR" data-show-in-summary="true" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
  </div>
</asp:Content>