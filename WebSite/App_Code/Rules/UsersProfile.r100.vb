Imports MyCompany.Data
Imports MyCompany.Models
Imports System
Imports System.Collections.Generic
Imports System.Data
Imports System.Linq
Imports System.Text.RegularExpressions
Imports System.Web
Imports System.Web.Security

Namespace MyCompany.Rules
    
    Partial Public Class UsersProfileBusinessRules
        Inherits MyCompany.Rules.SharedBusinessRules
        
        ''' <summary>
        ''' This method will execute in any view before an action
        ''' with a command name that matches "Insert|Update".
        ''' </summary>
        <Rule("r100")>  _
        Public Sub r100Implementation(ByVal instance As UsersProfileModel)
            'This is the placeholder for method implementation.
        End Sub
    End Class
End Namespace
