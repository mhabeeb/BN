<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="BankCashInformation.aspx.vb" Inherits="Pages_BankCashInformation"  Title="^BanCasInf^Bank Cash Information^BanCasInf^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^BanCasInf^Bank Cash Information^BanCasInf^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="BankCashInformation" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^PayRec^Payment/Receipt^PayRec^">
      <div id="view2" data-controller="APAR_PaymentsBNKXFER" data-view="grid1" data-filter-source="view1" data-filter-fields="CashBankID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^DirectJVInGL^Direct JV's In GL^DirectJVInGL^">
      <div id="view3" data-controller="Bank_Accounts_DirectJV_Reports" data-view="grid1" data-filter-source="view1" data-filter-fields="Account_ID_Cash" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^JournalDetails^Journal Details^JournalDetails^">
      <div id="view4" data-controller="ViewAccountingBNKXfer" data-view="grid1" data-filter-source="view1" data-filter-fields="Account_ID_Cash" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^AccountsDimension^Accounts Dimension^AccountsDimension^">
      <div id="view7" data-controller="SYS_Default_Account" data-view="grid1" data-filter-source="view1" data-filter-fields="CashBankID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^PayDocument^Pay Document^PayDocument^">
      <div id="view5" data-controller="tbl_Document_Sequencing_Bank" data-view="grid1" data-filter-source="view1" data-filter-fields="CashBankID" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>