<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="OtherApplications.aspx.vb" Inherits="Pages_OtherApplications"  Title="^OtherApplications^Other Applications^OtherApplications^" %>


<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^OtherApplications^Other Applications^OtherApplications^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">


<div style="margin: 2px;  padding: 8px; width:20%;
            height: 200px;resize: both;
    overflow: auto; background-color:white; ">
  <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" ShowStartingNode="false" StartFromCurrentNode="true" />
  <asp:TreeView ID="TreeView1" runat="server" DataSourceID="SiteMapDataSource1" CssClass="TreeView" ImageSet="Simple" />
</div>

<div id="bn18" style="background: white; position: absolute; top: 110px; left: 23%; width: 73%; height: 220px">

     <br /><br />
    <div class="container marketing">
        <!— Three columns of text below the carousel —>
        
        <div class="row">
            <div class="col-sm-2">
                <a href="#"><img src="../Images/CRMBanner.png" style="width:70%;" class="w3-circle w3-hover-opacity"/>
                </a><h3 >
                 CRM
                </h3>
                <b><p data-editable="true">
                        </p>
               <p style="font-size:20px;">
                   
               </p></b>
            </div>
            
            <div class="col-sm-2">
                <a href="#"><img  src="../Images/hrms2.png" alt="Boss" style="width:70%;" class="w3-circle w3-hover-opacity"/>
                </a><b><h3 >
                HRMS
                </h3>
                <p data-editable="true">
                    </p>
               <p style="font-size:20px;">
                   </p></b>
            </div>
           
            <div class="col-sm-2">
            <a href="#"><img src="../Images/manufacturing.png" alt="Boss" style="width:70%;" class="w3-circle w3-hover-opacity">
                </a><b><h3 >
                    Manufacturing
                    </h3></b>
            </div>

            <div class="col-sm-2">
                <a href="#"><img src="../Images/workflow.png" alt="Boss" style="width:70%;" class="w3-circle w3-hover-opacity">
               </a><b><h3>  Workflow</h3></b>
                    <p data-editable="true"></p>
            </div>
        </div>
      
    </div>
</div>
     
<style>
    .well { text-align:center; }
    .well div { text-align:left; }
</style>

  

</asp:Content>