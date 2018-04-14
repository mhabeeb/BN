<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Login.ascx.vb" Inherits="Controls_Login"  %>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
    <!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">-->

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
          #carousel-example-generic {
            min-height: 350px;
            margin-bottom: 10px;
            margin-top: 10px;
        }
       div#PageHeaderBar {
            height: 30px;
            padding-bottom: 36px;
           
            font: bold 11pt verdana;
            color: #666666;
            padding-top: 4px;
        }
</style>        
<div data-app-role="page" data-content-framework="bootstrap">

      <div class="navbar navbar-default navbar-static-top" role="navigation">
          <div class="container">
              <div class="navbar-header">
                  <span class="navbar-brand"></span>
              </div>
              <div class="navbar-collapse">
                  <div class="navbar-form navbar-right" role="form">
                      <div class="form-group">
                          <input id="login-user-name" type="text" placeholder="Username" class="form-control" autocapitalize="off">
                      </div>
                      <div class="form-group">
                          <input id="login-password" type="password" placeholder="Password" class="form-control">
                      </div>
                      <button id="login-button" class="btn btn-success">Sign in</button>
                  </div>
              </div>
              <!--/.navbar-collapse -->
          </div>
    
     

         
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>
                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="./Images/ERP1.jpg" style="width:100%;height:100%" />
                        <!--<div class="carousel-caption">
                            <h2>Connect, Optimize and Automate Your Enterprise Fleet</h2>
                            <p>Our enterprise fleet management platform gives you the big picture by connecting your assets, people and work together on one platform to improve safety, efficiency and compliance.</p>
                        </div>-->
                    </div>
                    <div class="item">
                        <img src="./Images/erp2.jpg" style="width:100%;height:100%"  />
                      
                            <!--<div class="carousel-caption">

                                <h2>Fleet Vehicles GPS Tracking System</h2>
                                <p>Moniter Your Vehicles in real time using your mibile devices and Computer System.</p>

                            </div>-->
                        
                    </div>
                    <div class="item">
                        <img src="./Images/erp3.jpg"  style="width:100%;height:100%" />
                        <!--<div class="carousel-caption">
                            <h2>Built-in hardware</h2>
                            <p>A built-in telematics solution gives you richer diagnostic data, no installation downtime, capitalization tax benefits as well as warranty options backed by an extensive dealer network.</p>
                        </div>-->
                    </div>
                </div>

                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                </a>

               </div>
                
            
            <div class="w3-row w3-center">
               

                <div class="w3-quarter ">
                    
                    <a href="http://a3hitech/CRM/Login.aspx?ReturnUrl=%2fCRM%2fPages%2fHome.aspx"><img src="./Images/CRMBanner.png" alt="Boss" style="width:30%;" class="w3-circle w3-hover-opacity">
                    </a><p><b>CRM</b></p>
                    <p></p>
                </div>

                <div class="w3-quarter">
                   
                    <a href="#"><img src="./Images/hrms2.png" alt="Boss" style="width:30%;" class="w3-circle w3-hover-opacity">
                    </a><p><b>HRMS</b></p>
                    <p></p>
                </div>

                <div class="w3-quarter">
                    
                    <a href="http://a3hitech/DM/Login.aspx?ReturnUrl=%2fDM%2fPages%2fHome.aspx"><img src="./Images/manufacturing.png" alt="Boss" style="width:30%;" class="w3-circle w3-hover-opacity">
                    </a><p><b>Manufacturing</b></p>
                    <p></p>
                </div>

                <div class="w3-quarter">
                   
                    <a href="#"><img src="./Images/workflow.png" alt="Boss" style="width:30%;" class="w3-circle w3-hover-opacity">
                    </a><p><b>Workflow</b></p>
                    <p></p>
                </div>

            </div>
        </div>
    </div> 








    <!--End Here-->


      <div class="container">

          <div class="row">
              <div class="col-sm-8">
                  
                  

                  
              </div>
              <div class="col-sm-4">
                  

                  
              </div>
          </div>
          
          <!-- Example row of columns -->
          

          
      </div>
      <!-- /container -->
</div>


<script type="text/javascript">
    (function () {
        var resources = Web.MembershipResources.Messages;

        function performLogin() {

            var userName = $('#login-user-name'),
                password = $('#login-password');
            if (!userName.val())
                $app.alert(resources.BlankUserName, function () {
                    userName.focus();
                });
            else if (!password.val())
                $app.alert(resources.BlankPassword, function () {
                    password.focus();
                });
            else
                $app.login(userName.val(), password.val(), true,
                    function () {
                        var returnUrl = window.location.href.match(/\?ReturnUrl=(.+)$/);
                        window.location.replace(returnUrl);
                    },
                    function () {
                        $app.alert(resources.InvalidUserNameAndPassword, function () {
                            userName.focus();
                        });
                    });
            return false;
        }

        // remove any other "app" pages 
        $('div.SettingsPanel div[data-app-role="page"]').remove();
        // register event handlers
        $(document)
            .on('click', '#login-button', performLogin)
            .on('keydown', '#login-user-name,#login-password', function (event) {
                if (event.which == 13) {
                    performLogin();
                    return false;
                }
            });
    })();
</script>
