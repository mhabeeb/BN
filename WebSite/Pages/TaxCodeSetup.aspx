<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="TaxCodeSetup.aspx.vb" Inherits="Pages_TaxCodeSetup"  Title="^TaxCodeSetup^Tax Code Setup^TaxCodeSetup^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^TaxCodeSetup^Tax Code Setup^TaxCodeSetup^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Tax_Code_Setup" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div class="DataViewHeader">^TaxSlabs^Tax Slabs^TaxSlabs^</div>
    <div id="view2" data-controller="Tax_Slabs" data-view="grid1" data-filter-source="view1" data-filter-fields="Tax_Code" data-page-size="5" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
  </div>
</asp:Content>