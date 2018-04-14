<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="Administration.aspx.vb" Inherits="Pages_Administration"  Title="^Administration^Administration^Administration^" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^Administration^Administration^Administration^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">

<div style="margin: 2px;  padding: 8px; width:20%;
            height: 500px;resize: both;
    overflow: auto; background-color:white; ">
  <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" ShowStartingNode="false" StartFromCurrentNode="true" />

  <asp:TreeView ID="TreeView1" runat="server" DataSourceID="SiteMapDataSource1" CssClass="TreeView" ImageSet="Simple" />

</div>
 <div id="bn18" style="background: white; position: absolute; top: 110px; left: 23%; width: 73%; height: 510px">
     <div class="container marketing">
        <!— Three columns of text below the carousel —>
        <br /><br />
        <div class="row">

            <div class="col-sm-4">
                <center><img src="../Images/automation-software.png"  style="width:38%;" class="w3-circle w3-hover-opacity"/>
                <h3 >
                  Workflow Setup
                </h3>
                <p data-editable="true">
                    Use the Setup Process Definitions page (EOAW_PRCS_MAIN) to define workflow approval process stages. 
                </p>
               <p style="font-size:20px;">
                   استخدم صفحة تعريفات عملية الإعداد <span style="font-size:14px"😠EOAW_PRCS_MAIN)</span> لتحديد مراحل عملية اعتماد سير العمل.
               </p></center>
            </div>
            
            <div class="col-sm-4">
                <center><img src="../Images/or.jpg"  style="width:38%;" class="w3-circle w3-hover-opacity"/>
                <h3 >
                 Organization Setup
                </h3>
                <p data-editable="true">
                   An organizational structure defines how activities such as task allocation, coordination and supervision are directed toward the achievement of organizational aims.
                </p>
               <p style="font-size:20px;">
                   ويحدد الهيكل التنظيمي كيفية توجيه أنشطة مثل تخصيص المهام والتنسيق والإشراف نحو تحقيق الأهداف التنظيمية.
               </p></center>
            </div>
            <!— /.col-sm-4 —>

        </div>
</div>
     </div>
</asp:Content>