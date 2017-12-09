<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="Employees.aspx.vb" Inherits="Pages_Employees"  Title="Employees" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">Employees</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  <div data-flow="row">
    <div id="view1" data-controller="Employees" data-view="grid1" data-show-in-summary="true" data-search-on-start="true"></div>
  </div>
  <div data-flow="row">
    <div data-activator="Tab|Assets">
      <div id="view2" data-controller="Assets" data-view="grid1" data-filter-source="view1" data-filter-fields="EmployeeID" data-page-size="5" data-auto-hide="container" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|Vacation Schedules">
      <div id="view3" data-controller="Vacation_Schedules" data-view="grid1" data-filter-source="view1" data-filter-fields="Emp_Id" data-page-size="5" data-auto-hide="container" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|Emp Times">
      <div id="view4" data-controller="Emp_Times" data-view="grid1" data-filter-source="view1" data-filter-fields="Emp_Id" data-page-size="5" data-auto-hide="container" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|Employee Salary">
      <div id="view5" data-controller="Employee_Salary" data-view="grid1" data-filter-source="view1" data-filter-fields="Emp_id" data-page-size="5" data-auto-hide="container" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|HR Journals">
      <div id="view6" data-controller="HR_Journals" data-view="grid1" data-filter-source="view1" data-filter-fields="Emp_Id" data-page-size="5" data-auto-hide="container" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|Non Recurring Elements">
      <div id="view7" data-controller="Non_Recurring_Elements" data-view="grid1" data-filter-source="view1" data-filter-fields="Emp_id" data-page-size="5" data-auto-hide="container" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|Recurring Elements">
      <div id="view8" data-controller="Recurring_Elements" data-view="grid1" data-filter-source="view1" data-filter-fields="Emp_id" data-page-size="5" data-auto-hide="container" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|SSHR Flexfield">
      <div id="view9" data-controller="SSHR_Flexfield" data-view="grid1" data-filter-source="view1" data-filter-fields="Emp_id" data-page-size="5" data-auto-hide="container" data-show-modal-forms="true"></div>
    </div>
    <div data-activator="Tab|Vacation Times">
      <div id="view10" data-controller="Vacation_Times" data-view="grid1" data-filter-source="view1" data-filter-fields="Emp_Id" data-page-size="5" data-auto-hide="container" data-show-modal-forms="true"></div>
    </div>
  </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SideBarPlaceHolder" runat="Server">
  <div class="TaskBox About">
    <div class="Inner">
      <div class="Header">About</div>
      <div class="Value">This page allows employees management.</div>
    </div>
  </div>
</asp:Content>