<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ItemPriceList.aspx.vb" Inherits="Pages_ItemPriceList"  Title="^ItemPriceList^Item Price List^ItemPriceList^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^ItemPriceList^Item Price List^ItemPriceList^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="tbl_Price_List_Master" data-show-in-summary="true" data-show-description="false" data-show-view-selector="false" data-show-modal-forms="true"></div>
    <div id="view2" data-controller="Pick_Item_Master" data-show-in-summary="true" data-show-description="false" data-show-view-selector="false"></div>
  </div>
</asp:Content>