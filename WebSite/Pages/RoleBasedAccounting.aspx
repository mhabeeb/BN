<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="RoleBasedAccounting.aspx.vb" Inherits="Pages_RoleBasedAccounting"  Title="^RoleBasedAccounting^Role Based Accounting^RoleBasedAccounting^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^RoleBasedAccounting^Role Based Accounting^RoleBasedAccounting^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div class="DataViewHeader">^RolBasAcc^Role Based Accounting^RolBasAcc^</div>
    <div id="view1" data-controller="Role_Based_Accounting" data-show-in-summary="true" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
  </div>
</asp:Content>