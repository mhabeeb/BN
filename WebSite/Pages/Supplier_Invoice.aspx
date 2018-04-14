<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="Supplier_Invoice.aspx.vb" Inherits="Pages_Supplier_Invoice"  Title="^SupplierInvoice^Supplier Invoice^SupplierInvoice^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^SupplierInvoice^Supplier Invoice^SupplierInvoice^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" runat="server"></div>
    <aquarium:DataViewExtender id="view1Extender" runat="server" TargetControlID="view1" Controller="AP_Inv_Header" view="" ShowInSummary="True" PageSize="5" ShowDescription="False" ShowViewSelector="False" StartCommandName="Select" ShowModalForms="True" AutoHighlightFirstRow="True" />
    <div data-activator="Tab|^InvLin^Invoice Lines^InvLin^">
      <div id="view2" runat="server"></div>
      <aquarium:DataViewExtender id="view2Extender" runat="server" TargetControlID="view2" Controller="APAR_Inv_Line" view="" FilterSource="view1Extender" FilterFields="Trx_ID" PageSize="5" ShowDescription="False" ShowViewSelector="False" ShowModalForms="True" />
    </div>
    <div data-activator="Tab|^UnbilledShipment^Unbilled Shipment^UnbilledShipment^">
      <div id="view3" runat="server"></div>
      <aquarium:DataViewExtender id="view3Extender" runat="server" TargetControlID="view3" Controller="Pick_Inv_Shipment" view="grid1" FilterSource="view1Extender" FilterFields="Sys_Number,Trx_ID" PageSize="5" ShowDescription="False" ShowViewSelector="False" ShowModalForms="True" />
    </div>
    <div data-activator="Tab|^ViewAccouting^View Accounting^ViewAccouting^">
      <div id="view5" runat="server"></div>
      <aquarium:DataViewExtender id="view5Extender" runat="server" TargetControlID="view5" Controller="ViewAccounting" view="" FilterSource="view1Extender" FilterFields="Trx_ID" PageSize="5" ShowDescription="False" ShowViewSelector="False" ShowModalForms="True" />
    </div>
    <div data-activator="Tab|^ViewPayments^View Payments^ViewPayments^">
      <div id="view6" runat="server"></div>
      <aquarium:DataViewExtender id="view6Extender" runat="server" TargetControlID="view6" Controller="View_Payments_Applied" view="grid1" FilterSource="view1Extender" FilterFields="Trx_ID" PageSize="5" ShowDescription="False" ShowViewSelector="False" ShowModalForms="True" />
    </div>
    <div data-activator="Tab|^AvailablePaymentstoApplied^Available Payments to Applied^AvailablePaymentstoApplied^">
      <div id="view4" runat="server"></div>
      <aquarium:DataViewExtender id="view4Extender" runat="server" TargetControlID="view4" Controller="Apply_Invoices_From_Invoices" view="grid1" FilterSource="view1Extender" FilterFields="Trx_ID" PageSize="5" ShowDescription="False" ShowViewSelector="False" ShowModalForms="True" />
    </div>
    <div data-activator="Tab|Applied Memo">
      <div id="view7" runat="server"></div>
      <aquarium:DataViewExtender id="view7Extender" runat="server" TargetControlID="view7" Controller="Appplied_CMDM" view="grid1" FilterSource="view1Extender" FilterFields="Trx_ID" PageSize="5" ShowDescription="False" ShowViewSelector="False" ShowModalForms="True" VisibleWhen="[Master.Multiplier]==1" />
    </div>
    <div data-activator="Tab|Applied Invoice">
      <div id="view8" runat="server"></div>
      <aquarium:DataViewExtender id="view8Extender" runat="server" TargetControlID="view8" Controller="Appplied_CMDM_On" view="grid1" FilterSource="view1Extender" FilterFields="Trx_ID" PageSize="5" ShowDescription="False" ShowViewSelector="False" ShowModalForms="True" VisibleWhen="[Master.Multiplier]==-1" />
    </div>
  </div>
</asp:Content>