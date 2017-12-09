<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="DefineCalender.aspx.vb" Inherits="Pages_DefineCalender"  Title="^DefineCalender^Define Calender^DefineCalender^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^DefineCalender^Define Calender^DefineCalender^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="tbl_Calendar_Master"></div>
  </div>
</asp:Content>