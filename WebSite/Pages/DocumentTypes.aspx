﻿<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="DocumentTypes.aspx.vb" Inherits="Pages_DocumentTypes"  Title="Document Types" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">Document Types</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Document_Types" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true"></div>
  </div>
</asp:Content>