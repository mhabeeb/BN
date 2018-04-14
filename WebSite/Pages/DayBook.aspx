<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="DayBook.aspx.vb" Inherits="Pages_DayBook"  Title="^DayBook^Day Book^DayBook^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^DayBook^Day Book^DayBook^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="GL_DayBook" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
  </div>
</asp:Content>