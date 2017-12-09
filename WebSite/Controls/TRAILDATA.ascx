<%@ Control Language="VB" AutoEventWireup="false" CodeFile="TRAILDATA.ascx.vb" Inherits="Controls_TRAILDATA"  %>
<!-- 
    This section provides a sample markup for Desktop user inteface.
-->
<asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate><div style="margin:2px;border: solid 1px silver;padding:8px;">uc:TRAILDATA</div></ContentTemplate></asp:UpdatePanel>
<!-- 
    This section provides a sample markup for Touch UI user interface. 
-->
<div id="TRAILDATA" data-app-role="page" data-activator="Button|TRAILDATA">
  <p>
            Markup of <i>TRAILDATA</i> custom user control for Touch UI.
          </p>
</div>
        
<script type="text/javascript">
    (function() {
        if ($app.touch)
            $(document).one('start.app', function () {
                // The page of Touch UI application is ready to be configured
        });
    })();
</script>
