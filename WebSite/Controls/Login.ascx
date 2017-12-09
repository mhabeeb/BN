<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Login.ascx.vb" Inherits="Controls_Login"  %>              
<div data-app-role="page" data-content-framework="bootstrap">
      <div class="navbar navbar-default navbar-static-top" role="navigation">
          <div class="container">
              <div class="navbar-header">
                  <span class="navbar-brand">Standalone Login Page</span>
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
      </div>
      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
          <div class="container">
              <h3><img src="./Images/BN.jpg" />&nbsp;Welcome to Business Navigator </h3>
              <p>
                  

                  <%--Use it as a starting point to create something more unique.</p>--%>
                  
              </p>
			
              
          </div>
      </div>

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
