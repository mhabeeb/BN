<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="AccounLedgerDetails.aspx.vb" Inherits="Pages_AccounLedgerDetails"  Title="^AccLedDet^Account Ledger Details^AccLedDet^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^AccLedDet^Account Ledger Details^AccLedDet^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="rpt_Account_Proj_Dept_Sites" data-show-in-summary="true" data-show-view-selector="false"></div>
  </div>
</asp:Content>