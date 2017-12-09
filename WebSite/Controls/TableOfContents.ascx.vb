Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Text.RegularExpressions
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls


Partial Public Class Controls_TableOfContents
    Inherits Global.System.Web.UI.UserControl
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not (IsPostBack) Then
            TreeView1.DataBind()
            ConfigureNodeTargets(TreeView1.Nodes)
        End If
    End Sub
    
    Private Sub ConfigureNodeTargets(ByVal nodes As TreeNodeCollection)
        For Each n As TreeNode in nodes
            Dim m As Match = Regex.Match(n.NavigateUrl, "^(_\w+):(.+)$")
            If m.Success Then
                n.Target = m.Groups(1).Value
                n.NavigateUrl = m.Groups(2).Value
            End If
            ConfigureNodeTargets(n.ChildNodes)
        Next
    End Sub
End Class
