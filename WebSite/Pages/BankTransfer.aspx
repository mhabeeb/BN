<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="BankTransfer.aspx.vb" Inherits="Pages_BankTransfer"  Title="^BanTra^Bank Transfer^BanTra^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^BanTra^Bank Transfer^BanTra^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="BankTransfer" data-show-in-summary="true" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    <div data-activator="Tab|^ViewAccounting^View Accounting^ViewAccounting^">
      <div id="view4" data-controller="ViewAccountingBNKXfer" data-view="grid1" data-filter-source="view1" data-filter-fields="XferID" data-page-size="5" data-show-view-selector="false" data-auto-hide="self" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^PaymentReceipt^Payment/Receipt^PaymentReceipt^">
      <div id="view2" data-controller="APAR_PaymentsBNKXFER" data-view="grid1" data-filter-source="view1" data-filter-fields="XferID" data-page-size="5" data-show-view-selector="false" data-auto-hide="self" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>