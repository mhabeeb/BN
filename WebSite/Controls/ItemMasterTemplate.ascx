<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ItemMasterTemplate.ascx.vb" Inherits="Controls_ItemMasterTemplate"  %>
<!-- 
    This section provides a sample markup for Desktop user inteface.
-->
<div id="ItemMaster_editForm1" style="display:none;">
    <div>
        {Item_Code}
    </div>
    <div>
        {Item_Description}
    </div>
    <div>
        {UOM}
    </div>
</div>
<!-- 
    This section provides a sample markup for Touch UI user interface. 
-->
<div id="ItemMasterTemplate" data-app-role="page" data-activator="Button|ItemMasterTemplate">
  <p>
            Markup of <i>ItemMasterTemplate</i> custom user control for Touch UI.
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
