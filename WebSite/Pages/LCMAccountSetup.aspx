<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="LCMAccountSetup.aspx.vb" Inherits="Pages_LCMAccountSetup"  Title="^LCMAccountSetup^LCM Account Setup^LCMAccountSetup^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^LCMAccountSetup^LCM Account Setup^LCMAccountSetup^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="LCM_Elements" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true" data-auto-highlight-first-row="true"></div>
    <div class="DataViewHeader">^MatOveAcc^Material Overheads Accounts^MatOveAcc^</div>
    <div id="view2" data-controller="LCM_Material_Overheads_Accounts" data-view="grid1" data-filter-source="view1" data-filter-fields="Item_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
  </div>
</asp:Content>