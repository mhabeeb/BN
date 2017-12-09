Imports MyCompany.Data
Imports System
Imports System.Collections.Generic
Imports System.Data
Imports System.Linq
Imports System.Text.RegularExpressions
Imports System.Web
Imports System.Web.Security

Namespace MyCompany.Rules
    
    Partial Public Class AP_MiscCashExpenceMultiLineBusinessRules
        Inherits MyCompany.Rules.SharedBusinessRules
        
        <RowBuilder("AP_MiscCashExpenceMultiLine", RowKind.New)>  _
        Public Sub BuildNewAP_MiscCashExpenceMultiLine()
            UpdateFieldValue("Amount_Paid", 0)
        End Sub
    End Class
End Namespace
