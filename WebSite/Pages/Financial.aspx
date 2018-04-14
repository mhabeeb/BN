<%@ Page Language="VB" MasterPageFile="~/Main.Master" AutoEventWireup="false" CodeFile="Financial.aspx.vb" Inherits="Pages_Financial"  Title="^FM^Financial Management^FM^" %>





<asp:Content ID="Content1" ContentPlaceHolderID="PageTitleContentPlaceHolder" runat="Server">^FM^Financial Management^FM^</asp:Content>
 <asp:Content ID="Content2" ContentPlaceHolderID="PageContentPlaceHolder" runat="Server">

        <div style="margin: 2px;  padding: 8px; width:20%;
            height: 500px;resize: both;
    overflow: auto; background-color:white; ">
           
        <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" ShowStartingNode="false" StartFromCurrentNode="true" />
   <asp:TreeView ID="TreeView1" runat="server" DataSourceID="SiteMapDataSource1" CssClass="TreeView" ImageSet="Simple" />  
                
        </div>

   <div id="bn18" style="background:white;position:absolute;top:110px;left:23%;width:73%;height:510px">
    
       <div class="container marketing">
        <!— Three columns of text below the carousel —>
        <div class="row">
            <br /><br /><br />
            <div class="col-sm-3">
                <img class="img-circle" src="../Images/gl5.png"  style=" border-radius: 50%; background-size: 200px 200px;"/>
                <h3 data-editable="true">
                    <span class="glyphicon glyphicon-dashboard"></span>
                    General Ledger- دفتر الأستاذ العام
                </h3>
                <p data-editable="true">
                  A general ledger contains all the accounts for recording transactions relating to a company's assets, liabilities, owners' equity, revenue, and expenses.
                    </p>
               
 <p data-editable="true" style="font-stretch:expanded; font-size:large">
                    يحتوي دفتر الأستاذ العام علي كافة الحسابات الخاصة بتسجيل الحركات المتعلقة بأصول الشركة ، و الالتزامات ، و الملكية ، والإيرادات ، والمصروفات.
                </p>
               
            </div>
            <!— /.col-sm-4 —>
            <div class="col-sm-3">
                <img class="img-circle" src="../Images/gl7.png" style=" border-radius: 50%; background-size: 200px 200px;""/>

                <h3 data-editable="true">
                    <span class="glyphicon glyphicon-phone"></span>
                    IFRS::International Financial Reporting
                </h3>
                  <p data-editable="true" >
                    The International Financial Reporting Standards (IFRS), 
Business Navigator Support Built In IFRS Functionality 
                </p>
                <p data-editable="true" style="font-stretch:expanded; font-size:large">
                  إن المعايير الدولية للتقارير المالية،
دعم الأعمال المستكشف بنيت في وظائف المعايير الدولية لإعداد التقارير المالية
                </p>
              
            </div>
          
            <div class="col-sm-3">
           <a href="../Pages/RecurringTransactions.aspx">
                <img class="img-circle" src="../Images/gl4.jpg" style=" border-radius: 50%;background-size: 200px 200px;"/>   </a>
                <h3 data-editable="true">
                    <span class="glyphicon glyphicon-leaf"></span>
                    VAT & Budgeting 
                </h3>
                <p data-editable="true">
                  Business Navigator Support Comprehensive Project & Financial Budgeting including Commitments & Obligation also supports Saudi Based VAT TAX
                </p>

                   <p data-editable="true" style="font-stretch:expanded; font-size:large">
دعم الأعمال المستكشف دعم المشروع الشامل والميزانية المالية بما في ذلك الالتزامات والالتزامات كما يدعم ضريبة القيمة المضافة ضريبة السعودية
                </p>
             
            </div>
            <!— /.col-sm-4 —>

        </div>
       
        <!— /.container —>
    </div>

        </div>
  </asp:Content>    
