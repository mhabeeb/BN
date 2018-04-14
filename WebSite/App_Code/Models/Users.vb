Imports MyCompany.Data
Imports System
Imports System.Collections.Generic
Imports System.Data
Imports System.Linq

Namespace MyCompany.Models
    
    Partial Public Class UsersModel
        Inherits BusinessRulesObjectModel
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_UserID As Nullable(Of Integer)
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_UserFullName As String
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_UserName As String
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_Password As String
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_Email As String
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_Comment As String
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_OPU_Code As Nullable(Of Integer)
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_Company_Code As Nullable(Of Integer)
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_Store_ID As Nullable(Of Integer)
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_Price_List_Name As String
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_IsSalesTeamYN As Nullable(Of Integer)
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_IsReadOnly As Nullable(Of Integer)
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_IsWriteOnly As Nullable(Of Integer)
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_Report_To As Nullable(Of Integer)
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_Created_By As Nullable(Of Decimal)
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_Created_DateTime As Nullable(Of DateTime)
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_Updated_By As Nullable(Of Decimal)
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_Updated_DateTime As Nullable(Of DateTime)
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_PasswordQuestion As String
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_PasswordAnswer As String
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_IsApproved As Nullable(Of Short)
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_LastActivityDate As Nullable(Of DateTime)
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_LastLoginDate As Nullable(Of DateTime)
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_LastPasswordChangedDate As Nullable(Of DateTime)
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_CreationDate As Nullable(Of DateTime)
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_IsLockedOut As Nullable(Of Short)
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_LastLockedOutDate As Nullable(Of DateTime)
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_FailedPasswordAttemptCount As Nullable(Of Short)
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_FailedPasswordAttemptWindowStart As Nullable(Of DateTime)
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_FailedPasswordAnswerAttemptCount As Nullable(Of Short)
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_FailedPasswordAnswerAttemptWindowStart As Nullable(Of DateTime)
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_CashBankID As Nullable(Of Decimal)
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_Rpt_Group_ID As Nullable(Of Short)
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_DefaultProject As String
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_ABranch As String
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_AStoreName As String
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_ACompanyName As String
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_ABranchAR As String
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_AddressAr As String
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_AddressEn As String
        
        Public Sub New()
            MyBase.New
        End Sub
        
        Public Sub New(ByVal r As BusinessRules)
            MyBase.New(r)
        End Sub
        
        Public Property UserID() As Nullable(Of Integer)
            Get
                Return m_UserID
            End Get
            Set
                m_UserID = value
                UpdateFieldValue("UserID", value)
            End Set
        End Property
        
        Public Property UserFullName() As String
            Get
                Return m_UserFullName
            End Get
            Set
                m_UserFullName = value
                UpdateFieldValue("UserFullName", value)
            End Set
        End Property
        
        Public Property UserName() As String
            Get
                Return m_UserName
            End Get
            Set
                m_UserName = value
                UpdateFieldValue("UserName", value)
            End Set
        End Property
        
        Public Property Password() As String
            Get
                Return m_Password
            End Get
            Set
                m_Password = value
                UpdateFieldValue("Password", value)
            End Set
        End Property
        
        Public Property Email() As String
            Get
                Return m_Email
            End Get
            Set
                m_Email = value
                UpdateFieldValue("Email", value)
            End Set
        End Property
        
        Public Property Comment() As String
            Get
                Return m_Comment
            End Get
            Set
                m_Comment = value
                UpdateFieldValue("Comment", value)
            End Set
        End Property
        
        Public Property OPU_Code() As Nullable(Of Integer)
            Get
                Return m_OPU_Code
            End Get
            Set
                m_OPU_Code = value
                UpdateFieldValue("OPU_Code", value)
            End Set
        End Property
        
        Public Property Company_Code() As Nullable(Of Integer)
            Get
                Return m_Company_Code
            End Get
            Set
                m_Company_Code = value
                UpdateFieldValue("Company_Code", value)
            End Set
        End Property
        
        Public Property Store_ID() As Nullable(Of Integer)
            Get
                Return m_Store_ID
            End Get
            Set
                m_Store_ID = value
                UpdateFieldValue("Store_ID", value)
            End Set
        End Property
        
        Public Property Price_List_Name() As String
            Get
                Return m_Price_List_Name
            End Get
            Set
                m_Price_List_Name = value
                UpdateFieldValue("Price_List_Name", value)
            End Set
        End Property
        
        Public Property IsSalesTeamYN() As Nullable(Of Integer)
            Get
                Return m_IsSalesTeamYN
            End Get
            Set
                m_IsSalesTeamYN = value
                UpdateFieldValue("IsSalesTeamYN", value)
            End Set
        End Property
        
        Public Property IsReadOnly() As Nullable(Of Integer)
            Get
                Return m_IsReadOnly
            End Get
            Set
                m_IsReadOnly = value
                UpdateFieldValue("IsReadOnly", value)
            End Set
        End Property
        
        Public Property IsWriteOnly() As Nullable(Of Integer)
            Get
                Return m_IsWriteOnly
            End Get
            Set
                m_IsWriteOnly = value
                UpdateFieldValue("IsWriteOnly", value)
            End Set
        End Property
        
        Public Property Report_To() As Nullable(Of Integer)
            Get
                Return m_Report_To
            End Get
            Set
                m_Report_To = value
                UpdateFieldValue("Report_To", value)
            End Set
        End Property
        
        Public Property Created_By() As Nullable(Of Decimal)
            Get
                Return m_Created_By
            End Get
            Set
                m_Created_By = value
                UpdateFieldValue("Created_By", value)
            End Set
        End Property
        
        Public Property Created_DateTime() As Nullable(Of DateTime)
            Get
                Return m_Created_DateTime
            End Get
            Set
                m_Created_DateTime = value
                UpdateFieldValue("Created_DateTime", value)
            End Set
        End Property
        
        Public Property Updated_By() As Nullable(Of Decimal)
            Get
                Return m_Updated_By
            End Get
            Set
                m_Updated_By = value
                UpdateFieldValue("Updated_By", value)
            End Set
        End Property
        
        Public Property Updated_DateTime() As Nullable(Of DateTime)
            Get
                Return m_Updated_DateTime
            End Get
            Set
                m_Updated_DateTime = value
                UpdateFieldValue("Updated_DateTime", value)
            End Set
        End Property
        
        Public Property PasswordQuestion() As String
            Get
                Return m_PasswordQuestion
            End Get
            Set
                m_PasswordQuestion = value
                UpdateFieldValue("PasswordQuestion", value)
            End Set
        End Property
        
        Public Property PasswordAnswer() As String
            Get
                Return m_PasswordAnswer
            End Get
            Set
                m_PasswordAnswer = value
                UpdateFieldValue("PasswordAnswer", value)
            End Set
        End Property
        
        Public Property IsApproved() As Nullable(Of Short)
            Get
                Return m_IsApproved
            End Get
            Set
                m_IsApproved = value
                UpdateFieldValue("IsApproved", value)
            End Set
        End Property
        
        Public Property LastActivityDate() As Nullable(Of DateTime)
            Get
                Return m_LastActivityDate
            End Get
            Set
                m_LastActivityDate = value
                UpdateFieldValue("LastActivityDate", value)
            End Set
        End Property
        
        Public Property LastLoginDate() As Nullable(Of DateTime)
            Get
                Return m_LastLoginDate
            End Get
            Set
                m_LastLoginDate = value
                UpdateFieldValue("LastLoginDate", value)
            End Set
        End Property
        
        Public Property LastPasswordChangedDate() As Nullable(Of DateTime)
            Get
                Return m_LastPasswordChangedDate
            End Get
            Set
                m_LastPasswordChangedDate = value
                UpdateFieldValue("LastPasswordChangedDate", value)
            End Set
        End Property
        
        Public Property CreationDate() As Nullable(Of DateTime)
            Get
                Return m_CreationDate
            End Get
            Set
                m_CreationDate = value
                UpdateFieldValue("CreationDate", value)
            End Set
        End Property
        
        Public Property IsLockedOut() As Nullable(Of Short)
            Get
                Return m_IsLockedOut
            End Get
            Set
                m_IsLockedOut = value
                UpdateFieldValue("IsLockedOut", value)
            End Set
        End Property
        
        Public Property LastLockedOutDate() As Nullable(Of DateTime)
            Get
                Return m_LastLockedOutDate
            End Get
            Set
                m_LastLockedOutDate = value
                UpdateFieldValue("LastLockedOutDate", value)
            End Set
        End Property
        
        Public Property FailedPasswordAttemptCount() As Nullable(Of Short)
            Get
                Return m_FailedPasswordAttemptCount
            End Get
            Set
                m_FailedPasswordAttemptCount = value
                UpdateFieldValue("FailedPasswordAttemptCount", value)
            End Set
        End Property
        
        Public Property FailedPasswordAttemptWindowStart() As Nullable(Of DateTime)
            Get
                Return m_FailedPasswordAttemptWindowStart
            End Get
            Set
                m_FailedPasswordAttemptWindowStart = value
                UpdateFieldValue("FailedPasswordAttemptWindowStart", value)
            End Set
        End Property
        
        Public Property FailedPasswordAnswerAttemptCount() As Nullable(Of Short)
            Get
                Return m_FailedPasswordAnswerAttemptCount
            End Get
            Set
                m_FailedPasswordAnswerAttemptCount = value
                UpdateFieldValue("FailedPasswordAnswerAttemptCount", value)
            End Set
        End Property
        
        Public Property FailedPasswordAnswerAttemptWindowStart() As Nullable(Of DateTime)
            Get
                Return m_FailedPasswordAnswerAttemptWindowStart
            End Get
            Set
                m_FailedPasswordAnswerAttemptWindowStart = value
                UpdateFieldValue("FailedPasswordAnswerAttemptWindowStart", value)
            End Set
        End Property
        
        Public Property CashBankID() As Nullable(Of Decimal)
            Get
                Return m_CashBankID
            End Get
            Set
                m_CashBankID = value
                UpdateFieldValue("CashBankID", value)
            End Set
        End Property
        
        Public Property Rpt_Group_ID() As Nullable(Of Short)
            Get
                Return m_Rpt_Group_ID
            End Get
            Set
                m_Rpt_Group_ID = value
                UpdateFieldValue("Rpt_Group_ID", value)
            End Set
        End Property
        
        Public Property DefaultProject() As String
            Get
                Return m_DefaultProject
            End Get
            Set
                m_DefaultProject = value
                UpdateFieldValue("DefaultProject", value)
            End Set
        End Property
        
        Public Property ABranch() As String
            Get
                Return m_ABranch
            End Get
            Set
                m_ABranch = value
                UpdateFieldValue("ABranch", value)
            End Set
        End Property
        
        Public Property AStoreName() As String
            Get
                Return m_AStoreName
            End Get
            Set
                m_AStoreName = value
                UpdateFieldValue("AStoreName", value)
            End Set
        End Property
        
        Public Property ACompanyName() As String
            Get
                Return m_ACompanyName
            End Get
            Set
                m_ACompanyName = value
                UpdateFieldValue("ACompanyName", value)
            End Set
        End Property
        
        Public Property ABranchAR() As String
            Get
                Return m_ABranchAR
            End Get
            Set
                m_ABranchAR = value
                UpdateFieldValue("ABranchAR", value)
            End Set
        End Property
        
        Public Property AddressAr() As String
            Get
                Return m_AddressAr
            End Get
            Set
                m_AddressAr = value
                UpdateFieldValue("AddressAr", value)
            End Set
        End Property
        
        Public Property AddressEn() As String
            Get
                Return m_AddressEn
            End Get
            Set
                m_AddressEn = value
                UpdateFieldValue("AddressEn", value)
            End Set
        End Property
    End Class
End Namespace
