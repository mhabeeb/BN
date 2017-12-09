<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="PurchaseRequistion.aspx.vb" Inherits="Pages_PurchaseRequistion"  Title="^PurchaseRequistion^Purchase Requistion^PurchaseRequistion^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^PurchaseRequistion^Purchase Requistion^PurchaseRequistion^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="PR_Header" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^PRLines^PR Lines^PRLines^">
      <div id="view2" data-controller="PR_LINES" data-show-in-summary="true" data-filter-source="view1" data-filter-fields="PR_NO" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^AddFromBOQSO^Add From BOQ/SO^AddFromBOQSO^">
      <div id="view3" data-controller="Pick_SO_PR" data-view="grid1" data-filter-source="view1" data-filter-fields="PR_NO" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^AddfromDR^Add from DR^AddfromDR^">
      <div id="view4" data-controller="Pick_for_PR_From_DR" data-view="grid1" data-filter-source="view1" data-filter-fields="PR_NO" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^RFQRequest^RFQ - Request^RFQRequest^">
      <div id="view5" data-controller="RFQ_Open_PR" data-filter-source="view1" data-filter-fields="PR_NO" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>