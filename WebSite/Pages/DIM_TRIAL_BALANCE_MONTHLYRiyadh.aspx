<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="DIM_TRIAL_BALANCE_MONTHLYRiyadh.aspx.vb" Inherits="Pages_DIM_TRIAL_BALANCE_MONTHLYRiyadh"  Title="DIM TRIAL BALANCE MONTHLY Riyadh" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">DIM TRIAL BALANCE MONTHLY Riyadh</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="DIM_TRIAL_BALANCE_MONTHLYRiyadh" data-view="grid1" data-show-in-summary="true" data-show-modal-forms="true" data-search-on-start="true"></div>
  </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SideBarPlaceHolder" runat="Server">
  <div class="TaskBox About">
    <div class="Inner">
      <div class="Header">About</div>
      <div class="Value">This page allows dim trial balance monthly riyadh management.</div>
    </div>
  </div>
</asp:Content>