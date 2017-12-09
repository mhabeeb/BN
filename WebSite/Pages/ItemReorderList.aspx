<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="ItemReorderList.aspx.vb" Inherits="Pages_ItemReorderList"  Title="^ItemReorderList^Item Reorder List^ItemReorderList^" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^ItemReorderList^Item Reorder List^ItemReorderList^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Item_Reorder_List" data-show-in-summary="true" data-show-view-selector="false"></div>
    <div data-activator="Tab|^InventoryTransactions^Inventory Transactions^InventoryTransactions^">
      <div id="view2" data-controller="View_Inventory_Lines" data-filter-source="view1" data-filter-fields="Item_Code,Item_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^POLines^PO Lines^POLines^">
      <div id="view3" data-controller="View_PO_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="Item_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^PRLines^PR Lines^PRLines^">
      <div id="view4" data-controller="View_PR_Lines" data-view="grid1" data-filter-source="view4" data-filter-fields="Item_Code" data-page-size="5" data-show-view-selector="false"></div>
    </div>
    <div data-activator="Tab|^SOLines^SO Lines^SOLines^">
      <div id="view5" data-controller="View_SO_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="Item_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^WHStock^WH Stock^WHStock^">
      <div id="view6" data-controller="View_Item_Stock" data-view="grid1" data-filter-source="view1" data-filter-fields="Item_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|^InvoiceLines^Invoice Lines^InvoiceLines^">
      <div id="view7" data-controller="View_Invoice_Lines" data-view="grid1" data-filter-source="view1" data-filter-fields="Item_Code" data-page-size="5" data-show-view-selector="false" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>