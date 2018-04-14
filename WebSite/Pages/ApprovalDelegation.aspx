<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ApprovalDelegation.aspx.vb" Inherits="Pages_ApprovalDelegation"  Title="^AppDel^Approval Delegation^AppDel^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^AppDel^Approval Delegation^AppDel^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="TBL_Delegation" data-show-view-selector="false" data-show-modal-forms="true"></div>
  </div>
</asp:Content>