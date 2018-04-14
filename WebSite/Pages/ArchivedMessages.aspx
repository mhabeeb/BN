<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ArchivedMessages.aspx.vb" Inherits="Pages_ArchivedMessages"  Title="^ArchivedMessages^Archived Messages^ArchivedMessages^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^ArchivedMessages^Archived Messages^ArchivedMessages^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="TBL_EmailInBox_ARCHIVE" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
  </div>
</asp:Content>