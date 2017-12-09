<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="RequestForQuotation.aspx.vb" Inherits="Pages_RequestForQuotation"  Title="^RequestForQuotation^Request For Quotation^RequestForQuotation^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^RequestForQuotation^Request For Quotation^RequestForQuotation^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view2" data-controller="RFQ_Header" data-show-in-summary="true" data-show-view-selector="false" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^RFQLines^RFQ Lines^RFQLines^">
      <div id="view1" data-controller="RFQ_Lines" data-view="grid1" data-show-in-summary="true" data-filter-source="view2" data-filter-fields="RFQ_NO" data-page-size="5" data-auto-select-first-row="true" data-auto-highlight-first-row="true"></div>
    </div>
    <div data-activator="Tab|^RFQInvitationList^RFQ Invitation List^RFQInvitationList^">
      <div id="view4" data-controller="RFQ_Invitaion_List" data-view="grid1" data-filter-source="view2" data-filter-fields="RFQ_NO" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^OpenPRLines^Open PR Lines^OpenPRLines^">
      <div id="view5" data-controller="RFQ_Open_PR" data-filter-source="view2" data-filter-fields="RFQ_NO" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div class="DataViewHeader">^RFQQuotations^RFQ Quotations^RFQQuotations^</div>
    <div id="view6" data-controller="RFQ_Quotation" data-view="grid1" data-filter-source="view1" data-filter-fields="PR_Line_No" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
  </div>
</asp:Content>