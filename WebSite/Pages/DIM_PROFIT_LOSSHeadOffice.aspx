﻿<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="DIM_PROFIT_LOSSHeadOffice.aspx.vb" Inherits="Pages_DIM_PROFIT_LOSSHeadOffice"  Title="DIM PROFIT LOSS Head Office" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">DIM PROFIT LOSS Head Office</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="DIM_PROFIT_LOSSHeadOffice" data-view="grid1" data-show-in-summary="true" data-show-modal-forms="true" data-search-on-start="true"></div>
  </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SideBarPlaceHolder" runat="Server">
  <div class="TaskBox About">
    <div class="Inner">
      <div class="Header">About</div>
      <div class="Value">This page allows dim profit loss head office management.</div>
    </div>
  </div>
</asp:Content>