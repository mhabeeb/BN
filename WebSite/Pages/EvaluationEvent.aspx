<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="EvaluationEvent.aspx.vb" Inherits="Pages_EvaluationEvent"  Title="Evaluation Event" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">Evaluation Event</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Parties_Evaluation_Master"></div>
    <div id="view2" data-controller="Parties_to_Evaluate" data-view="grid1" data-filter-source="view1" data-filter-fields="EventID" data-page-size="5" data-auto-hide="self" data-show-modal-forms="true"></div>
  </div>
</asp:Content>