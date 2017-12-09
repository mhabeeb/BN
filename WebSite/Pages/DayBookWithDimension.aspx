<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="DayBookWithDimension.aspx.vb" Inherits="Pages_DayBookWithDimension"  Title="Day Book With Dimension" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">Day Book With Dimension</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="GL_DayBook" data-show-in-summary="true" data-show-view-selector="false" data-auto-highlight-first-row="true"></div>
    <div id="view2" data-controller="GL_DayBook_2_Segment" data-show-view-selector="false"></div>
    <div id="view3" data-controller="GL_DayBook_3_Segment" data-show-view-selector="false"></div>
    <div id="view4" data-controller="GL_DayBook_4_Segment" data-show-view-selector="false"></div>
    <div id="view5" data-controller="GL_DayBook_5_Segment" data-show-view-selector="false"></div>
    <div id="view6" data-controller="GL_DayBook_6_Segment" data-show-view-selector="false"></div>
    <div id="view7" data-controller="GL_DayBook_7_Segment" data-show-view-selector="false"></div>
    <div id="view8" data-controller="GL_DayBook_8_Segment" data-show-view-selector="false"></div>
  </div>
</asp:Content>