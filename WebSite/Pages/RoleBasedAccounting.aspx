<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="RoleBasedAccounting.aspx.vb" Inherits="Pages_RoleBasedAccounting"  Title="^RoleBasedAccounting^Role Based Accounting^RoleBasedAccounting^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^RoleBasedAccounting^Role Based Accounting^RoleBasedAccounting^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Role_Based_Accounting" data-show-modal-forms="true"></div>
  </div>
</asp:Content>