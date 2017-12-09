<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="MyAccountAccess.aspx.vb" Inherits="Pages_MyAccountAccess"  Title="^MyAccountAccess^My Account Access^MyAccountAccess^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^MyAccountAccess^My Account Access^MyAccountAccess^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Pick_COA_Cross_Rules" data-show-in-summary="true" data-show-view-selector="false" data-auto-highlight-first-row="true"></div>
  </div>
</asp:Content>