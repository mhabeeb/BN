﻿<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="AppliedTransactions.aspx.vb" Inherits="Pages_AppliedTransactions"  Title="^AppliedTransactions^Applied Transactions^AppliedTransactions^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^AppliedTransactions^Applied Transactions^AppliedTransactions^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="View_Payments_Applied_AP" data-show-in-summary="true" data-show-view-selector="false"></div>
  </div>
</asp:Content>