<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="SupplyChain.aspx.vb" Inherits="Pages_SupplyChain"  Title="^SupplyChainManagement^Supply Chain Management^SupplyChainManagement^" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^SupplyChainManagement^Supply Chain Management^SupplyChainManagement^</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">
  
    <div style="margin: 2px;  padding: 8px; width:20%;
            height: 500px;resize: both;
    overflow: auto; background-color:white; ">

    <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" ShowStartingNode="false" StartFromCurrentNode="true" />
  <asp:TreeView ID="TreeView1" runat="server" DataSourceID="SiteMapDataSource1" CssClass="TreeView" ImageSet="Simple" />

</div>

 <div id="bn18" style="background: white; position: absolute; top: 110px; left: 23%; width: 73%; height: 510px">

        <!--<div class="container">-->
     <div class="container marketing">
        <!— Example row of thumbnails —>
        <div class="row"><br /><br /><br />
            &nbsp;&nbsp;<div class="col-sm-5 col-md-2">
                <div style="text-align:center">
                   
                    <img src="../App_Themes/images/Custom-Inventory.png"  style="width:60%;" class="w3-circle w3-hover-opacity"/>
                    <div class="caption"><br />
                        <h3 data-editable="true">Inventory</h3>
                        <p data-editable="true">Inventory or stock is the goods and materials that a business holds for the ultimate goals to have a purpose of resale.</p>
                        <br /><p style="font-size:20px">المخزون أو المخزون هو السلع والمواد التي الأعمال التجارية لتحقيق الأهداف النهائية أن يكون الغرض من إعادة البيع.</p>
                    </div>
                </div>
            </div>&nbsp;&nbsp;
            <div class="col-sm-5 col-md-3">
                <div  style="text-align:center">
                    <img src="../App_Themes/images/Project.png" style="width:40%;" class="w3-circle w3-hover-opacity""/>
                    
                    <div class="caption">
                        <h3 data-editable="true">Project</h3>
                        <p data-editable="true">A project is a unique, transient endeavour, undertaken to achieve planned objectives, which could be defined in terms of outputs, outcomes or benefits.</p>
                        <br /><p style="font-size:20px">ويعد المشروع مشروعا فريدا وعابرا يضطلع به لتحقيق الأهداف المقررة، ويمكن تعريفه من حيث النواتج أو النتائج أو الفوائد.</p>
                     </div>
                </div>
            </div>&nbsp;&nbsp;
            <div class="col-sm-5 col-sm-push-3 col-md-2 col-md-push-0">
                <div  style="text-align:center">
                    <a href="../Pages/SalesOrder.aspx">
                    <img src="../App_Themes/images/sales.jpg" style="width:60%;" class="w3-circle w3-hover-opacity"/></a>
                    <div class="caption">
                        <h3 data-editable="true">Sale</h3>
                        <p data-editable="true">A sale is a transaction between two parties where the buyer receives goods (tangible or intangible), services and/or assets in exchange for money.</p>
                        <p style="font-size:20px">البيع هو معاملة بين طرفين يتلقى فيه المشتري بضائع (ملموسة أو غير ملموسة)، و / أو خدمات و / أو أصول مقابل نقود.</p>
                     </div>
                </div>
            </div>&nbsp;&nbsp;
            <div class="col-sm-5 col-md-2">
                <div style="text-align:center">
                   <a href="../Pages/PurchaseOrder.aspx">
                    <img src="../App_Themes/images/images.jpg"  style="width:60%;" class="w3-circle w3-hover-opacity"/></a>
                    <div class="caption"><br />
                        <h3 data-editable="true">Purchasing</h3>
                        <p data-editable="true">Purchasing refers to a business or organization attempting to acquire goods or services to accomplish its goals.</p>
                        <br /><p style="font-size:20px">ويشير الشراء إلى نشاط تجاري أو منظمة تحاول الحصول على سلع أو خدمات لتحقيق أهدافها.</p>
                    </div>
                </div> <br /> <br />
            </div>
</div>
    </div>
     </div>
</asp:Content>
