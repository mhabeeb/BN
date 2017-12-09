Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.DataVisualization.Charting
Imports System.Web.UI.WebControls


Partial Public Class Controls_Chart_CashFlowYearlySummary_Graph
    Inherits Global.System.Web.UI.UserControl
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
    End Sub
    
    Public Overrides Sub DataBind()
        MyBase.DataBind()
        Chart1.DataManipulator.GroupByAxisLabel("Sum", "January")
        Chart1.DataManipulator.GroupByAxisLabel("Sum", "February")
        Chart1.DataManipulator.GroupByAxisLabel("Sum", "March")
        Chart1.DataManipulator.GroupByAxisLabel("Sum", "April")
        Chart1.DataManipulator.GroupByAxisLabel("Sum", "May")
        Chart1.DataManipulator.GroupByAxisLabel("Sum", "June")
        Chart1.DataManipulator.GroupByAxisLabel("Sum", "July")
        Chart1.DataManipulator.GroupByAxisLabel("Sum", "August")
        Chart1.DataManipulator.GroupByAxisLabel("Sum", "September")
        Chart1.DataManipulator.GroupByAxisLabel("Sum", "October")
        Chart1.DataManipulator.GroupByAxisLabel("Sum", "November")
        Chart1.DataManipulator.GroupByAxisLabel("Sum", "December")
    End Sub
End Class
