Imports MyCompany.Data
Imports MyCompany.Models
Imports System
Imports System.Collections.Generic
Imports System.Data
Imports System.Linq
Imports System.Text.RegularExpressions
Imports System.Web
Imports System.Web.Security
Imports MyCompany.Security

Namespace MyCompany.Rules

    Partial Public Class UsersBusinessRules
        Inherits MyCompany.Data.BusinessRules

        ''' <summary>
        ''' This method will execute in any view before an action
        ''' with a command name that matches "Update|Insert".
        ''' </summary>
        <Rule("r100")>
        Public Sub r100Implementation(ByVal userID As Nullable(Of Integer),
                                      ByVal userName As String, ByVal password As FieldValue)
            If Not password Is Nothing And password.Modified Then
                ApplicationMembershipProvider.ValidateUserPassword(userName, password.NewValue)
                password.NewValue =
                     ApplicationMembershipProvider.EncodeUserPassword(password.NewValue)
            End If
        End Sub
    End Class
End Namespace
