﻿<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="DefineValueSet.aspx.vb" Inherits="Pages_DefineValueSet"  Title="^DefineValueSet^Define Value Set^DefineValueSet^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^DefineValueSet^Define Value Set^DefineValueSet^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="LookUp_Values_Parents" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div id="view2" data-controller="LookUp_Values_Child" data-view="grid1" data-filter-source="view1" data-filter-fields="LookUpType" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
  </div>
</asp:Content>