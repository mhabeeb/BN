﻿<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="DIM_TRIAL_BALANCEHeadOffice.aspx.vb" Inherits="Pages_DIM_TRIAL_BALANCEHeadOffice"  Title="DIM TRIAL BALANCE Head Office" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">DIM TRIAL BALANCE Head Office</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="DIM_TRIAL_BALANCEHeadOffice" data-view="grid1" data-show-in-summary="true" data-show-modal-forms="true" data-search-on-start="true"></div>
  </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SideBarPlaceHolder" runat="Server">
  <div class="TaskBox About">
    <div class="Inner">
      <div class="Header">About</div>
      <div class="Value">This page allows dim trial balance head office management.</div>
    </div>
  </div>
</asp:Content>