<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="CurrencyRateUpdate.aspx.vb" Inherits="Pages_CurrencyRateUpdate"  Title="^CurrencyRateUpdate^Currency Rate Update^CurrencyRateUpdate^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^CurrencyRateUpdate^Currency Rate Update^CurrencyRateUpdate^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="CurrencyRateUpdate" data-view="createForm1" data-show-description="false" data-show-view-selector="false" data-start-command-name="New" data-start-command-argument="createForm1" data-show-modal-forms="true"></div>
  </div>
</asp:Content>