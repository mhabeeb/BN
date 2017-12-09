Imports MyCompany.Data
Imports System
Imports System.Collections.Generic
Imports System.Data
Imports System.Linq
Imports System.Text.RegularExpressions
Imports System.Web
Imports System.Web.Security

Namespace MyCompany.Rules
    
    Partial Public Class AP_FullPayBusinessRules
        Inherits MyCompany.Rules.SharedBusinessRules
        
        <RowBuilder("AP_FullPay", RowKind.New)>  _
        Public Sub BuildNewAP_FullPay()
            UpdateFieldValue("Discount", 0.01)
        End Sub
    End Class
End Namespace
