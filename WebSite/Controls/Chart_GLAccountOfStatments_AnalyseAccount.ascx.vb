Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.DataVisualization.Charting
Imports System.Web.UI.WebControls


Partial Public Class Controls_Chart_GLAccountOfStatments_AnalyseAccount
    Inherits Global.System.Web.UI.UserControl
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
    End Sub
    
    Public Overrides Sub DataBind()
        MyBase.DataBind()
        Chart1.DataManipulator.Group("Sum, X:Center", 1, IntervalType.Weeks, "Closing_Amount")
        Chart1.Series("Closing_Amount")("DrawingStyle") = "Cylinder"
    End Sub
End Class
