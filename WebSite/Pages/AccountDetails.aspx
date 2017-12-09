<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="AccountDetails.aspx.vb" Inherits="Pages_AccountDetails"  Title="^JournalDetails^Journal Details^JournalDetails^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^JournalDetails^Journal Details^JournalDetails^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="ViewAccounting_EP" data-show-in-summary="true" data-show-view-selector="false"></div>
    <div id="view2" data-controller="View_GL_Header" data-view="grid1" data-filter-source="view1" data-filter-fields="GL_Serial_No" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
  </div>
</asp:Content>