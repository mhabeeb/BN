<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="CrossValidationRule.aspx.vb" Inherits="Pages_CrossValidationRule"  Title="^CrossValidationRule^Cross Validation Rule^CrossValidationRule^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^CrossValidationRule^Cross Validation Rule^CrossValidationRule^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="GL_Cross_Validation_Rule_Header" data-show-in-summary="true" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div data-activator="Tab|^Accounts^Accounts^Accounts^">
      <div id="view2" data-controller="GL_Cross_Validation_Rule_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="CVRID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    </div>
    <div data-activator="Tab|^AccountType^Account Type^AccountType^">
      <div id="view3" data-controller="GL_Cross_Validation_Rule_Lines_AT" data-view="grid1" data-filter-source="view1" data-filter-fields="CVRID" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    </div>
  </div>
</asp:Content>