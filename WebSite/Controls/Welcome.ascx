<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Welcome.ascx.vb" Inherits="Controls_Welcome"  %><div style="padding-left:8px"><div class="ParaInfo">
        ^SignInInstruction^Sign in to access the protected site content.^SignInInstruction^</div>
<div class="ParaHeader">
    ^SignInHeader^Instructions^SignInHeader^
  <a href="http://localhost/UPK/">Visit our HTML tutorial</a>
</div>
<div class="ParaText">
    ^SignInPara1^Two standard user accounts are automatically created when application is initialized
    if membership option has been selected for this application.^SignInPara1^
</div>
<div class="ParaText">
    <div style="border: solid 1px black; background-color: InfoBackground; padding: 8px;
        float: left;">
        ^AdminDesc^Administrative account^AdminDesc^:<br />
       
        <br />
        <br />
        ^UserDesc^Standard user account^UserDesc^:<br />
      
    </div>
    <div style="clear:both;margin-bottom:8px"></div>
    </div>
</div>


<div id="app-welcome" data-app-role="page" data-activator="Button|^SignInHeader^Instructions^SignInHeader^" data-activator-description="^SignInInstruction^Sign in to access the protected site content.^SignInInstruction^">
      <p>^SignInInstruction^Sign in to access the protected site content.^SignInInstruction^</p>
      <p>
          ^SignInPara1^Two standard user accounts are automatically created when application is initialized
  if membership option has been selected for this application.^SignInPara1^
      </p>

      <p>
          ^SignInPara2^The administrative account <b>admin</b> is authorized to access all areas of the
  web site and membership manager. The standard <b>user</b> account is allowed to
  access all areas of the web site with the exception of membership manager.^SignInPara2^
      </p>
      <p>
          ^AdminDesc^Administrative account^AdminDesc^:<br />
          
      </p>
      <p>
          ^UserDesc^Standard user account^UserDesc^:<br />
          
      </p>
      <p><a href="#" data-role="button" data-inline="true" data-theme="b" data-app-role="loginstatus" data-icon="lock">Login Status</a></p>

</div>