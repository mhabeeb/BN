Imports MyCompany.Data
Imports MyCompany.Handlers
Imports MyCompany.Web
Imports Newtonsoft.Json
Imports Newtonsoft.Json.Linq
Imports System
Imports System.Collections.Generic
Imports System.Collections.Specialized
Imports System.ComponentModel
Imports System.Configuration
Imports System.Data
Imports System.Data.Common
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.IO
Imports System.IO.Compression
Imports System.Linq
Imports System.Net
Imports System.Security.Cryptography
Imports System.Security.Principal
Imports System.Text
Imports System.Text.RegularExpressions
Imports System.Threading
Imports System.Web
Imports System.Web.Caching
Imports System.Web.Configuration
Imports System.Web.Routing
Imports System.Web.Security
Imports System.Web.SessionState
Imports System.Web.UI
Imports System.Web.UI.HtmlControls

Namespace MyCompany.Services
    
    Public MustInherit Class ServiceRequestHandler
        
        Public Overridable ReadOnly Property AllowedMethods() As String()
            Get
                Return New String() {"POST"}
            End Get
        End Property
        
        Public Overridable ReadOnly Property RequiresAuthentication() As Boolean
            Get
                Return false
            End Get
        End Property
        
        Public MustOverride Function HandleRequest(ByVal service As DataControllerService, ByVal args As JObject) As Object
        
        Public Overridable Function HandleException(ByVal args As JObject, ByVal ex As Exception) As Object
            Do While (Not (ex.InnerException) Is Nothing)
                ex = ex.InnerException
            Loop
            Dim [error] As ServiceRequestError = New ServiceRequestError()
            [error].Message = ex.Message
            [error].ExceptionType = ex.GetType().ToString()
            [error].StackTrace = ex.StackTrace
            Return [error]
        End Function
        
        Public Shared Sub Redirect(ByVal redirectUrl As String)
            Throw New ServiceRequestRedirectException(redirectUrl)
        End Sub
    End Class
    
    Public Class GetPageServiceRequestHandler
        Inherits ServiceRequestHandler
        
        Public Overrides Function HandleRequest(ByVal service As DataControllerService, ByVal args As JObject) As Object
            Dim r As PageRequest = args("request").ToObject(Of PageRequest)()
            Return service.GetPage(CType(args("controller"),String), CType(args("view"),String), r)
        End Function
    End Class
    
    Public Class GetPageListServiceRequestHandler
        Inherits ServiceRequestHandler
        
        Public Overrides Function HandleRequest(ByVal service As DataControllerService, ByVal args As JObject) As Object
            Return service.GetPageList(args("requests").ToObject(Of PageRequest())())
        End Function
    End Class
    
    Public Class GetListOfValuesServiceRequestHandler
        Inherits ServiceRequestHandler
        
        Public Overrides Function HandleRequest(ByVal service As DataControllerService, ByVal args As JObject) As Object
            Dim r As DistinctValueRequest = args("request").ToObject(Of DistinctValueRequest)()
            Return service.GetListOfValues(CType(args("controller"),String), CType(args("view"),String), r)
        End Function
    End Class
    
    Public Class ExecuteServiceRequestHandler
        Inherits ServiceRequestHandler
        
        Public Overrides Function HandleRequest(ByVal service As DataControllerService, ByVal args As JObject) As Object
            Dim a As ActionArgs = args("args").ToObject(Of ActionArgs)()
            Return service.Execute(CType(args("controller"),String), CType(args("view"),String), a)
        End Function
    End Class
    
    Public Class ExecuteListServiceRequestHandler
        Inherits ServiceRequestHandler
        
        Public Overrides Function HandleRequest(ByVal service As DataControllerService, ByVal args As JObject) As Object
            Return service.ExecuteList(args("requests").ToObject(Of ActionArgs())())
        End Function
    End Class
    
    Public Class GetCompletionListServiceRequestHandler
        Inherits ServiceRequestHandler
        
        Public Overrides Function HandleRequest(ByVal service As DataControllerService, ByVal args As JObject) As Object
            Return service.GetCompletionList(CType(args("prefixText"),String), CType(args("count"),Integer), CType(args("contextKey"),String))
        End Function
    End Class
    
    Public Class LoginServiceRequestHandler
        Inherits ServiceRequestHandler
        
        Public Overrides Function HandleRequest(ByVal service As DataControllerService, ByVal args As JObject) As Object
            Return service.Login(CType(args("username"),String), CType(args("password"),String), CType(args("createPersistentCookie"),Boolean))
        End Function
    End Class
    
    Public Class LogoutServiceRequestHandler
        Inherits ServiceRequestHandler
        
        Public Overrides Function HandleRequest(ByVal service As DataControllerService, ByVal args As JObject) As Object
            service.Logout()
            Return Nothing
        End Function
    End Class
    
    Public Class RolesServiceRequestHandler
        Inherits ServiceRequestHandler
        
        Public Overrides Function HandleRequest(ByVal service As DataControllerService, ByVal args As JObject) As Object
            Return service.Roles()
        End Function
    End Class
    
    Public Class ThemesServiceRequestHandler
        Inherits ServiceRequestHandler
        
        Public Overrides Function HandleRequest(ByVal service As DataControllerService, ByVal args As JObject) As Object
            Return service.Themes()
        End Function
    End Class
    
    Public Class SavePermalinkServiceRequestHandler
        Inherits ServiceRequestHandler
        
        Public Overrides Function HandleRequest(ByVal service As DataControllerService, ByVal args As JObject) As Object
            service.SavePermalink(CType(args("link"),String), CType(args("html"),String))
            Return Nothing
        End Function
    End Class
    
    Public Class EncodePermalinkServiceRequestHandler
        Inherits ServiceRequestHandler
        
        Public Overrides Function HandleRequest(ByVal service As DataControllerService, ByVal args As JObject) As Object
            Return service.EncodePermalink(CType(args("link"),String), CType(args("rooted"),Boolean))
        End Function
    End Class
    
    Public Class ListAllPermalinksServiceRequestHandler
        Inherits ServiceRequestHandler
        
        Public Overrides Function HandleRequest(ByVal service As DataControllerService, ByVal args As JObject) As Object
            Return service.ListAllPermalinks()
        End Function
    End Class
    
    Public Class GetSurveyServiceRequestHandler
        Inherits ServiceRequestHandler
        
        Public Overrides Function HandleRequest(ByVal service As DataControllerService, ByVal args As JObject) As Object
            Return service.GetSurvey(CType(args("name"),String))
        End Function
    End Class
    
    Public Class DnnOAuthServiceRequestHandler
        Inherits ServiceRequestHandler
        
        Public Overrides ReadOnly Property AllowedMethods() As String()
            Get
                Return New String() {"GET", "POST"}
            End Get
        End Property
        
        Public Overrides Function HandleRequest(ByVal service As DataControllerService, ByVal args As JObject) As Object
            Dim handler As DnnOAuthHandler = New DnnOAuthHandler()
            handler.ProcessRequest(HttpContext.Current)
            Return Nothing
        End Function
        
        Public Overrides Function HandleException(ByVal args As JObject, ByVal ex As Exception) As Object
            If TypeOf ex Is ThreadAbortException Then
                Throw ex
            End If
            Return MyBase.HandleException(args, ex)
        End Function
    End Class
    
    Public Class ServiceRequestError
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_ExceptionType As String
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_Message As String
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_StackTrace As String
        
        Public Property ExceptionType() As String
            Get
                Return Me.m_ExceptionType
            End Get
            Set
                Me.m_ExceptionType = value
            End Set
        End Property
        
        Public Property Message() As String
            Get
                Return Me.m_Message
            End Get
            Set
                Me.m_Message = value
            End Set
        End Property
        
        Public Property StackTrace() As String
            Get
                Return Me.m_StackTrace
            End Get
            Set
                Me.m_StackTrace = value
            End Set
        End Property
    End Class
    
    Public Class ServiceRequestRedirectException
        Inherits Exception
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_RedirectUrl As String
        
        Public Sub New(ByVal redirectUrl As String)
            MyBase.New
            Me.RedirectUrl = redirectUrl
        End Sub
        
        Public Overridable Property RedirectUrl() As String
            Get
                Return Me.m_RedirectUrl
            End Get
            Set
                Me.m_RedirectUrl = value
            End Set
        End Property
    End Class
    
    Partial Public Class RequestValidationService
        Inherits RequestValidationServiceBase
    End Class
    
    Public Class RequestValidationServiceBase
        
        Public Shared ValidRequestRegex As Regex = New Regex("<[^\w<>]*(?:[^<>""'\s]*:)?[^\w<>]*(?:\W*s\W*c\W*r\W*i\W*p\W*t|\W*f\W*o\W*r\W*m|\W*"& _ 
                "s\W*t\W*y\W*l\W*e|\W*s\W*v\W*g|\W*m\W*a\W*r\W*q\W*u\W*e\W*e|(?:\W*l\W*i\W*n\W*k|"& _ 
                "\W*o\W*b\W*j\W*e\W*c\W*t|\W*e\W*m\W*b\W*e\W*d|\W*a\W*p\W*p\W*l\W*e\W*t|\W*p\W*a\"& _ 
                "W*r\W*a\W*m|\W*i?\W*f\W*r\W*a\W*m\W*e|\W*b\W*a\W*s\W*e|\W*b\W*o\W*d\W*y|\W*m\W*e"& _ 
                "\W*t\W*a|\W*i\W*m\W*a?\W*g\W*e?|\W*v\W*i\W*d\W*e\W*o|\W*a\W*u\W*d\W*i\W*o|\W*b\W"& _ 
                "*i\W*n\W*d\W*i\W*n\W*g\W*s|\W*s\W*e\W*t|\W*i\W*s\W*i\W*n\W*d\W*e\W*x|\W*a\W*n\W*"& _ 
                "i\W*m\W*a\W*t\W*e)[^>\w])|(?:<\w[\s\S]*[\s\0\/]|['""])(?:formaction|style|backgro"& _ 
                "und|src|lowsrc|ping|on(?:d(?:e(?:vice(?:(?:orienta|mo)tion|proximity|found|light"& _ 
                ")|livery(?:success|error)|activate)|r(?:ag(?:e(?:n(?:ter|d)|xit)|(?:gestur|leav)"& _ 
                "e|start|drop|over)?|op)|i(?:s(?:c(?:hargingtimechange|onnect(?:ing|ed))|abled)|a"& _ 
                "ling)|ata(?:setc(?:omplete|hanged)|(?:availabl|chang)e|error)|urationchange|ownl"& _ 
                "oading|blclick)|Moz(?:M(?:agnifyGesture(?:Update|Start)?|ouse(?:PixelScroll|Hitt"& _ 
                "est))|S(?:wipeGesture(?:Update|Start|End)?|crolledAreaChanged)|(?:(?:Press)?TapG"& _ 
                "estur|BeforeResiz)e|EdgeUI(?:C(?:omplet|ancel)|Start)ed|RotateGesture(?:Update|S"& _ 
                "tart)?|A(?:udioAvailable|fterPaint))|c(?:o(?:m(?:p(?:osition(?:update|start|end)"& _ 
                "|lete)|mand(?:update)?)|n(?:t(?:rolselect|extmenu)|nect(?:ing|ed))|py)|a(?:(?:ll"& _ 
                "schang|ch)ed|nplay(?:through)?|rdstatechange)|h(?:(?:arging(?:time)?ch)?ange|eck"& _ 
                "ing)|(?:fstate|ell)change|u(?:echange|t)|l(?:ick|ose))|m(?:o(?:z(?:pointerlock(?"& _ 
                ":change|error)|(?:orientation|time)change|fullscreen(?:change|error)|network(?:d"& _ 
                "own|up)load)|use(?:(?:lea|mo)ve|o(?:ver|ut)|enter|wheel|down|up)|ve(?:start|end)"& _ 
                "?)|essage|ark)|s(?:t(?:a(?:t(?:uschanged|echange)|lled|rt)|k(?:sessione|comma)nd"& _ 
                "|op)|e(?:ek(?:complete|ing|ed)|(?:lec(?:tstar)?)?t|n(?:ding|t))|u(?:ccess|spend|"& _ 
                "bmit)|peech(?:start|end)|ound(?:start|end)|croll|how)|b(?:e(?:for(?:e(?:(?:scrip"& _ 
                "texecu|activa)te|u(?:nload|pdate)|p(?:aste|rint)|c(?:opy|ut)|editfocus)|deactiva"& _ 
                "te)|gin(?:Event)?)|oun(?:dary|ce)|l(?:ocked|ur)|roadcast|usy)|a(?:n(?:imation(?:"& _ 
                "iteration|start|end)|tennastatechange)|fter(?:(?:scriptexecu|upda)te|print)|udio"& _ 
                "(?:process|start|end)|d(?:apteradded|dtrack)|ctivate|lerting|bort)|DOM(?:Node(?:"& _ 
                "Inserted(?:IntoDocument)?|Removed(?:FromDocument)?)|(?:CharacterData|Subtree)Mod"& _ 
                "ified|A(?:ttrModified|ctivate)|Focus(?:Out|In)|MouseScroll)|r(?:e(?:s(?:u(?:m(?:"& _ 
                "ing|e)|lt)|ize|et)|adystatechange|pea(?:tEven)?t|movetrack|trieving|ceived)|ow(?"& _ 
                ":s(?:inserted|delete)|e(?:nter|xit))|atechange)|p(?:op(?:up(?:hid(?:den|ing)|sho"& _ 
                "w(?:ing|n))|state)|a(?:ge(?:hide|show)|(?:st|us)e|int)|ro(?:pertychange|gress)|l"& _ 
                "ay(?:ing)?)|t(?:ouch(?:(?:lea|mo)ve|en(?:ter|d)|cancel|start)|ime(?:update|out)|"& _ 
                "ransitionend|ext)|u(?:s(?:erproximity|sdreceived)|p(?:gradeneeded|dateready)|n(?"& _ 
                ":derflow|load))|f(?:o(?:rm(?:change|input)|cus(?:out|in)?)|i(?:lterchange|nish)|"& _ 
                "ailed)|l(?:o(?:ad(?:e(?:d(?:meta)?data|nd)|start)?|secapture)|evelchange|y)|g(?:"& _ 
                "amepad(?:(?:dis)?connected|button(?:down|up)|axismove)|et)|e(?:n(?:d(?:Event|ed)"& _ 
                "?|abled|ter)|rror(?:update)?|mptied|xit)|i(?:cc(?:cardlockerror|infochange)|n(?:"& _ 
                "coming|valid|put))|o(?:(?:(?:ff|n)lin|bsolet)e|verflow(?:changed)?|pen)|SVG(?:(?"& _ 
                ":Unl|L)oad|Resize|Scroll|Abort|Error|Zoom)|h(?:e(?:adphoneschange|l[dp])|ashchan"& _ 
                "ge|olding)|v(?:o(?:lum|ic)e|ersion)change|w(?:a(?:it|rn)ing|heel)|key(?:press|do"& _ 
                "wn|up)|(?:AppComman|Loa)d|no(?:update|match)|Request|zoom))[\s\0]*=")
        
        Public Shared Function ToJson(ByVal context As HttpContext) As JObject
            Dim service As RequestValidationService = New RequestValidationService()
            Dim data((context.Request.InputStream.Length) - 1) As Byte
            context.Request.InputStream.Read(data, 0, data.Length)
            Dim args As String = service.ValidateJson(Encoding.UTF8.GetString(data), context)
            Dim json As JObject = Nothing
            If Not (String.IsNullOrEmpty(args)) Then
                json = service.ValidateJson(JObject.Parse(args), context)
            End If
            Return json
        End Function
        
        Public Overloads Overridable Function ValidateJson(ByVal json As String, ByVal context As HttpContext) As String
            If ValidRequestRegex.IsMatch(json) Then
                Throw New HttpException(400, "Bad Request")
            End If
            Return HttpUtility.HtmlDecode(json)
        End Function
        
        Public Overloads Overridable Function ValidateJson(ByVal json As JObject, ByVal context As HttpContext) As JObject
            Dim isBad As Boolean = false
            If (Not (json("IgnoreBusinessRules")) Is Nothing) Then
                isBad = true
            End If
            If (Not (json("requests")) Is Nothing) Then
                Dim list As JArray = CType(json("requests"),JArray)
                For Each args As JObject in list.Values(Of JObject)()
                    If (Not (args("IgnoreBusinessRules")) Is Nothing) Then
                        isBad = true
                        Exit For
                    End If
                Next
            End If
            If isBad Then
                Throw New HttpException(400, "Bad Request")
            End If
            Return json
        End Function
    End Class
    
    Public Class WorkflowResources
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_StaticResources As SortedDictionary(Of String, String)
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_DynamicResources As List(Of Regex)
        
        Public Sub New()
            MyBase.New
            m_StaticResources = New SortedDictionary(Of String, String)()
            m_DynamicResources = New List(Of Regex)()
        End Sub
        
        Public Property StaticResources() As SortedDictionary(Of String, String)
            Get
                Return Me.m_StaticResources
            End Get
            Set
                Me.m_StaticResources = value
            End Set
        End Property
        
        Public Property DynamicResources() As List(Of Regex)
            Get
                Return Me.m_DynamicResources
            End Get
            Set
                Me.m_DynamicResources = value
            End Set
        End Property
    End Class
    
    Partial Public Class WorkflowRegister
        Inherits WorkflowRegisterBase
    End Class
    
    Public Class WorkflowRegisterBase
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_Resources As SortedDictionary(Of String, WorkflowResources)
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_RoleRegister As SortedDictionary(Of String, List(Of String))
        
        Public Sub New()
            MyBase.New
            'initialize system workflows
            m_Resources = New SortedDictionary(Of String, WorkflowResources)()
            RegisterBuiltinWorkflowResources()
            For Each w As SiteContentFile in ApplicationServices.Current.ReadSiteContent("sys/workflows%", "%")
                Dim text As String = w.Text
                If Not (String.IsNullOrEmpty(text)) Then
                    Dim wr As WorkflowResources = Nothing
                    If Not (Resources.TryGetValue(w.PhysicalName, wr)) Then
                        wr = New WorkflowResources()
                        Resources(w.PhysicalName) = wr
                    End If
                    For Each s As String in text.Split(New Char() {Global.Microsoft.VisualBasic.ChrW(10)}, StringSplitOptions.RemoveEmptyEntries)
                        Dim query As String = s.Trim()
                        If Not (String.IsNullOrEmpty(query)) Then
                            If s.StartsWith("regex ") Then
                                Dim regexQuery As String = s.Substring(6).Trim()
                                If Not (String.IsNullOrEmpty(regexQuery)) Then
                                    Try 
                                        wr.DynamicResources.Add(New Regex(regexQuery, RegexOptions.IgnoreCase))
                                    Catch __exception As Exception
                                    End Try
                                End If
                            Else
                                wr.StaticResources(query.ToLower()) = query
                            End If
                        End If
                    Next
                End If
            Next
            'read "role" workflows from the register
            m_RoleRegister = New SortedDictionary(Of String, List(Of String))()
            For Each rr As SiteContentFile in ApplicationServices.Current.ReadSiteContent("sys/register/roles%", "%")
                Dim text As String = rr.Text
                If Not (String.IsNullOrEmpty(text)) Then
                    Dim workflows As List(Of String) = Nothing
                    If Not (RoleRegister.TryGetValue(rr.PhysicalName, workflows)) Then
                        workflows = New List(Of String)()
                        RoleRegister(rr.PhysicalName) = workflows
                    End If
                    For Each s As String in text.Split(New Char() {Global.Microsoft.VisualBasic.ChrW(10), Global.Microsoft.VisualBasic.ChrW(44)}, StringSplitOptions.RemoveEmptyEntries)
                        Dim name As String = s.Trim()
                        If Not (String.IsNullOrEmpty(name)) Then
                            workflows.Add(name)
                        End If
                    Next
                End If
            Next
        End Sub
        
        Public Property Resources() As SortedDictionary(Of String, WorkflowResources)
            Get
                Return Me.m_Resources
            End Get
            Set
                Me.m_Resources = value
            End Set
        End Property
        
        Public Property RoleRegister() As SortedDictionary(Of String, List(Of String))
            Get
                Return Me.m_RoleRegister
            End Get
            Set
                Me.m_RoleRegister = value
            End Set
        End Property
        
        Public ReadOnly Property UserWorkflows() As List(Of String)
            Get
                Dim workflows As List(Of String) = CType(HttpContext.Current.Items("WorkflowRegister_UserWorkflows"),List(Of String))
                If (workflows Is Nothing) Then
                    workflows = New List(Of String)()
                    Dim identity As IIdentity = HttpContext.Current.User.Identity
                    If identity.IsAuthenticated Then
                        For Each urf As SiteContentFile in ApplicationServices.Current.ReadSiteContent("sys/register/users%", identity.Name)
                            Dim text As String = urf.Text
                            If Not (String.IsNullOrEmpty(text)) Then
                                For Each s As String in text.Split(New Char() {Global.Microsoft.VisualBasic.ChrW(10), Global.Microsoft.VisualBasic.ChrW(44)}, StringSplitOptions.RemoveEmptyEntries)
                                    Dim name As String = s.Trim()
                                    If (Not (String.IsNullOrEmpty(name)) AndAlso Not (workflows.Contains(name))) Then
                                        workflows.Add(name)
                                    End If
                                Next
                            End If
                        Next
                    End If
                    'enumerate role workflows
                    Dim isAuthenticated As Boolean = HttpContext.Current.User.Identity.IsAuthenticated
                    For Each role As String in RoleRegister.Keys
                        If ((((role = "?") AndAlso Not (isAuthenticated)) OrElse ((role = "*") AndAlso isAuthenticated)) OrElse DataControllerBase.UserIsInRole(role)) Then
                            For Each name As String in RoleRegister(role)
                                If Not (workflows.Contains(name)) Then
                                    workflows.Add(name)
                                End If
                            Next
                        End If
                    Next
                    HttpContext.Current.Items("WorkflowRegister_UserWorkflows") = workflows
                End If
                Return workflows
            End Get
        End Property
        
        Public ReadOnly Property Enabled() As Boolean
            Get
                Return (m_Resources.Count > 0)
            End Get
        End Property
        
        Public Shared ReadOnly Property IsEnabled() As Boolean
            Get
                If Not (ApplicationServices.IsSiteContentEnabled) Then
                    Return false
                End If
                Dim wr As WorkflowRegister = WorkflowRegister.GetCurrent()
                Return ((Not (wr) Is Nothing) AndAlso wr.Enabled)
            End Get
        End Property
        
        Public Overridable ReadOnly Property CacheDuration() As Integer
            Get
                Return 30
            End Get
        End Property
        
        Protected Overridable Sub RegisterBuiltinWorkflowResources()
        End Sub
        
        Public Shared Function Allows(ByVal fileName As String) As Boolean
            If Not (ApplicationServices.IsSiteContentEnabled) Then
                Return false
            End If
            Dim wr As WorkflowRegister = WorkflowRegister.GetCurrent(fileName)
            If ((wr Is Nothing) OrElse Not (wr.Enabled)) Then
                Return false
            End If
            Return wr.IsMatch(fileName)
        End Function
        
        Public Overloads Function IsMatch(ByVal physicalPath As String, ByVal physicalName As String) As Boolean
            Dim fileName As String = physicalPath
            If String.IsNullOrEmpty(fileName) Then
                fileName = physicalName
            Else
                fileName = ((fileName + "/")  _
                            + physicalName)
            End If
            Return IsMatch(fileName)
        End Function
        
        Public Overloads Function IsMatch(ByVal fileName As String) As Boolean
            fileName = fileName.ToLower()
            Dim activeWorkflows As List(Of String) = UserWorkflows
            For Each workflow As String in activeWorkflows
                Dim resourceList As WorkflowResources = Nothing
                If Resources.TryGetValue(workflow, resourceList) Then
                    If resourceList.StaticResources.ContainsKey(fileName) Then
                        Return true
                    End If
                    For Each re As Regex in resourceList.DynamicResources
                        If re.IsMatch(fileName) Then
                            Return true
                        End If
                    Next
                End If
            Next
            Return false
        End Function
        
        Public Overloads Shared Function GetCurrent() As WorkflowRegister
            Return GetCurrent(Nothing)
        End Function
        
        Public Overloads Shared Function GetCurrent(ByVal relativePath As String) As WorkflowRegister
            If ((Not (relativePath) Is Nothing) AndAlso (relativePath.StartsWith("sys/workflows") OrElse relativePath.StartsWith("sys/register"))) Then
                Return Nothing
            End If
            Dim key As String = "WorkflowRegister_Current"
            Dim context As HttpContext = HttpContext.Current
            Dim instance As WorkflowRegister = CType(context.Items(key),WorkflowRegister)
            If (instance Is Nothing) Then
                instance = CType(context.Cache(key),WorkflowRegister)
                If (instance Is Nothing) Then
                    instance = New WorkflowRegister()
                    context.Cache.Add(key, instance, Nothing, DateTime.Now.AddSeconds(instance.CacheDuration), Cache.NoSlidingExpiration, CacheItemPriority.AboveNormal, Nothing)
                End If
                context.Items(key) = instance
            End If
            Return instance
        End Function
    End Class
    
    Public Enum SiteContentFields
        
        SiteContentId
        
        DataFileName
        
        DataContentType
        
        Length
        
        Path
        
        Data
        
        Roles
        
        Users
        
        Text
        
        CacheProfile
        
        RoleExceptions
        
        UserExceptions
        
        Schedule
        
        ScheduleExceptions
    End Enum
    
    Public Class SiteContentFile
        
        Private m_Id As Object
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_Name As String
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_Path As String
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_ContentType As String
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_Length As Integer
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_Data() As Byte
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_PhysicalName As String
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_Error As String
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_Schedule As String
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_ScheduleExceptions As String
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_CacheProfile As String
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_CacheDuration As Integer
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_CacheLocation As HttpCacheability
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_CacheVaryByParams() As String
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_CacheVaryByHeaders() As String
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_CacheNoStore As Boolean
        
        Public Sub New()
            MyBase.New
            Me.CacheLocation = HttpCacheability.NoCache
        End Sub
        
        Public Property Id() As Object
            Get
                Return m_Id
            End Get
            Set
                If ((Not (value) Is Nothing) AndAlso TypeOf value Is Byte) Then
                    value = New Guid(CType(value,Byte()))
                End If
                m_Id = value
            End Set
        End Property
        
        Public Property Name() As String
            Get
                Return Me.m_Name
            End Get
            Set
                Me.m_Name = value
            End Set
        End Property
        
        Public Property Path() As String
            Get
                Return Me.m_Path
            End Get
            Set
                Me.m_Path = value
            End Set
        End Property
        
        Public Property ContentType() As String
            Get
                Return Me.m_ContentType
            End Get
            Set
                Me.m_ContentType = value
            End Set
        End Property
        
        Public Property Length() As Integer
            Get
                Return Me.m_Length
            End Get
            Set
                Me.m_Length = value
            End Set
        End Property
        
        Public Property Data() As Byte()
            Get
                Return Me.m_Data
            End Get
            Set
                Me.m_Data = value
            End Set
        End Property
        
        Public Property PhysicalName() As String
            Get
                Return Me.m_PhysicalName
            End Get
            Set
                Me.m_PhysicalName = value
            End Set
        End Property
        
        Public Property [Error]() As String
            Get
                Return Me.m_Error
            End Get
            Set
                Me.m_Error = value
            End Set
        End Property
        
        Public Property Schedule() As String
            Get
                Return Me.m_Schedule
            End Get
            Set
                Me.m_Schedule = value
            End Set
        End Property
        
        Public Property ScheduleExceptions() As String
            Get
                Return Me.m_ScheduleExceptions
            End Get
            Set
                Me.m_ScheduleExceptions = value
            End Set
        End Property
        
        Public Property CacheProfile() As String
            Get
                Return Me.m_CacheProfile
            End Get
            Set
                Me.m_CacheProfile = value
            End Set
        End Property
        
        Public Property CacheDuration() As Integer
            Get
                Return Me.m_CacheDuration
            End Get
            Set
                Me.m_CacheDuration = value
            End Set
        End Property
        
        Public Property CacheLocation() As HttpCacheability
            Get
                Return Me.m_CacheLocation
            End Get
            Set
                Me.m_CacheLocation = value
            End Set
        End Property
        
        Public Property CacheVaryByParams() As String()
            Get
                Return Me.m_CacheVaryByParams
            End Get
            Set
                Me.m_CacheVaryByParams = value
            End Set
        End Property
        
        Public Property CacheVaryByHeaders() As String()
            Get
                Return Me.m_CacheVaryByHeaders
            End Get
            Set
                Me.m_CacheVaryByHeaders = value
            End Set
        End Property
        
        Public Property CacheNoStore() As Boolean
            Get
                Return Me.m_CacheNoStore
            End Get
            Set
                Me.m_CacheNoStore = value
            End Set
        End Property
        
        Public Property Text() As String
            Get
                If ((Not (Me.Data) Is Nothing) AndAlso (Not (String.IsNullOrEmpty(Me.ContentType)) AndAlso Me.ContentType.StartsWith("text/"))) Then
                    Return Encoding.UTF8.GetString(Me.Data)
                End If
                Return Nothing
            End Get
            Set
                If (value Is Nothing) Then
                    m_Data = Nothing
                Else
                    m_Data = Encoding.UTF8.GetBytes(value)
                    m_ContentType = "text/plain"
                End If
            End Set
        End Property
        
        Public ReadOnly Property IsText() As Boolean
            Get
                Return ((Not (m_ContentType) Is Nothing) AndAlso Regex.IsMatch(m_ContentType, "^((text/\w+)|(application/(javascript|json)))$"))
            End Get
        End Property
        
        Public Shared Function ReadAllBytes(ByVal relativePath As String) As Byte()
            Return ApplicationServices.Current.ReadSiteContentBytes(relativePath)
        End Function
        
        Public Overloads Shared Function WriteAllBytes(ByVal relativePath As String, ByVal data() As Byte) As Integer
            Return WriteAllBytes(relativePath, MimeMapping.GetMimeMapping(System.IO.Path.GetFileName(relativePath)), data)
        End Function
        
        Public Overloads Shared Function WriteAllBytes(ByVal relativePath As String, ByVal contentType As String, ByVal data() As Byte) As Integer
            Dim services As ApplicationServices = ApplicationServices.Current
            Dim values As List(Of FieldValue) = ToValues(relativePath, contentType, true)
            values.Add(New FieldValue(services.SiteContentFieldName(SiteContentFields.Data), data))
            values.Add(New FieldValue(services.SiteContentFieldName(SiteContentFields.Length), Nothing))
            If (Not (data) Is Nothing) Then
                values.Last().NewValue = data.Length
                values.Last().Modified = true
            End If
            Return Write(values).RowsAffected
        End Function
        
        Public Shared Function ReadAllText(ByVal relativePath As String) As String
            Return ApplicationServices.Current.ReadSiteContentString(relativePath)
        End Function
        
        Public Shared Function ReadJson(ByVal relativePath As String) As JObject
            Dim result As String = ReadAllText(relativePath)
            If (Not (String.IsNullOrEmpty(result)) AndAlso (result(0) = Global.Microsoft.VisualBasic.ChrW(123))) Then
                Return JObject.Parse(result)
            End If
            Return New JObject()
        End Function
        
        Public Overloads Shared Function WriteAllText(ByVal relativePath As String, ByVal text As String) As Integer
            Return WriteAllText(relativePath, "text/plain", text)
        End Function
        
        Public Overloads Shared Function WriteAllText(ByVal relativePath As String, ByVal contentType As String, ByVal text As String) As Integer
            Dim values As List(Of FieldValue) = ToValues(relativePath, contentType, true)
            values.Add(New FieldValue(ApplicationServices.Current.SiteContentFieldName(SiteContentFields.Text), text))
            Return Write(values).RowsAffected
        End Function
        
        Public Shared Function WriteJson(ByVal relativePath As String, ByVal json As JObject) As Integer
            Return WriteAllText(relativePath, "application/json", json.ToString())
        End Function
        
        Public Shared Function Write(ByVal values As List(Of FieldValue)) As ActionResult
            Dim args As ActionArgs = New ActionArgs()
            args.Controller = ApplicationServices.Current.GetSiteContentControllerName()
            args.View = "createForm1"
            args.Values = values.ToArray()
            args.LastCommandName = "New"
            args.CommandName = "Insert"
            args.IgnoreBusinessRules = true
            If (Not (values(0).OldValue) Is Nothing) Then
                args.View = "editForm1"
                args.LastCommandName = Nothing
                args.CommandName = "Update"
            End If
            Dim c As IDataController = ControllerFactory.CreateDataController()
            CType(c,Controller).AllowPublicAccess = true
            Dim result As ActionResult = c.Execute(args.Controller, args.View, args)
            result.RaiseExceptionIfErrors()
            Return result
        End Function
        
        Public Shared Function Delete(ByVal relativePath As String) As Integer
            Dim services As ApplicationServices = ApplicationServices.Current
            Dim values As List(Of FieldValue) = ToValues(relativePath, Nothing, false)
            Dim keys As List(Of String) = New List(Of String)()
            For Each file As SiteContentFile in services.ReadSiteContent(CType(values(2).Value,String), CType(values(1).Value,String))
                keys.Add(file.Id.ToString())
            Next
            If (keys.Count > 0) Then
                Dim args As ActionArgs = New ActionArgs()
                args.Controller = services.GetSiteContentControllerName()
                args.View = "grid1"
                args.Values = New FieldValue() {New FieldValue(values(0).Name, keys(0), keys(0))}
                args.SelectedValues = keys.ToArray()
                args.CommandName = "Delete"
                args.IgnoreBusinessRules = true
                Dim c As IDataController = ControllerFactory.CreateDataController()
                CType(c,Controller).AllowPublicAccess = true
                Dim result As ActionResult = c.Execute(args.Controller, args.View, args)
                result.RaiseExceptionIfErrors()
                Return result.RowsAffected
            End If
            Return 0
        End Function
        
        Public Shared Function Exists(ByVal relativePath As String) As Boolean
            Return (ApplicationServices.Current.ReadSiteContent(relativePath).Length > 0)
        End Function
        
        Private Shared Function ToValues(ByVal relativePath As String, ByVal contentType As String, ByVal checkForExisting As Boolean) As List(Of FieldValue)
            Dim services As ApplicationServices = ApplicationServices.Current
            Dim name As String = relativePath
            Dim path As String = Nothing
            Dim index As Integer = relativePath.LastIndexOf("/")
            If (index >= 0) Then
                name = relativePath.Substring((index + 1))
                path = relativePath.Substring(0, index)
            End If
            Dim list As List(Of FieldValue) = New List(Of FieldValue)()
            list.Add(New FieldValue(services.SiteContentFieldName(SiteContentFields.SiteContentId)))
            list.Add(New FieldValue(services.SiteContentFieldName(SiteContentFields.DataFileName), name))
            list.Add(New FieldValue(services.SiteContentFieldName(SiteContentFields.Path), path))
            list.Add(New FieldValue(services.SiteContentFieldName(SiteContentFields.DataContentType)))
            If checkForExisting Then
                Dim file As SiteContentFile = services.ReadSiteContent(relativePath)
                If (Not (file) Is Nothing) Then
                    list(0).OldValue = file.Id
                    list(0).Modified = false
                    list(1).OldValue = file.Name
                    list(2).OldValue = file.Path
                    list(3).OldValue = file.ContentType
                End If
            End If
            If Not (String.IsNullOrEmpty(contentType)) Then
                list(3).NewValue = contentType
                list(3).Modified = true
            End If
            Return list
        End Function
        
        Public Overrides Function ToString() As String
            Return String.Format("{0}/{1}", Path, Name)
        End Function
    End Class
    
    Public Class SiteContentFileList
        Inherits List(Of SiteContentFile)
    End Class
    
    Partial Public Class ApplicationServices
        Inherits EnterpriseApplicationServices
        
        Public Shared ReadOnly Property HomePageUrl() As [String]
            Get
                Return Create().UserHomePageUrl()
            End Get
        End Property
        
        Public Shared Sub Initialize()
            Create().RegisterServices()
        End Sub
        
        Public Shared Function Login(ByVal username As String, ByVal password As String, ByVal createPersistentCookie As Boolean) As Object
            Return Create().AuthenticateUser(username, password, createPersistentCookie)
        End Function
        
        Public Shared Sub Logout()
            Create().UserLogout()
        End Sub
        
        Public Shared Function Roles() As String()
            Return Create().UserRoles()
        End Function
        
        Public Shared Function Themes() As JObject
            Return Create().UserThemes()
        End Function
    End Class
    
    Public Class ApplicationServicesBase
        
        Public Shared EnableMobileClient As Boolean = true
        
        Public Shared DesignerPort As String = String.Empty
        
        Private m_DefaultSettings As JObject
        
        Private Shared m_EnableCombinedCss As Boolean
        
        Private Shared m_EnableMinifiedCss As Boolean = true
        
        Public Shared NameValueListRegex As Regex = New Regex("^\s*(?'Name'\w+)\s*=\s*(?'Value'[\S\s]+?)\s*$", RegexOptions.Multiline)
        
        Public Shared SystemResourceRegex As Regex = New Regex("~/((sys/)|(views/)|(site\b))", RegexOptions.IgnoreCase)
        
        Private Shared m_MapsApiIdentifier As String
        
        Private m_UserTheme As String
        
        Private m_UserAccent As String
        
        Public Shared CssUrlRegex As Regex = New Regex("(?'Header'\burl\s*\(\s*(\""|\')?)(?'Name'[\w/\.]+)(?'Symbol'\S)")
        
        Private m_AccentJSON As JObject
        
        Public Shared ThemeStylesheetRegex As Regex = New Regex("^touch-theme\.(?'Theme'\w+)\.((?'Accent'\w+)\.)?css$")
        
        Private Shared m_ThemeVariables As SortedDictionary(Of String, String) = Nothing
        
        Public Shared ThemeVariableRegex As Regex = New Regex("(?'Item'(?'Before'\w+:\s*)\/\*\s*(?'Name'(@[\w\.]+(,\s*)?)+)\s*\*\/(?'Value'.+?))"& _ 
                "(?'After'(!important)?;\s*)$", RegexOptions.Multiline)
        
        Public Shared DefaultExcludeScriptRegex As Regex = New Regex("^(daf\\|sys\\|lib\\|surveys\\|_references\.js)|((.+?)\.(\w\w(\-\w+)*)\.js$)")
        
        Public Shared RequestHandlers As SortedDictionary(Of String, ServiceRequestHandler) = New SortedDictionary(Of String, ServiceRequestHandler)()
        
        Public Shared ViewPageCompressRegex As Regex = New Regex("((""(DefaultValue)""\:(""[\s\S]*?""))|(""(Items|Pivots|Fields|Views|ActionGroups|Categ"& _ 
                "ories|Filter|Expressions)""\:(\[\]))|(""(Len|CategoryIndex|Rows|Columns|Search|Ite"& _ 
                "msPageSize|Aggregate|OnDemandStyle|TextMode|MaskType|AutoCompletePrefixLength|Da"& _ 
                "taViewPageSize|PageOffset)""\:(0))|(""(CausesValidation|AllowQBE|AllowSorting|Form"& _ 
                "atOnClient|HtmlEncode|RequiresMetaData|RequiresRowCount|ShowInSelector|DataViewS"& _ 
                "how(ActionBar|Description|ViewSelector|PageSize|SearchBar|QuickFind))""\:(true))|"& _ 
                "(""(IsPrimaryKey|ReadOnly|HasDefaultValue|Hidden|AllowLEV|AllowNulls|OnDemand|IsM"& _ 
                "irror|Calculated|CausesCalculate|IsVirtual|AutoSelect|SearchOnStart|ShowInSummar"& _ 
                "y|ItemsLetters|WhenKeySelected|RequiresSiteContentText|RequiresPivot|RequiresAgg"& _ 
                "regates|InTransaction|Wrap|Floating|Collapsed|Label|SupportsCaching|AllowDistinc"& _ 
                "tFieldInFilter|Flat|RequiresMetaData|RequiresRowCount|(DataView(ShowInSummary|Mu"& _ 
                "ltiSelect|ShowModalForms|SearchByFirstLetter|SearchOnStart|ShowRowNumber|AutoHig"& _ 
                "hlightFirstRow|AutoSelectFirstRow)))""\:(false))|(""(AliasName|Tag|FooterText|Tool"& _ 
                "Tip|Watermark|DataFormatString|Copy|HyperlinkFormatString|SourceFields|SearchOpt"& _ 
                "ions|ItemsDataController|ItemsTargetController|ItemsDataView|ItemsDataValueField"& _ 
                "|ItemsDataTextField|ItemsStyle|ItemsNewDataView|OnDemandHandler|Mask|ContextFiel"& _ 
                "ds|Formula|Flow|Label|Configuration|Editor|ItemsDescription|Group|CommandName|Co"& _ 
                "mmandArgument|HeaderText|Description|CssClass|Confirmation|Notify|Key|WhenLastCo"& _ 
                "mmandName|WhenLastCommandArgument|WhenClientScript|WhenTag|WhenHRef|WhenView|Piv"& _ 
                "otDefinitions|Aggregates|PivotDefinitions|Aggregates|ViewType|LastView|StatusBar"& _ 
                "|Icons|LEVs|QuickFindHint|InnerJoinPrimaryKey|SystemFilter|DistinctValueFieldNam"& _ 
                "e|ClientScript|FirstLetters|SortExpression|Template|Tab|Wizard|InnerJoinForeignK"& _ 
                "ey|Expressions|ViewHeaderText|ViewLayout|GroupExpression|(DataView(FilterSource|"& _ 
                "Controller|Id|FilterFields|ShowActionButtons|ShowPager)))""\:(""""|null))|(""Type"":"""& _ 
                "String"")),?")
        
        Public Shared ViewPageCompress2Regex As Regex = New Regex(",\}(,|])")
        
        Public Overridable ReadOnly Property DefaultSettings() As JObject
            Get
                If (m_DefaultSettings Is Nothing) Then
                    Dim json As String = "{}"
                    Dim filePath As String = HttpContext.Current.Server.MapPath("~/touch-settings.json")
                    If File.Exists(filePath) Then
                        json = File.ReadAllText(filePath)
                    End If
                    m_DefaultSettings = JObject.Parse(json)
                    EnsureJsonProperty(m_DefaultSettings, "appName", "Business Navigator")
                    EnsureJsonProperty(m_DefaultSettings, "map.apiKey", MapsApiIdentifier)
                    EnsureJsonProperty(m_DefaultSettings, "charts.maxPivotRowCount", MaxPivotRowCount)
                    EnsureJsonProperty(m_DefaultSettings, "ui.theme.name", "Light")
                    Dim ui As JObject = CType(m_DefaultSettings("ui"),JObject)
                    EnsureJsonProperty(ui, "theme.accent", "Social")
                    EnsureJsonProperty(ui, "displayDensity.mobile", "Auto")
                    EnsureJsonProperty(ui, "displayDensity.desktop", "Comfortable")
                    EnsureJsonProperty(ui, "list.labels.display", "DisplayedBelow")
                    EnsureJsonProperty(ui, "list.initialMode", "SeeAll")
                    EnsureJsonProperty(ui, "menu.location", "sidebar")
                    EnsureJsonProperty(ui, "actions.promote", true)
                    EnsureJsonProperty(ui, "smartDates", true)
                    EnsureJsonProperty(ui, "transitions.style", "")
                    EnsureJsonProperty(ui, "sidebar.when", "Always")
                End If
                Return m_DefaultSettings
            End Get
        End Property
        
        Public Shared Property EnableCombinedCss() As Boolean
            Get
                Return m_EnableCombinedCss
            End Get
            Set
                m_EnableCombinedCss = value
            End Set
        End Property
        
        Public Shared Property EnableMinifiedCss() As Boolean
            Get
                Return m_EnableMinifiedCss
            End Get
            Set
                m_EnableMinifiedCss = value
            End Set
        End Property
        
        Public Shared ReadOnly Property IsSiteContentEnabled() As Boolean
            Get
                Return Not (String.IsNullOrEmpty(SiteContentControllerName))
            End Get
        End Property
        
        Public Shared ReadOnly Property SiteContentControllerName() As String
            Get
                Return Create().GetSiteContentControllerName()
            End Get
        End Property
        
        Public Shared ReadOnly Property SiteContentEditors() As String()
            Get
                Return Create().GetSiteContentEditors()
            End Get
        End Property
        
        Public Shared ReadOnly Property SiteContentDevelopers() As String()
            Get
                Return Create().GetSiteContentDevelopers()
            End Get
        End Property
        
        Public Shared ReadOnly Property IsContentEditor() As Boolean
            Get
                Dim principal As IPrincipal = HttpContext.Current.User
                For Each r As String in Create().GetSiteContentEditors()
                    If principal.IsInRole(r) Then
                        Return true
                    End If
                Next
                Return false
            End Get
        End Property
        
        Public Shared ReadOnly Property IsDeveloper() As Boolean
            Get
                Dim principal As IPrincipal = HttpContext.Current.User
                For Each r As String in Create().GetSiteContentDevelopers()
                    If principal.IsInRole(r) Then
                        Return true
                    End If
                Next
                Return false
            End Get
        End Property
        
        Public Shared ReadOnly Property IsSafeMode() As Boolean
            Get
                Dim request As HttpRequest = HttpContext.Current.Request
                Dim test As Uri = request.UrlReferrer
                If (test Is Nothing) Then
                    test = request.Url
                End If
                Return ((test Is Nothing) AndAlso (test.ToString().Contains("_safemode=true") AndAlso DataControllerBase.UserIsInRole(SiteContentDevelopers)))
            End Get
        End Property
        
        Public Overridable ReadOnly Property ScheduleCacheDuration() As Integer
            Get
                Return 20
            End Get
        End Property
        
        Public Overridable ReadOnly Property Realm() As String
            Get
                Return Name
            End Get
        End Property
        
        Public Overridable ReadOnly Property Name() As String
            Get
                Return "BN"
            End Get
        End Property
        
        Public Shared ReadOnly Property MapsApiIdentifier() As String
            Get
                If String.IsNullOrEmpty(m_MapsApiIdentifier) Then
                    m_MapsApiIdentifier = WebConfigurationManager.AppSettings("MapsApiIdentifier")
                End If
                Return m_MapsApiIdentifier
            End Get
        End Property
        
        Public Overridable ReadOnly Property MaxPivotRowCount() As Integer
            Get
                Return 250000
            End Get
        End Property
        
        Public Shared ReadOnly Property Current() As ApplicationServices
            Get
                Return Create()
            End Get
        End Property
        
        Public Shared ReadOnly Property IsTouchClient() As Boolean
            Get
                Return false
            End Get
        End Property
        
        Public Overridable ReadOnly Property UserTheme() As String
            Get
                If String.IsNullOrEmpty(m_UserTheme) Then
                    LoadTheme()
                End If
                Return m_UserTheme
            End Get
        End Property
        
        Public Overridable ReadOnly Property UserAccent() As String
            Get
                If String.IsNullOrEmpty(m_UserAccent) Then
                    LoadTheme()
                End If
                Return m_UserAccent
            End Get
        End Property
        
        Public Overridable Function GetNavigateUrl() As String
            Return Nothing
        End Function
        
        Public Shared Sub VerifyUrl()
            Dim navigateUrl As String = Create().GetNavigateUrl()
            If Not (String.IsNullOrEmpty(navigateUrl)) Then
                Dim current As HttpContext = HttpContext.Current
                If Not (VirtualPathUtility.ToAbsolute(navigateUrl).Equals(current.Request.RawUrl, StringComparison.CurrentCultureIgnoreCase)) Then
                    current.Response.Redirect(navigateUrl)
                End If
            End If
        End Sub
        
        Public Overridable Sub RegisterServices()
            CreateStandardMembershipAccounts()
            Dim routes As RouteCollection = RouteTable.Routes
            RegisterIgnoredRoutes(routes)
            RegisterContentServices(RouteTable.Routes)
            'Register service request handlers
            RequestHandlers.Add("getpage", New GetPageServiceRequestHandler())
            RequestHandlers.Add("getpagelist", New GetPageListServiceRequestHandler())
            RequestHandlers.Add("getlistofvalues", New GetListOfValuesServiceRequestHandler())
            RequestHandlers.Add("execute", New ExecuteServiceRequestHandler())
            RequestHandlers.Add("executelist", New ExecuteListServiceRequestHandler())
            RequestHandlers.Add("getcompletionlist", New GetCompletionListServiceRequestHandler())
            RequestHandlers.Add("login", New LoginServiceRequestHandler())
            RequestHandlers.Add("logout", New LogoutServiceRequestHandler())
            RequestHandlers.Add("roles", New RolesServiceRequestHandler())
            RequestHandlers.Add("themes", New ThemesServiceRequestHandler())
            RequestHandlers.Add("savepermalink", New SavePermalinkServiceRequestHandler())
            RequestHandlers.Add("encodepermalink", New EncodePermalinkServiceRequestHandler())
            RequestHandlers.Add("listallpermalinks", New ListAllPermalinksServiceRequestHandler())
            RequestHandlers.Add("getsurvey", New GetSurveyServiceRequestHandler())
            OAuthHandlerFactory.Handlers.Add("dnn", GetType(DnnOAuthHandler))
            'Find designer port
            Try 
                Dim configPath As String = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments), "IISExpress\config\applicationhost.config")
                If File.Exists(configPath) Then
                    Dim content As String = File.ReadAllText(configPath)
                    Dim m As Match = Regex.Match(content, "<site name=""CodeOnTime"".*?bindingInformation=""\*:(?'Port'\d+):localhost""", RegexOptions.Singleline)
                    If m.Success Then
                        DesignerPort = m.Groups("Port").Value
                    End If
                End If
            Finally
                'release resources here
            End Try
        End Sub
        
        Public Shared Sub Start()
            Current.InstanceStart()
        End Sub
        
        Protected Overridable Sub InstanceStart()
            MyCompany.Services.ApplicationServices.Initialize()
        End Sub
        
        Public Shared Sub [Stop]()
            Current.InstanceStop()
        End Sub
        
        Protected Overridable Sub InstanceStop()
        End Sub
        
        Public Shared Sub SessionStart()
            'The line below will prevent intermittent error “Session state has created a session id,
            'but cannot save it because the response was already flushed by the application.”
            Dim sessionId As String = HttpContext.Current.Session.SessionID
            Current.UserSessionStart()
        End Sub
        
        Protected Overridable Sub UserSessionStart()
        End Sub
        
        Public Shared Sub SessionStop()
            Current.UserSessionStop()
        End Sub
        
        Protected Overridable Sub UserSessionStop()
        End Sub
        
        Public Shared Sub [Error]()
            Dim context As HttpContext = HttpContext.Current
            If (Not (context) Is Nothing) Then
                Current.HandleError(context, context.Server.GetLastError())
            End If
        End Sub
        
        Sub HandleError(ByVal context As HttpContext, ByVal [error] As Exception)
        End Sub
        
        Public Overridable Sub RegisterContentServices(ByVal routes As RouteCollection)
            GenericRoute.Map(RouteTable.Routes, New PlaceholderHandler(), "placeholder/{FileName}")
        End Sub
        
        Public Overridable Sub RegisterIgnoredRoutes(ByVal routes As RouteCollection)
        End Sub
        
        Public Overloads Shared Function LoadContent() As SortedDictionary(Of String, String)
            Dim content As SortedDictionary(Of String, String) = New SortedDictionary(Of String, String)()
            Create().LoadContent(HttpContext.Current.Request, HttpContext.Current.Response, content)
            Dim rawContent As String = Nothing
            If content.TryGetValue("File", rawContent) Then
                'find the head
                Dim headMatch As Match = Regex.Match(rawContent, "<head>([\s\S]+?)</head>")
                If headMatch.Success Then
                    Dim head As String = headMatch.Groups(1).Value
                    head = Regex.Replace(head, "\s*<meta charset="".+""\s*/?>\s*", String.Empty)
                    content("Head") = Regex.Replace(head, "\s*<title>([\S\s]*?)</title>\s*", String.Empty)
                    'find the title
                    Dim titleMatch As Match = Regex.Match(head, "<title>(?'Title'[\S\s]+?)</title>")
                    If titleMatch.Success Then
                        Dim title As String = titleMatch.Groups("Title").Value
                        content("PageTitle") = title
                        content("PageTitleContent") = title
                    End If
                    'find "about"
                    Dim aboutMatch As Match = Regex.Match(head, "<meta\s+name\s*=\s*""description""\s+content\s*=\s*""([\s\S]+?)""\s*/>")
                    If aboutMatch.Success Then
                        content("About") = HttpUtility.HtmlDecode(aboutMatch.Groups(1).Value)
                    End If
                End If
                'find the body
                Dim bodyMatch As Match = Regex.Match(rawContent, "<body(?'Attr'[\s\S]*?)>(?'Body'[\s\S]+?)</body>")
                If bodyMatch.Success Then
                    content("PageContent") = EnrichData(bodyMatch.Groups("Body").Value)
                    content("BodyAttributes") = bodyMatch.Groups("Attr").Value
                Else
                    content("PageContent") = EnrichData(rawContent)
                End If
            End If
            Return content
        End Function
        
        Shared Function EnrichData(ByVal body As String) As String
            Return Regex.Replace(body, "(<script[^>]*data-type=""\$app\.execute""[^>]*>(?<Script>(.|\n)*?)<\/script>)", AddressOf DoEnrichData)
        End Function
        
        Shared Function DoEnrichData(ByVal m As Match) As String
            Try 
                Dim json As String = m.Groups("Script").Value.Trim().Trim(Global.Microsoft.VisualBasic.ChrW(41), Global.Microsoft.VisualBasic.ChrW(40), Global.Microsoft.VisualBasic.ChrW(59))
                Dim obj As JObject = JObject.Parse(json)
                Dim request As PageRequest = New PageRequest()
                request.Controller = CType(obj("controller"),String)
                request.View = CType(obj("view"),String)
                request.PageIndex = Convert.ToInt32(obj("pageIndex"))
                request.PageSize = Convert.ToInt32(obj("pageSize"))
                If (request.PageSize = 0) Then
                    request.PageSize = 100
                End If
                request.SortExpression = CType(obj("sortExpression"),String)
                Dim metadataFilter As JArray = CType(obj("metadataFilter"),JArray)
                If (Not (metadataFilter) Is Nothing) Then
                    request.MetadataFilter = metadataFilter.ToObject(Of String())()
                Else
                    request.MetadataFilter = New String() {"fields"}
                End If
                request.RequiresMetaData = true
                Dim page As ViewPage = ControllerFactory.CreateDataController().GetPage(request.Controller, request.View, request)
                Dim output As String = ApplicationServices.CompressViewPageJsonOutput(JsonConvert.SerializeObject(page))
                Dim doFormat As Object = obj("format")
                If (doFormat Is Nothing) Then
                    doFormat = "true"
                End If
                Dim id As Object = obj("id")
                If (id Is Nothing) Then
                    id = request.Controller
                End If
                Return String.Format("<script>$app.data({{""id"":""{0}"",""format"":{1},""d"":{2}}});</script>", id, Convert.ToBoolean(doFormat).ToString().ToLower(), output)
            Catch ex As Exception
                Return (("<div class=""well text-danger"">" + ex.Message)  _
                            + "</div>")
            End Try
        End Function
        
        Public Overridable Function GetSiteContentControllerName() As String
            Return Nothing
        End Function
        
        Public Overridable Function GetSiteContentViewId() As String
            Return "editForm1"
        End Function
        
        Public Overridable Function GetSiteContentEditors() As String()
            Return New String() {"Administrators", "Content Editors", "Developers"}
        End Function
        
        Public Overridable Function GetSiteContentDevelopers() As String()
            Return New String() {"Administrators", "Developers"}
        End Function
        
        Public Overridable Sub AfterAction(ByVal args As ActionArgs, ByVal result As ActionResult)
        End Sub
        
        Public Overridable Sub BeforeAction(ByVal args As ActionArgs, ByVal result As ActionResult)
            If ((args.Controller = SiteContentControllerName) AndAlso Not (args.IgnoreBusinessRules)) Then
                Dim userIsDeveloper As Boolean = IsDeveloper
                If ((Not (IsContentEditor) OrElse Not (userIsDeveloper)) OrElse (args.Values Is Nothing)) Then
                    Throw New HttpException(403, "Forbidden")
                End If
                Dim id As FieldValue = args.SelectFieldValueObject(SiteContentFieldName(SiteContentFields.SiteContentId))
                Dim path As FieldValue = args.SelectFieldValueObject(SiteContentFieldName(SiteContentFields.Path))
                Dim fileName As FieldValue = args.SelectFieldValueObject(SiteContentFieldName(SiteContentFields.DataFileName))
                Dim text As FieldValue = args.SelectFieldValueObject(SiteContentFieldName(SiteContentFields.Text))
                'verify "Path" access
                If ((path Is Nothing) OrElse (fileName Is Nothing)) Then
                    Throw New HttpException(403, "Forbidden")
                End If
                If (((Not (path.Value) Is Nothing) AndAlso path.Value.ToString().StartsWith("sys/", StringComparison.CurrentCultureIgnoreCase)) AndAlso Not (userIsDeveloper)) Then
                    Throw New HttpException(403, "Forbidden")
                End If
                If (((Not (path.OldValue) Is Nothing) AndAlso path.OldValue.ToString().StartsWith("sys/", StringComparison.CurrentCultureIgnoreCase)) AndAlso Not (userIsDeveloper)) Then
                    Throw New HttpException(403, "Forbidden")
                End If
                'convert and parse "Text" as needed
                If ((Not (text) Is Nothing) AndAlso Not ((args.CommandName = "Delete"))) Then
                    Dim s As String = Convert.ToString(text.Value)
                    If (s = "$Text") Then
                        Dim fullPath As String = Convert.ToString(path.Value)
                        If Not (String.IsNullOrEmpty(fullPath)) Then
                            fullPath = (fullPath + "/")
                        End If
                        fullPath = (fullPath + Convert.ToString(fileName.Value))
                        If Not (fullPath.StartsWith("/")) Then
                            fullPath = ("/" + fullPath)
                        End If
                        If Not (fullPath.EndsWith(".html", StringComparison.CurrentCultureIgnoreCase)) Then
                            fullPath = (fullPath + ".html")
                        End If
                        Dim physicalPath As String = HttpContext.Current.Server.MapPath(("~" + fullPath))
                        If Not (File.Exists(physicalPath)) Then
                            physicalPath = HttpContext.Current.Server.MapPath(("~" + fullPath.Replace("-", String.Empty)))
                            If Not (File.Exists(physicalPath)) Then
                                physicalPath = Nothing
                            End If
                        End If
                        If Not (String.IsNullOrEmpty(physicalPath)) Then
                            text.NewValue = File.ReadAllText(physicalPath)
                        End If
                    End If
                End If
            End If
        End Sub
        
        Public Overridable Function SiteContentFieldName(ByVal field As SiteContentFields) As String
            Return field.ToString()
        End Function
        
        Public Overridable Function ReadSiteContentString(ByVal relativePath As String) As String
            Dim data() As Byte = ReadSiteContentBytes(relativePath)
            If (data Is Nothing) Then
                Return Nothing
            End If
            Return Encoding.UTF8.GetString(data)
        End Function
        
        Public Overridable Function ReadSiteContentBytes(ByVal relativePath As String) As Byte()
            Dim f As SiteContentFile = ReadSiteContent(relativePath)
            If (f Is Nothing) Then
                Return Nothing
            End If
            Return f.Data
        End Function
        
        Public Overloads Overridable Function ReadSiteContent(ByVal relativePath As String) As SiteContentFile
            Dim context As HttpContext = HttpContext.Current
            Dim f As SiteContentFile = CType(context.Items(relativePath),SiteContentFile)
            If (f Is Nothing) Then
                f = CType(context.Cache(relativePath),SiteContentFile)
            End If
            If (f Is Nothing) Then
                Dim path As String = relativePath
                Dim fileName As String = relativePath
                Dim index As Integer = relativePath.LastIndexOf("/")
                If (index >= 0) Then
                    fileName = path.Substring((index + 1))
                    path = relativePath.Substring(0, index)
                Else
                    path = Nothing
                End If
                Dim files As SiteContentFileList = ReadSiteContent(path, fileName, 1)
                If (files.Count = 1) Then
                    f = files(0)
                    context.Items(relativePath) = f
                    If (f.CacheDuration > 0) Then
                        context.Cache.Add(relativePath, f, Nothing, DateTime.Now.AddSeconds(f.CacheDuration), Cache.NoSlidingExpiration, CacheItemPriority.Normal, Nothing)
                    End If
                End If
            End If
            Return f
        End Function
        
        Public Overloads Overridable Function ReadSiteContent(ByVal relativePath As String, ByVal fileName As String) As SiteContentFileList
            Return ReadSiteContent(relativePath, fileName, Int32.MaxValue)
        End Function
        
        Public Overloads Overridable Function ReadSiteContent(ByVal relativePath As String, ByVal fileName As String, ByVal maxCount As Integer) As SiteContentFileList
            Dim result As SiteContentFileList = New SiteContentFileList()
            If IsSafeMode Then
                Return result
            End If
            'prepare a filter
            Dim dataFileNameField As String = SiteContentFieldName(SiteContentFields.DataFileName)
            Dim pathField As String = SiteContentFieldName(SiteContentFields.Path)
            Dim filter As List(Of String) = New List(Of String)()
            Dim pathFilter As String = Nothing
            If Not (String.IsNullOrEmpty(relativePath)) Then
                pathFilter = "{0}:={1}"
                Dim firstWildcardIndex As Integer = relativePath.IndexOf("%")
                If (firstWildcardIndex >= 0) Then
                    Dim lastWildcardIndex As Integer = relativePath.LastIndexOf("%")
                    pathFilter = "{0}:$contains${1}"
                    If (firstWildcardIndex = lastWildcardIndex) Then
                        If (firstWildcardIndex = 0) Then
                            pathFilter = "{0}:$endswith${1}"
                            relativePath = relativePath.Substring(1)
                        Else
                            If (lastWildcardIndex = (relativePath.Length - 1)) Then
                                pathFilter = "{0}:$beginswith${1}"
                                relativePath = relativePath.Substring(0, lastWildcardIndex)
                            End If
                        End If
                    End If
                End If
            Else
                pathFilter = "{0}:=null"
            End If
            Dim fileNameFilter As String = Nothing
            If (Not (String.IsNullOrEmpty(fileName)) AndAlso Not ((fileName = "%"))) Then
                fileNameFilter = "{0}:={1}"
                Dim firstWildcardIndex As Integer = fileName.IndexOf("%")
                If (firstWildcardIndex >= 0) Then
                    Dim lastWildcardIndex As Integer = fileName.LastIndexOf("%")
                    fileNameFilter = "{0}:$contains${1}"
                    If (firstWildcardIndex = lastWildcardIndex) Then
                        If (firstWildcardIndex = 0) Then
                            fileNameFilter = "{0}:$endswith${1}"
                            fileName = fileName.Substring(1)
                        Else
                            If (lastWildcardIndex = (fileName.Length - 1)) Then
                                fileNameFilter = "{0}:$beginswith${1}"
                                fileName = fileName.Substring(0, lastWildcardIndex)
                            End If
                        End If
                    End If
                End If
            End If
            If (Not (String.IsNullOrEmpty(pathFilter)) OrElse Not (String.IsNullOrEmpty(fileNameFilter))) Then
                filter.Add("_match_:$all$")
                If Not (String.IsNullOrEmpty(pathFilter)) Then
                    filter.Add(String.Format(pathFilter, pathField, DataControllerBase.ValueToString(relativePath)))
                End If
                If (Not ((fileName = Nothing)) AndAlso Not ((fileName = "%"))) Then
                    filter.Add(String.Format(fileNameFilter, dataFileNameField, DataControllerBase.ValueToString(fileName)))
                    If (String.IsNullOrEmpty(Path.GetExtension(fileName)) AndAlso (String.IsNullOrEmpty(relativePath) OrElse (Not (relativePath.StartsWith("sys/", StringComparison.OrdinalIgnoreCase)) OrElse relativePath.StartsWith("sys/controls", StringComparison.OrdinalIgnoreCase)))) Then
                        filter.Add("_match_:$all$")
                        If Not (String.IsNullOrEmpty(pathFilter)) Then
                            filter.Add(String.Format(pathFilter, pathField, DataControllerBase.ValueToString(relativePath)))
                        End If
                        filter.Add(String.Format(fileNameFilter, dataFileNameField, DataControllerBase.ValueToString((Path.GetFileNameWithoutExtension(fileName).Replace("-", String.Empty) + ".html"))))
                    End If
                End If
            End If
            ' determine user identity
            Dim context As HttpContext = HttpContext.Current
            Dim userName As String = String.Empty
            Dim isAuthenticated As Boolean = false
            Dim user As IPrincipal = context.User
            If (Not (user) Is Nothing) Then
                userName = user.Identity.Name.ToLower()
                isAuthenticated = user.Identity.IsAuthenticated
            End If
            'enumerate site content files
            Dim r As PageRequest = New PageRequest()
            r.Controller = GetSiteContentControllerName()
            r.View = GetSiteContentViewId()
            r.RequiresSiteContentText = true
            r.PageSize = Int32.MaxValue
            r.Filter = filter.ToArray()
            Dim engine As IDataEngine = ControllerFactory.CreateDataEngine()
            Dim controller As DataControllerBase = CType(engine,DataControllerBase)
            controller.AllowPublicAccess = true
            Dim reader As IDataReader = engine.ExecuteReader(r)
            Dim blobsToResolve As SortedDictionary(Of String, SiteContentFile) = New SortedDictionary(Of String, SiteContentFile)()
            'verify optional SiteContent fields
            Dim fieldDictionary As SortedDictionary(Of String, String) = New SortedDictionary(Of String, String)()
            Dim i As Integer = 0
            Do While (i < reader.FieldCount)
                Dim fieldName As String = reader.GetName(i)
                fieldDictionary(fieldName) = fieldName
                i = (i + 1)
            Loop
            Dim rolesField As String = Nothing
            fieldDictionary.TryGetValue(SiteContentFieldName(SiteContentFields.Roles), rolesField)
            Dim usersField As String = Nothing
            fieldDictionary.TryGetValue(SiteContentFieldName(SiteContentFields.Users), usersField)
            Dim roleExceptionsField As String = Nothing
            fieldDictionary.TryGetValue(SiteContentFieldName(SiteContentFields.RoleExceptions), roleExceptionsField)
            Dim userExceptionsField As String = Nothing
            fieldDictionary.TryGetValue(SiteContentFieldName(SiteContentFields.UserExceptions), userExceptionsField)
            Dim cacheProfileField As String = Nothing
            fieldDictionary.TryGetValue(SiteContentFieldName(SiteContentFields.CacheProfile), cacheProfileField)
            Dim scheduleField As String = Nothing
            fieldDictionary.TryGetValue(SiteContentFieldName(SiteContentFields.Schedule), scheduleField)
            Dim scheduleExceptionsField As String = Nothing
            fieldDictionary.TryGetValue(SiteContentFieldName(SiteContentFields.ScheduleExceptions), scheduleExceptionsField)
            Dim dataField As DataField = controller.CreateViewPage().FindField(SiteContentFieldName(SiteContentFields.Data))
            Dim blobHandler As String = dataField.OnDemandHandler
            Dim wr As WorkflowRegister = WorkflowRegister.GetCurrent(relativePath)
            'read SiteContent files
            Do While reader.Read()
                'verify user access rights
                Dim include As Boolean = true
                If Not (String.IsNullOrEmpty(rolesField)) Then
                    Dim roles As String = Convert.ToString(reader(rolesField))
                    If (Not (String.IsNullOrEmpty(roles)) AndAlso Not ((roles = "?"))) Then
                        If ((roles = "*") AndAlso Not (isAuthenticated)) Then
                            include = false
                        Else
                            If (Not (isAuthenticated) OrElse (Not ((roles = "*")) AndAlso Not (DataControllerBase.UserIsInRole(roles)))) Then
                                include = false
                            End If
                        End If
                    End If
                End If
                If (include AndAlso Not (String.IsNullOrEmpty(usersField))) Then
                    Dim users As String = Convert.ToString(reader(usersField))
                    If (Not (String.IsNullOrEmpty(users)) AndAlso (Array.IndexOf(users.ToLower().Split(New Char() {Global.Microsoft.VisualBasic.ChrW(44)}, StringSplitOptions.RemoveEmptyEntries), userName) = -1)) Then
                        include = false
                    End If
                End If
                If (include AndAlso Not (String.IsNullOrEmpty(roleExceptionsField))) Then
                    Dim roleExceptions As String = Convert.ToString(reader(roleExceptionsField))
                    If (Not (String.IsNullOrEmpty(roleExceptions)) AndAlso (isAuthenticated AndAlso ((roleExceptions = "*") OrElse DataControllerBase.UserIsInRole(roleExceptions)))) Then
                        include = false
                    End If
                End If
                If (include AndAlso Not (String.IsNullOrEmpty(userExceptionsField))) Then
                    Dim userExceptions As String = Convert.ToString(reader(userExceptionsField))
                    If (Not (String.IsNullOrEmpty(userExceptions)) AndAlso Not ((Array.IndexOf(userExceptions.ToLower().Split(New Char() {Global.Microsoft.VisualBasic.ChrW(44)}, StringSplitOptions.RemoveEmptyEntries), userName) = -1))) Then
                        include = false
                    End If
                End If
                Dim physicalName As String = Convert.ToString(reader(dataFileNameField))
                Dim physicalPath As String = Convert.ToString(reader(SiteContentFieldName(SiteContentFields.Path)))
                'check if the content object is a part of a workflow
                If (((Not (wr) Is Nothing) AndAlso wr.Enabled) AndAlso Not (wr.IsMatch(physicalPath, physicalName))) Then
                    include = false
                End If
                Dim schedule As String = Nothing
                Dim scheduleExceptions As String = Nothing
                'check if the content object is on schedule
                If (include AndAlso (String.IsNullOrEmpty(physicalPath) OrElse Not (physicalPath.StartsWith("sys/schedules/")))) Then
                    If Not (String.IsNullOrEmpty(scheduleField)) Then
                        schedule = Convert.ToString(reader(scheduleField))
                    End If
                    If Not (String.IsNullOrEmpty(scheduleExceptionsField)) Then
                        scheduleExceptions = Convert.ToString(reader(scheduleExceptionsField))
                    End If
                    If (Not (String.IsNullOrEmpty(schedule)) OrElse Not (String.IsNullOrEmpty(scheduleExceptions))) Then
                        Dim scheduleStatusKey As String = String.Format("ScheduleStatus|{0}|{1}", schedule, scheduleExceptions)
                        Dim status As ScheduleStatus = CType(context.Items(scheduleStatusKey),ScheduleStatus)
                        If (status Is Nothing) Then
                            status = CType(context.Cache(scheduleStatusKey),ScheduleStatus)
                        End If
                        Dim scheduleStatusChanged As Boolean = false
                        If (status Is Nothing) Then
                            If (Not (String.IsNullOrEmpty(schedule)) AndAlso Not (schedule.Contains("+"))) Then
                                schedule = ReadSiteContentString(("sys/schedules%/" + schedule))
                            End If
                            If (Not (String.IsNullOrEmpty(scheduleExceptions)) AndAlso Not (scheduleExceptions.Contains("+"))) Then
                                scheduleExceptions = ReadSiteContentString(("sys/schedules%/" + scheduleExceptions))
                            End If
                            If (Not (String.IsNullOrEmpty(schedule)) OrElse Not (String.IsNullOrEmpty(scheduleExceptions))) Then
                                status = Scheduler.Test(schedule, scheduleExceptions)
                            Else
                                status = New ScheduleStatus()
                                status.Success = true
                                status.NextTestDate = DateTime.MaxValue
                            End If
                            context.Items(scheduleStatusKey) = status
                            scheduleStatusChanged = true
                        Else
                            If (DateTime.Now > status.NextTestDate) Then
                                status = Scheduler.Test(status.Schedule, status.Exceptions)
                                context.Items(scheduleStatusKey) = status
                                scheduleStatusChanged = true
                            End If
                        End If
                        If scheduleStatusChanged Then
                            context.Cache.Add(scheduleStatusKey, status, Nothing, DateTime.Now.AddSeconds(ScheduleCacheDuration), Cache.NoSlidingExpiration, CacheItemPriority.Normal, Nothing)
                        End If
                        If Not (status.Success) Then
                            include = false
                        End If
                    End If
                End If
                'create a file instance
                If include Then
                    Dim siteContentIdField As String = SiteContentFieldName(SiteContentFields.SiteContentId)
                    Dim f As SiteContentFile = New SiteContentFile()
                    f.Id = reader(siteContentIdField)
                    f.Name = fileName
                    f.PhysicalName = physicalName
                    If (String.IsNullOrEmpty(f.Name) OrElse f.Name.Contains("%")) Then
                        f.Name = f.PhysicalName
                    End If
                    f.Path = physicalPath
                    f.ContentType = Convert.ToString(reader(SiteContentFieldName(SiteContentFields.DataContentType)))
                    f.Schedule = schedule
                    f.ScheduleExceptions = scheduleExceptions
                    If Not (String.IsNullOrEmpty(cacheProfileField)) Then
                        Dim cacheProfile As String = Convert.ToString(reader(cacheProfileField))
                        If Not (String.IsNullOrEmpty(cacheProfile)) Then
                            f.CacheProfile = cacheProfile
                            cacheProfile = ReadSiteContentString(("sys/cache-profiles/" + cacheProfile))
                            If Not (String.IsNullOrEmpty(cacheProfile)) Then
                                Dim m As Match = NameValueListRegex.Match(cacheProfile)
                                Do While m.Success
                                    Dim n As String = m.Groups("Name").Value.ToLower()
                                    Dim v As String = m.Groups("Value").Value
                                    If (n = "duration") Then
                                        Dim duration As Integer = 0
                                        If Int32.TryParse(v, duration) Then
                                            f.CacheDuration = duration
                                            f.CacheLocation = HttpCacheability.ServerAndPrivate
                                        End If
                                    Else
                                        If (n = "location") Then
                                            Try 
                                                f.CacheLocation = CType(TypeDescriptor.GetConverter(GetType(HttpCacheability)).ConvertFromString(v),HttpCacheability)
                                            Catch __exception As Exception
                                            End Try
                                        Else
                                            If (n = "varybyheaders") Then
                                                f.CacheVaryByHeaders = v.Split(New Char() {Global.Microsoft.VisualBasic.ChrW(44), Global.Microsoft.VisualBasic.ChrW(59)}, StringSplitOptions.RemoveEmptyEntries)
                                            Else
                                                If (n = "varybyparams") Then
                                                    f.CacheVaryByParams = v.Split(New Char() {Global.Microsoft.VisualBasic.ChrW(44), Global.Microsoft.VisualBasic.ChrW(59)}, StringSplitOptions.RemoveEmptyEntries)
                                                Else
                                                    If (n = "nostore") Then
                                                        f.CacheNoStore = (v.ToLower() = "true")
                                                    End If
                                                End If
                                            End If
                                        End If
                                    End If
                                    m = m.NextMatch()
                                Loop
                            End If
                        End If
                    End If
                    Dim textString As Object = reader(SiteContentFieldName(SiteContentFields.Text))
                    If (DBNull.Value.Equals(textString) OrElse Not (f.IsText)) Then
                        Dim blobKey As String = String.Format("{0}=o|{1}", blobHandler, f.Id)
                        If (f.CacheDuration > 0) Then
                            f.Data = CType(HttpContext.Current.Cache(blobKey),Byte())
                        End If
                        If (f.Data Is Nothing) Then
                            blobsToResolve(blobKey) = f
                        End If
                    Else
                        If String.IsNullOrEmpty(f.ContentType) Then
                            If Regex.IsMatch(CType(textString,String), "</\w+\s*>") Then
                                f.ContentType = "text/xml"
                            Else
                                f.ContentType = "text/plain"
                            End If
                        End If
                        f.Data = Encoding.UTF8.GetBytes(CType(textString,String))
                    End If
                    result.Add(f)
                    If (result.Count = maxCount) Then
                        Exit Do
                    End If
                End If
            Loop
            reader.Close()
            For Each blobKey As String in blobsToResolve.Keys
                Dim f As SiteContentFile = blobsToResolve(blobKey)
                'download blob content
                Try 
                    f.Data = Blob.Read(blobKey)
                    If (f.CacheDuration > 0) Then
                        HttpContext.Current.Cache.Add(blobKey, f.Data, Nothing, DateTime.Now.AddSeconds(f.CacheDuration), Cache.NoSlidingExpiration, CacheItemPriority.Normal, Nothing)
                    End If
                Catch ex As Exception
                    f.Error = ex.Message
                End Try
            Next
            Return result
        End Function
        
        Public Overridable Function IsSystemResource(ByVal request As HttpRequest) As Boolean
            Return SystemResourceRegex.IsMatch(request.AppRelativeCurrentExecutionFilePath)
        End Function
        
        Public Overloads Overridable Sub LoadContent(ByVal request As HttpRequest, ByVal response As HttpResponse, ByVal content As SortedDictionary(Of String, String))
            If IsSystemResource(request) Then
                Return
            End If
            Dim text As String = Nothing
            Dim tryFileSystem As Boolean = true
            If IsSiteContentEnabled Then
                Dim fileName As String = HttpUtility.UrlDecode(request.Url.Segments((request.Url.Segments.Length - 1)))
                Dim path As String = request.CurrentExecutionFilePath.Substring(request.ApplicationPath.Length)
                If ((fileName = "/") AndAlso String.IsNullOrEmpty(path)) Then
                    fileName = "index"
                Else
                    path = path.Substring(0, (path.Length - fileName.Length))
                    If path.EndsWith("/") Then
                        path = path.Substring(0, (path.Length - 1))
                    End If
                End If
                If String.IsNullOrEmpty(path) Then
                    path = Nothing
                End If
                Dim files As SiteContentFileList = ReadSiteContent(path, fileName, 1)
                If (files.Count > 0) Then
                    Dim f As SiteContentFile = files(0)
                    If (f.ContentType = "text/html") Then
                        text = f.Text
                        tryFileSystem = false
                    Else
                        If (f.CacheDuration > 0) Then
                            Dim expires As DateTime = DateTime.Now.AddSeconds(f.CacheDuration)
                            response.Cache.SetExpires(expires)
                            response.Cache.SetCacheability(f.CacheLocation)
                            If (Not (f.CacheVaryByParams) Is Nothing) Then
                                For Each header As String in f.CacheVaryByParams
                                    response.Cache.VaryByParams(header) = true
                                Next
                            End If
                            If (Not (f.CacheVaryByHeaders) Is Nothing) Then
                                For Each header As String in f.CacheVaryByHeaders
                                    response.Cache.VaryByHeaders(header) = true
                                Next
                            End If
                            If f.CacheNoStore Then
                                response.Cache.SetNoStore()
                            End If
                        End If
                        response.ContentType = f.ContentType
                        response.AddHeader("Content-Disposition", ("filename=" + HttpUtility.UrlEncode(f.PhysicalName)))
                        response.OutputStream.Write(f.Data, 0, f.Data.Length)
                        Try 
                            response.Flush()
                        Catch __exception As Exception
                        End Try
                        response.End()
                    End If
                End If
            End If
            If tryFileSystem Then
                Dim filePath As String = request.PhysicalPath
                Dim fileExtension As String = Path.GetExtension(filePath)
                If (Not ((fileExtension.ToLower() = ".html")) AndAlso File.Exists(filePath)) Then
                    Dim fileName As String = Path.GetFileName(filePath)
                    response.AddHeader("Content-Disposition", ("filename=" + HttpUtility.UrlEncode(fileName)))
                    response.ContentType = MimeMapping.GetMimeMapping(fileName)
                    Dim expires As Date = DateTime.Now.AddSeconds(((60 * 60)  _
                                    * 24))
                    response.Cache.SetExpires(expires)
                    response.Cache.SetCacheability(HttpCacheability.Public)
                    Dim data() As Byte = File.ReadAllBytes(filePath)
                    response.OutputStream.Write(data, 0, data.Length)
                    Try 
                        response.Flush()
                    Catch __exception As Exception
                    End Try
                    response.End()
                End If
                If Not (String.IsNullOrEmpty(fileExtension)) Then
                    filePath = Path.Combine(Path.GetDirectoryName(filePath), Path.GetFileNameWithoutExtension(filePath))
                End If
                filePath = (filePath + ".html")
                If File.Exists(filePath) Then
                    text = File.ReadAllText(filePath)
                Else
                    If Path.GetFileNameWithoutExtension(filePath).Contains("-") Then
                        filePath = Path.Combine(Path.GetDirectoryName(filePath), Path.GetFileName(filePath).Replace("-", String.Empty))
                        If File.Exists(filePath) Then
                            text = File.ReadAllText(filePath)
                        End If
                    End If
                End If
                If (Not (text) Is Nothing) Then
                    text = Localizer.Replace("Pages", filePath, text)
                End If
            End If
            If (Not (text) Is Nothing) Then
                text = Regex.Replace(text, "<!--[\s\S]+?-->\s*", String.Empty)
                content("File") = text
            End If
        End Sub
        
        Public Overridable Sub CreateStandardMembershipAccounts()
            'Create a separate code file with a definition of the partial class ApplicationServices overriding
            'this method to prevent automatic registration of 'admin' and 'user'. Do not change this file directly.
            RegisterStandardMembershipAccounts()
        End Sub
        
        Public Overridable Function RequiresAuthentication(ByVal request As HttpRequest) As Boolean
            Return request.Path.EndsWith("Export.ashx", StringComparison.CurrentCultureIgnoreCase)
        End Function
        
        Public Overridable Function AuthenticateRequest(ByVal context As HttpContext) As Boolean
            Return false
        End Function
        
        Public Overridable Sub RedirectToLoginPage()
            Dim handler As OAuthHandler = OAuthHandlerFactory.GetActiveHandler()
            If (Not (handler) Is Nothing) Then
                handler.StartPage = HttpContext.Current.Request.Url.AbsolutePath
                handler.RedirectToLoginPage()
                Return
            End If
            FormsAuthentication.RedirectToLoginPage()
        End Sub
        
        Public Overridable Function AuthenticateUser(ByVal username As String, ByVal password As String, ByVal createPersistentCookie As Boolean) As Object
            Dim response As HttpResponse = HttpContext.Current.Response
            If password.StartsWith("token:") Then
                'validate token login
                Try 
                    Dim key As String = password.Substring(6)
                    Dim ticket As FormsAuthenticationTicket = FormsAuthentication.Decrypt(key)
                    If ValidateTicket(ticket) Then
                        Dim user As MembershipUser = Membership.GetUser(ticket.Name)
                        If (Not (user) Is Nothing) Then
                            InvalidateTicket(ticket)
                            Dim cookie As HttpCookie = New HttpCookie(".PROVIDER", String.Empty)
                            If (Not (String.IsNullOrEmpty(ticket.UserData)) AndAlso ticket.UserData.StartsWith("OAUTH:")) Then
                                Dim handler As OAuthHandler = OAuthHandlerFactory.Create(ticket.UserData.Substring(6))
                                If (Not (handler) Is Nothing) Then
                                    cookie.Value = handler.GetHandlerName()
                                    If Not (handler.AuthenticateTicket(user)) Then
                                        Return false
                                    End If
                                End If
                            End If
                            HttpContext.Current.Response.SetCookie(cookie)
                            FormsAuthentication.SetAuthCookie(user.UserName, createPersistentCookie)
                            Return CreateTicket(user)
                        End If
                    End If
                Catch __exception As Exception
                End Try
            Else
                'login user
                If UserLogin(username, password, createPersistentCookie) Then
                    Dim user As MembershipUser = Membership.GetUser(username)
                    If (Not (user) Is Nothing) Then
                        Return CreateTicket(user)
                    End If
                End If
            End If
            Return false
        End Function
        
        Public Overridable Function CreateTicket(ByVal user As MembershipUser) As UserTicket
            Dim timeout As Integer = (60  _
                        * (24 * 7))
            Dim jTimeout As JToken = DefaultSettings("TokenExpiration")
            If (Not (jTimeout) Is Nothing) Then
                timeout = (CType(jTimeout,Integer) * 60)
            End If
            Dim userData As String = String.Empty
            Dim handler As OAuthHandler = OAuthHandlerFactory.GetActiveHandler()
            If (Not (handler) Is Nothing) Then
                userData = ("OAUTH:" + handler.GetHandlerName())
            End If
            Dim ticket As FormsAuthenticationTicket = New FormsAuthenticationTicket(1, user.UserName, DateTime.Now, DateTime.Now.AddMinutes(timeout), false, userData)
            Return New UserTicket(user, FormsAuthentication.Encrypt(ticket))
        End Function
        
        Public Overridable Function ValidateTicket(ByVal ticket As FormsAuthenticationTicket) As Boolean
            Return Not (((ticket Is Nothing) OrElse (ticket.Expired OrElse String.IsNullOrEmpty(ticket.Name))))
        End Function
        
        Public Overridable Sub InvalidateTicket(ByVal ticket As FormsAuthenticationTicket)
        End Sub
        
        Public Overridable Function UserLogin(ByVal username As String, ByVal password As String, ByVal createPersistentCookie As Boolean) As Boolean
            If Membership.ValidateUser(username, password) Then
                FormsAuthentication.SetAuthCookie(username, createPersistentCookie)
                Return true
            Else
                Return false
            End If
        End Function
        
        Public Overridable Sub UserLogout()
            FormsAuthentication.SignOut()
            If ApplicationServices.IsSiteContentEnabled Then
                Dim handler As OAuthHandler = OAuthHandlerFactory.GetActiveHandler()
                If (Not (handler) Is Nothing) Then
                    handler.SignOut()
                End If
            End If
        End Sub
        
        Public Overridable Function UserRoles() As String()
            Return Roles.GetRolesForUser()
        End Function
        
        Public Overridable Function UserThemes() As JObject
            Dim lists As JObject = New JObject()
            Dim themes As JArray = New JArray()
            Dim accents As JArray = New JArray()
            lists("themes") = themes
            lists("accents") = accents
            Dim themesPath As String = HttpContext.Current.Server.MapPath("~/css/themes")
            For Each f As String in Directory.GetFiles(themesPath, "touch-theme.*.json")
                themes.Add(JObject.Parse(File.ReadAllText(f)))
            Next
            For Each f As String in Directory.GetFiles(themesPath, "touch-accent.*.json")
                accents.Add(JObject.Parse(File.ReadAllText(f)))
            Next
            Return lists
        End Function
        
        Public Overridable Function UserSettings(ByVal p As Page) As JObject
            Dim settings As JObject = New JObject(DefaultSettings)
            If (settings("membership") Is Nothing) Then
                settings("membership") = New JObject()
            End If
            Dim userKey As String = String.Empty
            Dim user As MembershipUser = Membership.GetUser()
            If (Not (user) Is Nothing) Then
                userKey = Convert.ToString(user.ProviderUserKey)
                If Not (String.IsNullOrEmpty(user.Comment)) Then
                    Dim m As Match = Regex.Match(user.Comment, "\bSource:\s*\b(?'Value'\w+)\b", RegexOptions.IgnoreCase)
                    If m.Success Then
                        Dim handler As OAuthHandler = OAuthHandlerFactory.Create(m.Groups("Value").Value)
                        If (Not (handler) Is Nothing) Then
                            settings("membership")("profile") = handler.GetUserProfile()
                        End If
                    End If
                End If
            End If
            settings("appInfo") = String.Join("|", New String() {Name, HttpContext.Current.User.Identity.Name, userKey})
            settings("ui")("theme")("name") = UserTheme
            settings("ui")("theme")("accent") = UserAccent
            Return settings
        End Function
        
        Public Overridable Function UserHomePageUrl() As String
            Return "~/Pages/Home.aspx"
        End Function
        
        Public Overridable Function UserPictureString(ByVal user As MembershipUser) As String
            Try 
                Dim img As Image = UserPictureImage(user)
                If (img Is Nothing) Then
                    img = UserPictureFromCMS(user)
                End If
                If (Not (img) Is Nothing) Then
                    If ((img.Width > 80) OrElse (img.Height > 80)) Then
                        Dim scale As Single = (CType(img.Width,Single) / 80)
                        Dim height As Integer = CType((img.Height / scale),Integer)
                        Dim width As Integer = 80
                        If (img.Height < img.Width) Then
                            scale = (CType(img.Height,Single) / 80)
                            height = 80
                            width = CType((img.Width / scale),Integer)
                        End If
                        img = Blob.ResizeImage(img, width, height)
                    End If
                    Using stream As MemoryStream = New MemoryStream()
                        img.Save(stream, ImageFormat.Bmp)
                        Dim bytes() As Byte = stream.ToArray()
                        img.Dispose()
                        Return ("data:image/raw;base64," + Convert.ToBase64String(bytes))
                    End Using
                End If
            Catch __exception As Exception
            End Try
            Return String.Empty
        End Function
        
        Public Overridable Function UserPictureImage(ByVal user As MembershipUser) As Image
            Dim url As String = UserPictureUrl(user)
            If Not (String.IsNullOrEmpty(url)) Then
                Dim request As WebRequest = WebRequest.Create(url)
                Using stream As Stream = request.GetResponse().GetResponseStream()
                    Using ms As MemoryStream = New MemoryStream()
                        stream.CopyTo(ms)
                        Return CType(New ImageConverter().ConvertFrom(ms.ToArray()),Image)
                    End Using
                End Using
            Else
                url = UserPictureFilePath(user)
                If Not (String.IsNullOrEmpty(url)) Then
                    Return Image.FromFile(url)
                End If
            End If
            Return Nothing
        End Function
        
        Public Overridable Function UserPictureFromCMS(ByVal user As MembershipUser) As Image
            Return Nothing
        End Function
        
        Public Overridable Function UserPictureFilePath(ByVal user As MembershipUser) As String
            Return Nothing
        End Function
        
        Public Overridable Function UserPictureUrl(ByVal user As MembershipUser) As String
            Return Nothing
        End Function
        
        Public Shared Function Create() As ApplicationServices
            Return New ApplicationServices()
        End Function
        
        Public Shared Function UserIsAuthorizedToAccessResource(ByVal path As String, ByVal roles As String) As Boolean
            Return Not (Create().ResourceAuthorizationIsRequired(path, roles))
        End Function
        
        Public Overridable Function ResourceAuthorizationIsRequired(ByVal path As String, ByVal roles As String) As Boolean
            If (roles Is Nothing) Then
                roles = String.Empty
            Else
                roles = roles.Trim()
            End If
            Dim requiresAuthorization As Boolean = false
            Dim isAuthenticated As Boolean = HttpContext.Current.User.Identity.IsAuthenticated
            If (String.IsNullOrEmpty(roles) AndAlso Not (isAuthenticated)) Then
                requiresAuthorization = true
            End If
            If (Not (String.IsNullOrEmpty(roles)) AndAlso Not ((roles = "?"))) Then
                If (roles = "*") Then
                    If Not (isAuthenticated) Then
                        requiresAuthorization = true
                    End If
                Else
                    If (Not (isAuthenticated) OrElse Not (DataControllerBase.UserIsInRole(roles))) Then
                        requiresAuthorization = true
                    End If
                End If
            End If
            If (path = FormsAuthentication.LoginUrl) Then
                requiresAuthorization = false
                If (Not (isAuthenticated) AndAlso (Not ((HttpContext.Current.Request.QueryString("_autoLogin") = "false")) AndAlso (HttpContext.Current.Request.Cookies(".TOKEN") Is Nothing))) Then
                    Dim handler As OAuthHandler = OAuthHandlerFactory.CreateAutoLogin()
                    If (Not (handler) Is Nothing) Then
                        HttpContext.Current.Response.Cookies.Set(New HttpCookie(".PROVIDER", handler.GetHandlerName()))
                        requiresAuthorization = true
                    End If
                End If
            End If
            Return requiresAuthorization
        End Function
        
        Public Shared Sub RegisterStandardMembershipAccounts()
            Dim admin As MembershipUser = Membership.GetUser("admin")
            If ((Not (admin) Is Nothing) AndAlso admin.IsLockedOut) Then
                admin.UnlockUser()
            End If
            Dim user As MembershipUser = Membership.GetUser("user")
            If ((Not (user) Is Nothing) AndAlso user.IsLockedOut) Then
                user.UnlockUser()
            End If
            If (Membership.GetUser("admin") Is Nothing) Then
                Dim status As MembershipCreateStatus
                admin = Membership.CreateUser("admin", "admin123%", "admin@MyCompany.com", "ASP.NET", "Code OnTime", true, status)
                user = Membership.CreateUser("user", "user123%", "user@MyCompany.com", "ASP.NET", "Code OnTime", true, status)
                Roles.CreateRole("Administrators")
                Roles.CreateRole("Users")
                Roles.AddUserToRole(admin.UserName, "Users")
                Roles.AddUserToRole(user.UserName, "Users")
                Roles.AddUserToRole(admin.UserName, "Administrators")
            End If
        End Sub
        
        Public Shared Sub RegisterCssLinks(ByVal p As Page)
            For Each c As Control in p.Header.Controls
                If TypeOf c Is HtmlLink Then
                    Dim l As HtmlLink = CType(c,HtmlLink)
                    If (l.ID = "MyCompanyTheme") Then
                        Return
                    End If
                    If l.Href.Contains("_Theme_Social.css") Then
                        l.ID = "MyCompanyTheme"
                        If Not (l.Href.Contains("?")) Then
                            l.Href = (l.Href + String.Format("?{0}", ApplicationServices.Version))
                        End If
                        Return
                    End If
                End If
            Next
        End Sub
        
        Private Sub LoadTheme()
            Dim theme As String = String.Empty
            If (Not (HttpContext.Current) Is Nothing) Then
                Dim themeCookie As HttpCookie = HttpContext.Current.Request.Cookies((".COTTHEME" + BusinessRules.UserName))
                If (Not (themeCookie) Is Nothing) Then
                    theme = themeCookie.Value
                End If
            End If
            If (Not (String.IsNullOrEmpty(theme)) AndAlso theme.Contains(Global.Microsoft.VisualBasic.ChrW(46))) Then
                theme = theme.Replace(" ", String.Empty)
                Dim parts() As String = theme.Split(Global.Microsoft.VisualBasic.ChrW(46))
                m_UserTheme = parts(0)
                m_UserAccent = parts(1)
            Else
                m_UserTheme = CType(DefaultSettings("ui")("theme")("name"),String)
                m_UserAccent = CType(DefaultSettings("ui")("theme")("accent"),String)
            End If
        End Sub
        
        Protected Overridable Function AllowTouchUIStylesheet(ByVal name As String) As Boolean
            Return Not (Regex.IsMatch(name, "^(touch|bootstrap|jquery\.mobile)"))
        End Function
        
        Public Overridable Function EnumerateTouchUIStylesheets() As List(Of String)
            Dim stylesheets As List(Of String) = New List(Of String)()
            Dim ext As String = ".min.css"
            If Not (EnableMinifiedCss) Then
                ext = ".css"
            End If
            stylesheets.Add(String.Format("~\css\sys\jquery.mobile-{0}{1}", ApplicationServices.JqmVersion, ext))
            stylesheets.Add(("~\css\daf\touch" + ext))
            stylesheets.Add(("~\css\daf\touch-charts" + ext))
            stylesheets.Add(("~\css\sys\bootstrap" + ext))
            stylesheets.Add(String.Format("~\appservices\touch-theme.{0}.{1}.css", UserTheme, UserAccent))
            'enumerate custom css files
            Dim customCss As List(Of String) = CType(HttpRuntime.Cache("IncludedCss"),List(Of String))
            If (customCss Is Nothing) Then
                customCss = New List(Of String)()
                Dim cssPath As String = Path.Combine(HttpRuntime.AppDomainAppPath, "css")
                Dim dep As CacheDependency = Nothing
                If Directory.Exists(cssPath) Then
                    dep = New FolderCacheDependency(cssPath, "*.css")
                    Dim ignorePath As String = Path.Combine(cssPath, "_ignore.txt")
                    Dim ignoreRegex As Regex = Nothing
                    If File.Exists(ignorePath) Then
                        ignoreRegex = BuildSearchPathRegex(File.ReadAllLines(ignorePath))
                    End If
                    For Each filePath As String in Directory.EnumerateFiles(cssPath, "*.css", SearchOption.AllDirectories)
                        Dim css As String = Path.GetFileName(filePath)
                        Dim relativePath As String = ("~\" + filePath.Substring(HttpRuntime.AppDomainAppPath.Length))
                        If (AllowTouchUIStylesheet(css) AndAlso ((ignoreRegex Is Nothing) OrElse Not (ignoreRegex.IsMatch(relativePath.Substring(2))))) Then
                            If Not (css.EndsWith(".min.css")) Then
                                customCss.Add(relativePath)
                            Else
                                Dim index As Integer = customCss.IndexOf((css.Substring(0, (css.Length - 7)) + "css"))
                                If (index > -1) Then
                                    customCss(index) = relativePath
                                Else
                                    customCss.Add(relativePath)
                                End If
                            End If
                        End If
                    Next
                End If
                HttpRuntime.Cache.Add("IncludedCss", customCss, dep, Cache.NoAbsoluteExpiration, Cache.NoSlidingExpiration, CacheItemPriority.Default, Nothing)
            End If
            stylesheets.AddRange(customCss)
            Return stylesheets
        End Function
        
        Private Shared Function DoReplaceCssUrl(ByVal m As Match) As String
            Dim header As String = m.Groups("Header").Value
            Dim name As String = m.Groups("Name").Value
            Dim symbol As String = m.Groups("Symbol").Value
            If (((name = "data") OrElse name.StartsWith("http")) AndAlso (symbol = ":")) Then
                Return m.Value
            End If
            If name.StartsWith("../") Then
                name = name.Substring(3)
            End If
            Return (header  _
                        + ("../css/"  _
                        + (name + symbol)))
        End Function
        
        Public Shared Function CombineTouchUIStylesheets(ByVal context As HttpContext) As String
            Dim response As HttpResponse = context.Response
            Dim cache As HttpCachePolicy = response.Cache
            cache.SetCacheability(HttpCacheability.Public)
            cache.VaryByHeaders("User-Agent") = true
            cache.SetOmitVaryStar(true)
            cache.SetExpires(DateTime.Now.AddDays(365))
            cache.SetValidUntilExpires(true)
            cache.SetLastModifiedFromFileDependencies()
            'combine scripts
            Dim contentFramework As String = context.Request.QueryString("_cf")
            Dim includeBootstrap As Boolean = (contentFramework = "bootstrap")
            Dim sb As StringBuilder = New StringBuilder()
            Dim services As ApplicationServices = Create()
            For Each stylesheet As String in services.EnumerateTouchUIStylesheets()
                Dim cssName As String = Path.GetFileName(stylesheet)
                If (includeBootstrap OrElse Not (cssName.StartsWith("bootstrap"))) Then
                    If cssName.StartsWith("touch-theme.") Then
                        sb.AppendLine(services.CompileThemeStylesheet(cssName))
                    Else
                        Dim data As String = File.ReadAllText(HttpContext.Current.Server.MapPath(stylesheet))
                        data = CssUrlRegex.Replace(data, AddressOf DoReplaceCssUrl)
                        If Not (data.Contains("@import url")) Then
                            sb.AppendLine(data)
                        Else
                            sb.Insert(0, data)
                        End If
                    End If
                End If
            Next
            Return sb.ToString()
        End Function
        
        Public Overridable Function CompileThemeStylesheet(ByVal fileName As String) As String
            Dim template As String = String.Empty
            Dim m As Match = ThemeStylesheetRegex.Match(fileName)
            If m.Success Then
                Dim touchPath As String = HttpContext.Current.Server.MapPath("~/css")
                Dim theme As String = Path.Combine(touchPath, "daf", (("touch-theme." + m.Groups("Theme").Value)  _
                                + ".css"))
                Dim accent As String = Path.Combine(touchPath, "themes", (("touch-accent." + m.Groups("Accent").Value)  _
                                + ".json"))
                If File.Exists(theme) Then
                    template = File.ReadAllText(theme)
                    If File.Exists(accent) Then
                        m_AccentJSON = JObject.Parse(File.ReadAllText(accent))
                        m_ThemeVariables = New SortedDictionary(Of String, String)()
                        template = ThemeVariableRegex.Replace(template, AddressOf DoReplaceThemeVariables)
                    End If
                End If
            End If
            Return template
        End Function
        
        Protected Function DoReplaceThemeVariables(ByVal m As Match) As String
            Dim variable As String = m.Groups("Name").Value
            Dim before As String = m.Groups("Before").Value
            Dim after As String = m.Groups("After").Value
            Dim parts() As String = variable.Split(Global.Microsoft.VisualBasic.ChrW(44))
            Dim value As String = Nothing
            For Each part As String in parts
                If TryGetThemeVariable(part.Trim().Substring(1), value) Then
                    Exit For
                End If
            Next
            If String.IsNullOrEmpty(value) Then
                value = m.Groups("Value").Value
            End If
            If EnableMinifiedCss Then
                Return ((before + value)  _
                            + after)
            Else
                Return ((before  _
                            + (" /*" + variable))  _
                            + (("*/ " + value)  _
                            + after))
            End If
        End Function
        
        Protected Function TryGetThemeVariable(ByVal name As String, ByRef value As String) As Boolean
            If Not (m_ThemeVariables.TryGetValue(name, value)) Then
                Dim token As JToken = TryGetJsonProperty(m_AccentJSON, name)
                If ((Not (token) Is Nothing) AndAlso Not ((token.Type = JTokenType.Null))) Then
                    value = CType(token,String)
                    m_ThemeVariables(name) = value
                End If
            End If
            Return Not (String.IsNullOrEmpty(value))
        End Function
        
        Public Overridable Sub ConfigureScripts(ByVal scripts As List(Of ScriptReference))
            Dim jsPath As String = Path.Combine(HttpRuntime.AppDomainAppPath, "js")
            Dim includedScripts As List(Of String) = CType(HttpRuntime.Cache("IncludedScripts"),List(Of String))
            If (includedScripts Is Nothing) Then
                includedScripts = New List(Of String)()
                Dim dep As CacheDependency = Nothing
                If Directory.Exists(jsPath) Then
                    dep = New FolderCacheDependency(jsPath, "*.js")
                    Dim ignorePath As String = Path.Combine(jsPath, "_ignore.txt")
                    Dim ignoreRegex As Regex = Nothing
                    If File.Exists(ignorePath) Then
                        ignoreRegex = BuildSearchPathRegex(File.ReadAllLines(ignorePath))
                    End If
                    For Each file As String in Directory.EnumerateFiles(jsPath, "*.js", SearchOption.AllDirectories)
                        Dim relativeFile As String = file.Substring((jsPath.Length + 1))
                        If (((ignoreRegex Is Nothing) OrElse Not (ignoreRegex.IsMatch(relativeFile))) AndAlso Not (DefaultExcludeScriptRegex.IsMatch(relativeFile))) Then
                            includedScripts.Add(("~/" + file.Substring(HttpRuntime.AppDomainAppPath.Length).Replace("\", "/")))
                        End If
                    Next
                    Dim i As Integer = 0
                    Do While (i < includedScripts.Count)
                        Dim scriptName As String = includedScripts(i)
                        If scriptName.EndsWith(".min.js") Then
                            If AquariumExtenderBase.EnableMinifiedScript Then
                                scriptName = (scriptName.Substring(0, (scriptName.Length - 7)) + ".js")
                            End If
                            includedScripts.Remove(scriptName)
                        Else
                            i = (i + 1)
                        End If
                    Loop
                End If
                HttpRuntime.Cache.Add("IncludedScripts", includedScripts, dep, Cache.NoAbsoluteExpiration, Cache.NoSlidingExpiration, CacheItemPriority.Default, Nothing)
            End If
            For Each file As String in includedScripts
                scripts.Add(AquariumExtenderBase.CreateScriptReference(file))
            Next
        End Sub
        
        Function BuildSearchPathRegex(ByVal paths() As String) As Regex
            If (paths.Length = 0) Then
                Return Nothing
            End If
            Dim sb As StringBuilder = New StringBuilder()
            For Each path As String in paths
                If Not ((sb.Length = 0)) Then
                    sb.Append("|")
                End If
                sb.AppendFormat("({0})", Regex.Escape(path.Trim().Replace("/", "\")).Replace("\*", ".*"))
            Next
            Return New Regex(sb.ToString())
        End Function
        
        Public Shared Sub CompressOutput(ByVal context As HttpContext, ByVal data As String)
            Dim request As HttpRequest = context.Request
            Dim response As HttpResponse = context.Response
            Dim acceptEncoding As String = request.Headers("Accept-Encoding")
            If Not (String.IsNullOrEmpty(acceptEncoding)) Then
                If acceptEncoding.Contains("gzip") Then
                    response.Filter = New GZipStream(response.Filter, CompressionMode.Compress)
                    response.AppendHeader("Content-Encoding", "gzip")
                Else
                    If acceptEncoding.Contains("deflate") Then
                        response.Filter = New DeflateStream(response.Filter, CompressionMode.Compress)
                        response.AppendHeader("Content-Encoding", "deflate")
                    End If
                End If
            End If
            Dim output() As Byte = Encoding.UTF8.GetBytes(data)
            response.ContentEncoding = Encoding.Unicode
            response.AddHeader("Content-Length", output.Length.ToString())
            response.OutputStream.Write(output, 0, output.Length)
            Try 
                response.Flush()
            Catch __exception As Exception
            End Try
        End Sub
        
        Public Shared Sub HandleServiceRequest(ByVal context As HttpContext)
            Dim methodName As String = context.Request.AppRelativeCurrentExecutionFilePath.ToLowerInvariant()
            If methodName.StartsWith(AquariumExtenderBase.DefaultServicePath) Then
                methodName = methodName.Substring((AquariumExtenderBase.DefaultServicePath.Length + 1))
            Else
                If methodName.StartsWith(AquariumExtenderBase.AppServicePath) Then
                    methodName = methodName.Substring((AquariumExtenderBase.AppServicePath.Length + 1))
                End If
            End If
            If String.IsNullOrEmpty(methodName) Then
                Throw New HttpException(400, "Method not specified.")
            End If
            Dim handler As ServiceRequestHandler = Nothing
            If RequestHandlers.TryGetValue(methodName.ToLower(), handler) Then
                Dim args As JObject = RequestValidationService.ToJson(context)
                Dim result As Object = Nothing
                If ((Not (handler.AllowedMethods) Is Nothing) AndAlso Not (handler.AllowedMethods.Contains(context.Request.HttpMethod))) Then
                    Throw New HttpException(405, "This HTTP Method is not allowed.")
                End If
                If (handler.RequiresAuthentication AndAlso Not (context.Request.IsAuthenticated)) Then
                    Throw New HttpException(403, "Requires authentication.")
                End If
                Try 
                    result = handler.HandleRequest(New DataControllerService(), args)
                Catch rex As ServiceRequestRedirectException
                    result = New JObject()
                    CType(result,JObject)("RedirectUrl") = rex.RedirectUrl
                Catch ex As Exception
                    result = handler.HandleException(args, ex)
                End Try
                If (Not (result) Is Nothing) Then
                    context.Response.ContentType = "application/json; charset=utf-8"
                    Dim output As String = String.Format("{{""d"":{0}}}", JsonConvert.SerializeObject(result))
                    ApplicationServices.CompressOutput(context, CompressViewPageJsonOutput(output))
                End If
            Else
                Throw New HttpException(404, "Method not found.")
            End If
            context.Response.End()
        End Sub
        
        Public Shared Function CompressViewPageJsonOutput(ByVal output As String) As String
            Dim startIndex As Integer = 0
            Dim dataIndex As Integer = 0
            Dim lastIndex As Integer = 0
            Dim lastLength As Integer = output.Length
            Do While true
                startIndex = output.IndexOf("{""Controller"":", lastIndex, StringComparison.Ordinal)
                dataIndex = output.IndexOf(",""NewRow"":", lastIndex, StringComparison.Ordinal)
                If ((startIndex < 0) OrElse (dataIndex < 0)) Then
                    Exit Do
                End If
                Dim metadata As String = (output.Substring(0, startIndex) + ViewPageCompressRegex.Replace(output.Substring(startIndex, (dataIndex - startIndex)), String.Empty))
                If metadata.EndsWith(",") Then
                    metadata = metadata.Substring(0, (metadata.Length - 1))
                End If
                output = (ViewPageCompress2Regex.Replace(metadata, "}$1") + output.Substring(dataIndex))
                lastIndex = ((dataIndex + 10)  _
                            - (lastLength - output.Length))
                lastLength = output.Length
            Loop
            Return output
        End Function
        
        Public Shared Function ResolveClientUrl(ByVal relativeUrl As String) As String
            Dim request As HttpRequest = HttpContext.Current.Request
            Dim root As String = (request.Url.Scheme  _
                        + (Uri.SchemeDelimiter + request.Url.Host))
            If Not (request.Url.IsDefaultPort) Then
                root = (root  _
                            + (":" + Convert.ToString(request.Url.Port)))
            End If
            If relativeUrl.StartsWith("~/") Then
                relativeUrl = relativeUrl.Substring(2)
            Else
                If relativeUrl.StartsWith("/") Then
                    relativeUrl = relativeUrl.Substring(1)
                Else
                    relativeUrl = (request.Url.AbsolutePath  _
                                + ("/" + relativeUrl))
                End If
            End If
            Dim appPath As String = request.ApplicationPath
            If Not (appPath.EndsWith("/")) Then
                appPath = (appPath + "/")
            End If
            Dim result As String = ((root + appPath)  _
                        + relativeUrl)
            If String.IsNullOrEmpty(relativeUrl) Then
                result = result.Substring(0, (result.Length - 1))
            End If
            Return result
        End Function
        
        Public Overridable Function CorsConfiguration(ByVal request As HttpRequest) As SortedDictionary(Of String, String)
            Return Nothing
        End Function
        
        Private Shared Sub EnsureJsonProperty(ByVal ptr As JObject, ByVal path As String, ByVal defaultValue As Object)
            If (defaultValue Is Nothing) Then
                defaultValue = String.Empty
            End If
            Dim parts() As String = path.Split(Global.Microsoft.VisualBasic.ChrW(46))
            Dim counter As Integer = parts.Length
            For Each part As String in parts
                counter = (counter - 1)
                If (ptr(part) Is Nothing) Then
                    If Not ((counter = 0)) Then
                        ptr(part) = New JObject()
                    Else
                        ptr(part) = JToken.FromObject(defaultValue)
                    End If
                End If
                If Not ((counter = 0)) Then
                    ptr = CType(ptr(part),JObject)
                End If
            Next
        End Sub
        
        Public Shared Function TryGetJsonProperty(ByVal ptr As JObject, ByVal path As String) As JToken
            Dim parts() As String = path.Split(Global.Microsoft.VisualBasic.ChrW(46))
            Dim temp As JToken = Nothing
            Dim i As Integer = 0
            Do While (i < (parts.Length - 1))
                temp = ptr(parts(i))
                If (Not (temp) Is Nothing) Then
                    ptr = CType(temp,JObject)
                Else
                    Return Nothing
                End If
                i = (i + 1)
            Loop
            Return ptr(parts((parts.Length - 1)))
        End Function
    End Class
    
    Public Class AnonymousUserIdentity
        Inherits Object
        Implements IIdentity
        
        ReadOnly Property IIdentity_AuthenticationType() As String Implements IIdentity.AuthenticationType
            Get
                Return "None"
            End Get
        End Property
        
        ReadOnly Property IIdentity_IsAuthenticated() As Boolean Implements IIdentity.IsAuthenticated
            Get
                Return false
            End Get
        End Property
        
        ReadOnly Property IIdentity_Name() As String Implements IIdentity.Name
            Get
                Return String.Empty
            End Get
        End Property
    End Class
    
    Partial Public Class ApplicationSiteMapProvider
        Inherits ApplicationSiteMapProviderBase
    End Class
    
    Public Class ApplicationSiteMapProviderBase
        Inherits System.Web.XmlSiteMapProvider
        
        Public Overrides Function IsAccessibleToUser(ByVal context As HttpContext, ByVal node As SiteMapNode) As Boolean
            Dim device As String = node("Device")
            Dim isTouchUI As Boolean = ApplicationServices.IsTouchClient
            If ((device = "touch") AndAlso Not (isTouchUI)) Then
                Return false
            End If
            If ((device = "desktop") AndAlso isTouchUI) Then
                Return false
            End If
            Return MyBase.IsAccessibleToUser(context, node)
        End Function
    End Class
    
    Partial Public Class ApplicationSessionState
        Inherits ApplicationSessionStateBase
    End Class
    
    Public Class ApplicationSessionStateBase
        Inherits SessionStateStoreProviderBase
        
        Public Shared Current As ApplicationSessionStateBase
        
        Private m_Config As SessionStateSection = Nothing
        
        Private m_ConnectionStringName As String
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_ApplicationName As String
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_WriteExceptionsToEventLog As Boolean
        
        Public Overridable Property ApplicationName() As String
            Get
                Return Me.m_ApplicationName
            End Get
            Set
                Me.m_ApplicationName = value
            End Set
        End Property
        
        Public Overridable Property WriteExceptionsToEventLog() As Boolean
            Get
                Return Me.m_WriteExceptionsToEventLog
            End Get
            Set
                Me.m_WriteExceptionsToEventLog = value
            End Set
        End Property
        
        Public Overridable Sub DeleteExpiredSessions()
            Using cmd As SqlText = CreateSqlText("DELETE FROM aspnet_Sessions WHERE Expires < @Expires")
                cmd.AddParameter("Expires", DateTime.Now)
                cmd.ExecuteNonQuery()
            End Using
        End Sub
        
        Public Overrides Sub Initialize(ByVal name As String, ByVal config As NameValueCollection)
            If (config Is Nothing) Then
                Throw New ArgumentNullException("config")
            End If
            If String.IsNullOrEmpty(name) Then
                name = "ApplicationSessionState"
            End If
            If String.IsNullOrEmpty(config("description")) Then
                config.Remove("description")
                config.Add("description", "Custom Session State Store Provider")
            End If
            MyBase.Initialize(name, config)
            m_ApplicationName = System.Web.Hosting.HostingEnvironment.ApplicationVirtualPath
            Dim cfg As System.Configuration.Configuration = WebConfigurationManager.OpenWebConfiguration(ApplicationName)
            m_Config = CType(cfg.GetSection("system.web/sessionState"),SessionStateSection)
            Dim settings As ConnectionStringSettings = ConfigurationManager.ConnectionStrings(config("connectionStringName"))
            If (Not (settings) Is Nothing) Then
                m_ConnectionStringName = settings.Name
            End If
            m_WriteExceptionsToEventLog = false
            If (Not (config("writeExceptionsToEventLog")) Is Nothing) Then
                If (config("writeExceptionsToEventLog").ToUpper() = "TRUE") Then
                    m_WriteExceptionsToEventLog = true
                End If
            End If
            Current = Me
        End Sub
        
        Public Overrides Sub Dispose()
        End Sub
        
        Public Overrides Function SetItemExpireCallback(ByVal expireCallback As SessionStateItemExpireCallback) As Boolean
            Return false
        End Function
        
        Public Overrides Sub SetAndReleaseItemExclusive(ByVal context As HttpContext, ByVal id As String, ByVal item As SessionStateStoreData, ByVal lockId As Object, ByVal newItem As Boolean)
            Dim sessItems() As Byte = Serialize(CType(item.Items,SessionStateItemCollection))
            If newItem Then
                DeleteExpiredSessions()
                Using cmd As SqlText = CreateSqlText("INSERT INTO aspnet_Sessions (SessionId, ApplicationName, Created, Expires, LockDa"& _ 
                        "te, LockId, Timeout, Locked, SessionItems, Flags) Values(@SessionId, @Applicatio"& _ 
                        "nName, @Created, @Expires, @LockDate, @LockId , @Timeout, @Locked, @SessionItems"& _ 
                        ", @Flags)")
                    cmd.AddParameter("SessionId", id)
                    cmd.AddParameter("Expires", DateTime.Now.AddMinutes(CType(item.Timeout,Double)))
                    cmd.AddParameter("Created", DateTime.Now)
                    cmd.AddParameter("LockDate", DateTime.Now)
                    cmd.AddParameter("LockId", 0)
                    cmd.AddParameter("Timeout", item.Timeout)
                    cmd.AddParameter("Locked", 0)
                    cmd.AddParameter("SessionItems", sessItems)
                    cmd.AddParameter("Flags", 0)
                    cmd.ExecuteNonQuery()
                End Using
            Else
                Using cmd As SqlText = CreateSqlText("UPDATE aspnet_Sessions SET Expires = @Expires, SessionItems = @SessionItems, Lock"& _ 
                        "ed = @Locked WHERE SessionId = @SessionId AND ApplicationName = @ApplicationName"& _ 
                        " AND LockId = @LockId")
                    cmd.AddParameter("SessionId", id)
                    cmd.AddParameter("Expires", DateTime.Now.AddMinutes(CType(item.Timeout,Double)))
                    cmd.AddParameter("SessionItems", sessItems)
                    cmd.AddParameter("Locked", 0)
                    cmd.AddParameter("LockId", lockId)
                    cmd.ExecuteNonQuery()
                End Using
            End If
        End Sub
        
        Public Overrides Function GetItem(ByVal context As HttpContext, ByVal id As String, ByRef locked As Boolean, ByRef lockAge As TimeSpan, ByRef lockId As Object, ByRef actionFlags As SessionStateActions) As SessionStateStoreData
            Return GetSessionStoreItem(false, context, id, locked, lockAge, lockId, actionFlags)
        End Function
        
        Public Overrides Function GetItemExclusive(ByVal context As HttpContext, ByVal id As String, ByRef locked As Boolean, ByRef lockAge As TimeSpan, ByRef lockId As Object, ByRef actionFlags As SessionStateActions) As SessionStateStoreData
            Return GetSessionStoreItem(true, context, id, locked, lockAge, lockId, actionFlags)
        End Function
        
        Private Function GetSessionStoreItem(ByVal lockRecord As Boolean, ByVal context As HttpContext, ByVal id As String, ByRef locked As Boolean, ByRef lockAge As TimeSpan, ByRef lockId As Object, ByRef actionFlags As SessionStateActions) As SessionStateStoreData
            Dim item As SessionStateStoreData = Nothing
            lockAge = TimeSpan.Zero
            lockId = Nothing
            locked = false
            actionFlags = 0
            Dim reader As DbDataReader = Nothing
            Dim expires As DateTime
            Dim serializedItems() As Byte = Nothing
            Dim foundRecord As Boolean = false
            Dim deleteData As Boolean = false
            Dim timeout As Integer = 0
            Try 
                'Obtain a lock if possible. Ignore the record if it is expired.
                If lockRecord Then
                    Using cmd As SqlText = CreateSqlText("UPDATE aspnet_Sessions SET Locked = @LockedTrue, LockDate = @LockDate WHERE Sessi"& _ 
                            "onId = @SessionId AND ApplicationName = @ApplicationName AND Locked = @LockedFal"& _ 
                            "se AND Expires > @Expires")
                        cmd.AddParameter("LockedTrue", 1)
                        cmd.AddParameter("LockDate", DateTime.Now)
                        cmd.AddParameter("SessionId", id)
                        cmd.AddParameter("LockedFalse", 0)
                        cmd.AddParameter("Expires", DateTime.Now)
                        If (cmd.ExecuteNonQuery() = 0) Then
                            'No record was updated because the record was locked or not found.
                            locked = true
                        Else
                            'The record was updated.
                            locked = false
                        End If
                    End Using
                End If
                'Retrieve the current session item information.
                Using cmd As SqlText = CreateSqlText("SELECT Expires, SessionItems, LockId, LockDate, Flags, Timeout FROM aspnet_Sessio"& _ 
                        "ns WHERE SessionId = @SessionId AND ApplicationName = @ApplicationName")
                    cmd.AddParameter("SessionId", id)
                    'Retrieve session item data from the data source.
                    reader = cmd.ExecuteReader()
                    Do While cmd.Read()
                        expires = reader.GetDateTime(0)
                        If (expires < DateTime.Now) Then
                            'The record was expired. Mark it as not locked.
                            locked = false
                            'The session was expired. Mark the data for deletion.
                            deleteData = true
                        Else
                            foundRecord = true
                        End If
                        If (reader(1) Is DBNull.Value) Then
                            serializedItems = New Byte((0) - 1) {}
                        Else
                            serializedItems = CType(reader(1),Byte())
                        End If
                        lockId = reader.GetInt32(2)
                        lockAge = DateTime.Now.Subtract(reader.GetDateTime(3))
                        actionFlags = CType(reader.GetInt32(4),SessionStateActions)
                        timeout = reader.GetInt32(5)
                    Loop
                    reader.Close()
                End Using
                'If the return session item is expired, delete the record from the data source.
                If deleteData Then
                    Using cmd As SqlText = CreateSqlText("DELETE FROM aspnet_Sessions WHERE SessionId = @SessionId AND ApplicationName = @A"& _ 
                            "pplicationName")
                        cmd.AddParameter("SessionId", id)
                        cmd.ExecuteNonQuery()
                    End Using
                End If
                'The record was not found. Ensure that locked is false.
                If Not (foundRecord) Then
                    locked = false
                End If
                '
                '                        If the record was found and you obtain a lock, then set
                '                        the lockId, clear the actionFlags, and create the SessionStateSToreItem to return.
                '                      
                If (foundRecord AndAlso Not (locked)) Then
                    lockId = (CType(lockId,Integer) + 1)
                    Using cmd As SqlText = CreateSqlText("UPDATE aspnet_Sessions SET LockId = @LockId, Flags = 0 WHERE SessionId = @Session"& _ 
                            "Id AND ApplicationName = @ApplicationName")
                        cmd.AddParameter("lockId", lockId)
                        cmd.AddParameter("SessionId", id)
                        cmd.ExecuteNonQuery()
                    End Using
                    '
                    '                            If the actionFlags parameter is not InitializeItem
                    '                            deserialize the stored SessionStateItemCollection.
                    '                          
                    If (actionFlags = SessionStateActions.InitializeItem) Then
                        item = CreateNewStoreData(context, Convert.ToInt32(m_Config.Timeout.TotalMinutes))
                    Else
                        item = Deserialize(context, serializedItems, timeout)
                    End If
                End If
            Finally
                If (Not (reader) Is Nothing) Then
                    reader.Close()
                End If
            End Try
            Return item
        End Function
        
        Private Function Serialize(ByVal items As SessionStateItemCollection) As Byte()
            Dim ms As MemoryStream = New MemoryStream()
            Dim writer As BinaryWriter = New BinaryWriter(ms)
            If (Not (items) Is Nothing) Then
                items.Serialize(writer)
            End If
            writer.Close()
            Return ms.ToArray()
        End Function
        
        Private Function Deserialize(ByVal context As HttpContext, ByVal serializedItems() As Byte, ByVal timeout As Integer) As SessionStateStoreData
            Dim ms As MemoryStream = New MemoryStream(serializedItems)
            Dim sessionItems As SessionStateItemCollection = New SessionStateItemCollection()
            If (ms.Length > 0) Then
                Dim reader As BinaryReader = New BinaryReader(ms)
                sessionItems = SessionStateItemCollection.Deserialize(reader)
            End If
            Return New SessionStateStoreData(sessionItems, SessionStateUtility.GetSessionStaticObjects(context), timeout)
        End Function
        
        Public Function CreateSqlText(ByVal sql As String) As SqlText
            Dim cmd As SqlText = New SqlText(sql, m_ConnectionStringName)
            cmd.Command.CommandText = cmd.Command.CommandText.Replace("@", cmd.ParameterMarker)
            If cmd.Command.CommandText.Contains((cmd.ParameterMarker + "ApplicationName")) Then
                cmd.AssignParameter("ApplicationName", ApplicationName)
            End If
            cmd.Name = "MyCompany Session State Provider"
            cmd.WriteExceptionsToEventLog = m_WriteExceptionsToEventLog
            Return cmd
        End Function
        
        Public Overrides Sub ReleaseItemExclusive(ByVal context As HttpContext, ByVal id As String, ByVal lockId As Object)
            Using cmd As SqlText = CreateSqlText("UPDATE aspnet_Sessions SET Locked = 0, Expires = @Expires WHERE SessionId = @Sess"& _ 
                    "ionId AND ApplicationName = @ApplicationName AND LockId = @LockId")
                cmd.AddParameter("Expires", DateTime.Now.AddMinutes(m_Config.Timeout.TotalMinutes))
                cmd.AddParameter("SessionId", id)
                cmd.AddParameter("LockId", lockId)
                cmd.ExecuteNonQuery()
            End Using
        End Sub
        
        Public Overrides Sub RemoveItem(ByVal context As HttpContext, ByVal id As String, ByVal lockId As Object, ByVal item As SessionStateStoreData)
            Using cmd As SqlText = CreateSqlText("DELETE FROM aspnet_Sessions WHERE SessionId = @SessionId AND ApplicationName = @A"& _ 
                    "pplicationName AND LockId = @LockId")
                cmd.AddParameter("SessionId", id)
                cmd.AddParameter("LockId", lockId)
                cmd.ExecuteNonQuery()
            End Using
        End Sub
        
        Public Overrides Sub CreateUninitializedItem(ByVal context As HttpContext, ByVal id As String, ByVal timeout As Integer)
            Using cmd As SqlText = CreateSqlText("INSERT INTO aspnet_Sessions (SessionId, ApplicationName, Created, Expires, LockDa"& _ 
                    "te, LockId, Timeout, Locked, Flags) Values(@SessionId, @ApplicationName, @Create"& _ 
                    "d, @Expires, @LockDate, @LockId, @Timeout, @Locked, @Flags)")
                cmd.AddParameter("SessionId", id)
                cmd.AddParameter("Created", DateTime.Now)
                cmd.AddParameter("Expires", DateTime.Now.AddMinutes(CType(timeout,Double)))
                cmd.AddParameter("LockDate", DateTime.Now)
                cmd.AddParameter("LockId", 0)
                cmd.AddParameter("Timeout", timeout)
                cmd.AddParameter("Locked", 0)
                cmd.AddParameter("Flags", 1)
                cmd.ExecuteNonQuery()
            End Using
        End Sub
        
        Public Overrides Function CreateNewStoreData(ByVal context As HttpContext, ByVal timeout As Integer) As SessionStateStoreData
            Return New SessionStateStoreData(New SessionStateItemCollection(), SessionStateUtility.GetSessionStaticObjects(context), timeout)
        End Function
        
        Public Overrides Sub ResetItemTimeout(ByVal context As HttpContext, ByVal id As String)
            Using cmd As SqlText = CreateSqlText("UPDATE aspnet_Sessions SET Expires = @Expires WHERE SessionId = @SessionId AND Ap"& _ 
                    "plicationName = @ApplicationName")
                cmd.AddParameter("Expires", DateTime.Now.AddMinutes(m_Config.Timeout.TotalMinutes))
                cmd.AddParameter("SessionId", id)
                cmd.ExecuteNonQuery()
            End Using
        End Sub
        
        Public Overrides Sub InitializeRequest(ByVal context As HttpContext)
        End Sub
        
        Public Overrides Sub EndRequest(ByVal context As HttpContext)
        End Sub
    End Class
    
    Partial Public Class PlaceholderHandler
        Inherits PlaceholderHandlerBase
    End Class
    
    Public Class PlaceholderHandlerBase
        Inherits Object
        Implements IHttpHandler
        
        Private Shared m_ImageSizeRegex As Regex = New Regex("((?'background'[a-zA-Z0-9]+?)-((?'textcolor'[a-zA-Z0-9]+?)-)?)?(?'width'[0-9]+?)("& _ 
                "x(?'height'[0-9]*))?\.[a-zA-Z][a-zA-Z][a-zA-Z]")
        
        Overridable ReadOnly Property IHttpHandler_IsReusable() As Boolean Implements IHttpHandler.IsReusable
            Get
                Return true
            End Get
        End Property
        
        Overridable Sub IHttpHandler_ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
            'Get file name
            Dim routeValues As RouteValueDictionary = context.Request.RequestContext.RouteData.Values
            Dim fileName As String = CType(routeValues("FileName"),String)
            'Get extension
            Dim ext As String = Path.GetExtension(fileName)
            Dim format As ImageFormat = ImageFormat.Png
            Dim contentType As String = "image/png"
            If (ext = ".jpg") Then
                format = ImageFormat.Jpeg
                contentType = "image/jpg"
            Else
                If (ext = ".gif") Then
                    format = ImageFormat.Gif
                    contentType = "image/jpg"
                End If
            End If
            'get width and height
            Dim regexMatch As Match = m_ImageSizeRegex.Matches(fileName)(0)
            Dim widthCapture As Capture = regexMatch.Groups("width")
            Dim width As Integer = 500
            If Not ((widthCapture.Length = 0)) Then
                width = Convert.ToInt32(widthCapture.Value)
            End If
            If (width = 0) Then
                width = 500
            End If
            If (width > 4096) Then
                width = 4096
            End If
            Dim heightCapture As Capture = regexMatch.Groups("height")
            Dim height As Integer = width
            If Not ((heightCapture.Length = 0)) Then
                height = Convert.ToInt32(heightCapture.Value)
            End If
            If (height = 0) Then
                height = 500
            End If
            If (height > 4096) Then
                height = 4096
            End If
            'Get background and text colors
            Dim background As Color = GetColor(regexMatch.Groups("background"), Color.LightGray)
            Dim textColor As Color = GetColor(regexMatch.Groups("textcolor"), Color.Black)
            Dim fontSize As Integer = ((width + height)  _
                        / 50)
            If (fontSize < 10) Then
                fontSize = 10
            End If
            Dim font As Font = New Font(FontFamily.GenericSansSerif, fontSize)
            'Get text
            Dim text As String = context.Request.QueryString("text")
            If String.IsNullOrEmpty(text) Then
                text = String.Format("{0} x {1}", width, height)
            End If
            'Get position for text
            Dim textSize As SizeF
            Using img As Image = New Bitmap(1, 1)
                Dim textDrawing As Graphics = Graphics.FromImage(img)
                textSize = textDrawing.MeasureString(text, font)
            End Using
            'Draw the image
            Using image As Image = New Bitmap(width, height)
                Dim drawing As Graphics = Graphics.FromImage(image)
                drawing.Clear(background)
                Using textBrush As Brush = New SolidBrush(textColor)
                    drawing.DrawString(text, font, textBrush, ((width - textSize.Width)  _
                                    / 2), ((height - textSize.Height)  _
                                    / 2))
                End Using
                drawing.Save()
                drawing.Dispose()
                'Return image
                Using stream As MemoryStream = New MemoryStream()
                    image.Save(stream, format)
                    Dim cache As HttpCachePolicy = context.Response.Cache
                    cache.SetCacheability(HttpCacheability.Public)
                    cache.SetOmitVaryStar(true)
                    cache.SetExpires(DateTime.Now.AddDays(365))
                    cache.SetValidUntilExpires(true)
                    cache.SetLastModifiedFromFileDependencies()
                    context.Response.ContentType = contentType
                    context.Response.AddHeader("Content-Length", Convert.ToString(stream.Length))
                    context.Response.AddHeader("File-Name", fileName)
                    context.Response.BinaryWrite(stream.ToArray())
                    context.Response.OutputStream.Flush()
                End Using
            End Using
        End Sub
        
        Private Shared Function GetColor(ByVal colorName As Capture, ByVal defaultColor As Color) As Color
            Try 
                If (colorName.Length > 0) Then
                    Dim s As String = colorName.Value
                    If Regex.IsMatch(s, "^[0-9abcdef]{3,6}$") Then
                        s = ("#" + s)
                    End If
                    Return ColorTranslator.FromHtml(s)
                End If
            Catch __exception As Exception
            End Try
            Return defaultColor
        End Function
    End Class
    
    Public Class GenericRoute
        Inherits Object
        Implements IRouteHandler
        
        Private m_Handler As IHttpHandler
        
        Public Sub New(ByVal handler As IHttpHandler)
            MyBase.New
            m_Handler = handler
        End Sub
        
        Function IRouteHandler_GetHttpHandler(ByVal context As RequestContext) As IHttpHandler Implements IRouteHandler.GetHttpHandler
            Return m_Handler
        End Function
        
        Public Shared Sub Map(ByVal routes As RouteCollection, ByVal handler As IHttpHandler, ByVal url As String)
            Dim r As Route = New Route(url, New GenericRoute(handler))
            r.Defaults = New RouteValueDictionary()
            r.Constraints = New RouteValueDictionary()
            routes.Add(r)
        End Sub
    End Class
    
    Public Class SaasConfiguration
        
        Private m_Config As String
        
        Private m_ClientId As String
        
        Private m_ClientSecret As String
        
        Private m_RedirectUri As String
        
        Private m_AccessToken As String
        
        Private m_RefreshToken As String
        
        Public Sub New(ByVal config As String)
            MyBase.New
            m_Config = ((""&Global.Microsoft.VisualBasic.ChrW(10) + config)  _
                        + ""&Global.Microsoft.VisualBasic.ChrW(10))
        End Sub
        
        Public Overridable ReadOnly Property ClientId() As String
            Get
                If String.IsNullOrEmpty(m_ClientId) Then
                    m_ClientId = Me("Client Id")
                End If
                Return m_ClientId
            End Get
        End Property
        
        Public Overridable ReadOnly Property ClientSecret() As String
            Get
                If String.IsNullOrEmpty(m_ClientSecret) Then
                    m_ClientSecret = Me("Client Secret")
                End If
                Return m_ClientSecret
            End Get
        End Property
        
        Public Overridable ReadOnly Property RedirectUri() As String
            Get
                If (HttpContext.Current.Request.IsLocal AndAlso String.IsNullOrEmpty(m_RedirectUri)) Then
                    m_RedirectUri = Me("Local Redirect Uri")
                End If
                If String.IsNullOrEmpty(m_RedirectUri) Then
                    m_RedirectUri = Me("Redirect Uri")
                End If
                Return m_RedirectUri
            End Get
        End Property
        
        Public Overridable Property AccessToken() As String
            Get
                If String.IsNullOrEmpty(m_AccessToken) Then
                    m_AccessToken = Me("Access Token")
                End If
                Return m_AccessToken
            End Get
            Set
                m_AccessToken = value
                Me("Access Token") = value
            End Set
        End Property
        
        Public Overridable Property RefreshToken() As String
            Get
                If String.IsNullOrEmpty(m_RefreshToken) Then
                    m_RefreshToken = Me("Refresh Token")
                End If
                Return m_RefreshToken
            End Get
            Set
                m_RefreshToken = value
                Me("Refresh Token") = value
            End Set
        End Property
        
        Public Overridable Default Property Item(ByVal [property] As String) As String
            Get
                If String.IsNullOrEmpty(m_Config) Then
                    Return String.Empty
                End If
                Dim m As Match = Regex.Match(m_Config, (("\n(" + [property])  _
                                + ")\:\s*?\n?(?'Value'[^\s\n].+?)\n"), RegexOptions.IgnoreCase)
                If m.Success Then
                    Return m.Groups("Value").Value.Trim()
                End If
                Return String.Empty
            End Get
            Set
                If Not (String.IsNullOrEmpty(m_Config)) Then
                    Dim oldValue As String = Me([property])
                    If Not (String.IsNullOrEmpty(oldValue)) Then
                        m_Config = m_Config.Replace(oldValue, value)
                    Else
                        m_Config = (m_Config  _
                                    + ((Environment.NewLine + [property])  _
                                    + (": " + value)))
                    End If
                End If
            End Set
        End Property
        
        Public Overrides Function ToString() As String
            Return m_Config
        End Function
    End Class
    
    Public MustInherit Class OAuthHandler
        
        Public StartPage As String
        
        Private m_RefreshedToken As Boolean = false
        
        Private m_ClientUri As String
        
        Private m_Config As SaasConfiguration = Nothing
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_Tokens() As String
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_StoreToken As Boolean
        
        Public Overridable ReadOnly Property ClientUri() As String
            Get
                If (String.IsNullOrEmpty(m_ClientUri) AndAlso ApplicationServices.IsSiteContentEnabled) Then
                    m_ClientUri = Config("Client Uri")
                    If Not (m_ClientUri.StartsWith("http")) Then
                        m_ClientUri = ("https://" + m_ClientUri)
                    End If
                End If
                Return m_ClientUri
            End Get
        End Property
        
        Protected Overridable ReadOnly Property Config() As SaasConfiguration
            Get
                Return m_Config
            End Get
        End Property
        
        Protected Overridable Property Tokens() As String()
            Get
                Return Me.m_Tokens
            End Get
            Set
                Me.m_Tokens = value
            End Set
        End Property
        
        Protected Overridable Property StoreToken() As Boolean
            Get
                Return Me.m_StoreToken
            End Get
            Set
                Me.m_StoreToken = value
            End Set
        End Property
        
        Protected Overridable ReadOnly Property Scope() As String
            Get
                Return String.Empty
            End Get
        End Property
        
        Public Overridable Sub ProcessRequest(ByVal context As HttpContext)
            Try 
                Dim services As ApplicationServices = ApplicationServices.Create()
                StartPage = context.Request.QueryString("start")
                If String.IsNullOrEmpty(StartPage) Then
                    StartPage = services.UserHomePageUrl()
                End If
                Dim state As String = context.Request.QueryString("state")
                If Not (String.IsNullOrEmpty(state)) Then
                    SetState(state)
                End If
                RestoreSession(context)
                If (Config Is Nothing) Then
                    Throw New Exception("Provider not found.")
                Else
                    Dim code As String = GetAuthCode(context.Request)
                    If String.IsNullOrEmpty(code) Then
                        Dim [error] As String = context.Request.QueryString("error")
                        If Not (String.IsNullOrEmpty([error])) Then
                            Throw New Exception([error])
                        Else
                            RequestAuthorizationCode()
                        End If
                    Else
                        Tokens = GetAccessTokens(code, false)
                        If (Tokens Is Nothing) Then
                            context.Response.StatusCode = 401
                        Else
                            If StoreToken Then
                                StoreTokens(Tokens)
                            Else
                                Dim user As MembershipUser = SyncUser()
                                If (user Is Nothing) Then
                                    Throw New Exception("No user found.")
                                End If
                                SetSession(context, user)
                            End If
                            RedirectToStartPage(context)
                        End If
                    End If
                End If
            Catch ex As Exception
                HandleException(context, ex)
            End Try
        End Sub
        
        Public Overridable Sub SetSession(ByVal context As HttpContext, ByVal user As MembershipUser)
            Dim services As ApplicationServices = ApplicationServices.Current
            'logout current user
            Dim auth As HttpCookie = context.Request.Cookies(FormsAuthentication.FormsCookieName)
            If (Not (auth) Is Nothing) Then
                Dim oldTicket As FormsAuthenticationTicket = FormsAuthentication.Decrypt(auth.Value)
                If Not ((oldTicket.Name = user.UserName)) Then
                    services.UserLogout()
                End If
            End If
            Dim ticket As FormsAuthenticationTicket = New FormsAuthenticationTicket(0, user.UserName, DateTime.Now, DateTime.Now.AddHours(12), false, ("OAUTH:" + GetHandlerName()))
            Dim encrypted As String = FormsAuthentication.Encrypt(ticket)
            Dim accountManagerEnabled As JToken = ApplicationServices.TryGetJsonProperty(services.DefaultSettings, "membership.accountManager.enabled")
            If ((accountManagerEnabled Is Nothing) OrElse accountManagerEnabled.Value(Of Boolean)()) Then
                'client token login
                Dim cookie As HttpCookie = New HttpCookie(".TOKEN", encrypted)
                cookie.Expires = Date.Now.AddMinutes(5)
                context.Response.SetCookie(cookie)
            Else
                'server login
                services.AuthenticateUser(user.UserName, ("token:" + encrypted), false)
            End If
            context.Response.Cookies.Set(New HttpCookie(".PROVIDER", GetHandlerName()))
        End Sub
        
        Public Overridable Sub RestoreSession(ByVal context As HttpContext)
            If (context.Request.QueryString("storeToken") = "true") Then
                StoreToken = true
            End If
        End Sub
        
        Protected Overridable Function GetAccessTokens(ByVal code As String, ByVal refresh As Boolean) As String()
            Dim request As WebRequest = GetAccessTokenRequest(code, refresh)
            Dim response As WebResponse = request.GetResponse()
            Dim json As String = String.Empty
            Using sr As StreamReader = New StreamReader(response.GetResponseStream())
                json = sr.ReadToEnd()
            End Using
            If (Not (HttpContext.Current.IsCustomErrorEnabled) AndAlso (String.IsNullOrEmpty(json) OrElse Not ((json(0) = Global.Microsoft.VisualBasic.ChrW(123))))) Then
                Throw New Exception(("Error fetching access tokens. Response: " + json))
            End If
            Dim responseObj As JObject = JObject.Parse(json)
            Dim [error] As String = CType(responseObj("error"),String)
            If Not (String.IsNullOrEmpty([error])) Then
                Throw New Exception([error])
            End If
            Return New String() {CType(responseObj("access_token"),String), CType(responseObj("refresh_token"),String)}
        End Function
        
        Protected Overridable Sub StoreTokens(ByVal tokens() As String)
        End Sub
        
        Protected Overridable Function GetAuthCode(ByVal request As HttpRequest) As String
            Return request.QueryString("code")
        End Function
        
        Public Overridable Function Query(ByVal method As String, ByVal useSystemToken As Boolean) As JObject
            Dim result As JObject = Nothing
            Try 
                Dim token As String = Tokens(0)
                If useSystemToken Then
                    token = Config.AccessToken
                End If
                If String.IsNullOrEmpty(token) Then
                    Throw New Exception("No token for request.")
                End If
                Dim request As WebRequest = GetQueryRequest(method, token)
                Dim response As WebResponse = request.GetResponse()
                Using sr As StreamReader = New StreamReader(response.GetResponseStream())
                    result = JObject.Parse(sr.ReadToEnd())
                End Using
            Catch ex As WebException
                If (ex.Status = WebExceptionStatus.ProtocolError) Then
                    Dim response As HttpWebResponse = CType(ex.Response,HttpWebResponse)
                    If ((response.StatusCode = HttpStatusCode.Unauthorized) AndAlso Not (m_RefreshedToken)) Then
                        m_RefreshedToken = true
                        If Not (RefreshTokens(useSystemToken)) Then
                            Throw New Exception("Token expired.")
                        Else
                            result = Query(method, useSystemToken)
                        End If
                    Else
                        If (response.StatusCode = HttpStatusCode.Forbidden) Then
                            Throw New Exception("Insufficient permissions.")
                        End If
                    End If
                End If
            End Try
            Return result
        End Function
        
        Protected Overridable Function RefreshTokens(ByVal useSystemToken As Boolean) As Boolean
            Dim refresh As String = Tokens(1)
            If useSystemToken Then
                refresh = Config.RefreshToken
            End If
            If Not (String.IsNullOrEmpty(refresh)) Then
                Tokens = GetAccessTokens(refresh, true)
                If (Not (Tokens) Is Nothing) Then
                    If useSystemToken Then
                        StoreTokens(Tokens)
                    End If
                    Return true
                End If
            End If
            Return false
        End Function
        
        Public Overridable Function SyncUser() As MembershipUser
            Dim username As String = GetUserName()
            Dim user As MembershipUser = Membership.GetUser(username)
            If ((user Is Nothing) AndAlso Not ((Config("Sync User") = "false"))) Then
                'create user
                Dim comment As String = ("Source: " + GetHandlerName())
                Dim status As MembershipCreateStatus
                Dim pw As Guid = Guid.NewGuid()
                user = Membership.CreateUser(username, pw.ToString(), username, comment, pw.ToString(), true, status)
                If (status <> MembershipCreateStatus.Success) Then
                    Throw New Exception(status.ToString())
                End If
                user.Comment = comment
                Membership.UpdateUser(user)
                Roles.AddUserToRoles(user.UserName, GetDefaultUserRoles(user))
            End If
            If (Not (user) Is Nothing) Then
                Dim newEmail As String = GetUserEmail(user)
                If (Not (String.IsNullOrEmpty(newEmail)) AndAlso Not ((newEmail = user.Email))) Then
                    user.Email = newEmail
                    Membership.UpdateUser(user)
                End If
                SetUserAvatar(user)
                If (Config("Sync Roles") = "true") Then
                    'verify roles
                    Dim roleList As List(Of String) = GetUserRoles(user)
                    For Each role As String in roleList
                        If Not (Roles.IsUserInRole(user.UserName, role)) Then
                            If Not (Roles.RoleExists(role)) Then
                                Roles.CreateRole(role)
                            End If
                            Roles.AddUserToRole(user.UserName, role)
                        End If
                    Next
                    Dim existingRoles As List(Of String) = New List(Of String)(Roles.GetRolesForUser(user.UserName))
                    For Each oldRole As String in existingRoles
                        If Not (roleList.Contains(oldRole)) Then
                            Roles.RemoveUserFromRole(user.UserName, oldRole)
                        End If
                    Next
                End If
            End If
            Return user
        End Function
        
        Public MustOverride Function GetUserName() As String
        
        Public Overridable Function GetUserEmail(ByVal user As MembershipUser) As String
            Return user.Email
        End Function
        
        Public Overridable Sub SetUserAvatar(ByVal user As MembershipUser)
        End Sub
        
        Public Overridable Function GetUserImageUrl(ByVal user As MembershipUser) As String
            Return Nothing
        End Function
        
        Public Overridable Function GetDefaultUserRoles(ByVal user As MembershipUser) As String()
            Return New String() {"Users"}
        End Function
        
        Public Overridable Function GetUserRoles(ByVal user As MembershipUser) As List(Of String)
            Dim roleList As List(Of String) = New List(Of String)()
            roleList.Add("Users")
            Return roleList
        End Function
        
        Public Overridable Function GetUserProfile() As String
            Return "logout"
        End Function
        
        Public Overridable Function GetState() As String
            Dim state As String = ("start=" + StartPage)
            If StoreToken Then
                state = (state + "|storeToken=true")
            End If
            Return state
        End Function
        
        Public Overridable Sub SetState(ByVal state As String)
            For Each part As String in state.Split(Global.Microsoft.VisualBasic.ChrW(124))
                Dim ps() As String = part.Split(Global.Microsoft.VisualBasic.ChrW(61))
                If (ps(0) = "start") Then
                    StartPage = ps(1)
                Else
                    If (ps(0) = "storeToken") Then
                        StoreToken = ((ps(1) = "true") AndAlso Roles.IsUserInRole("Administrators"))
                    End If
                End If
            Next
        End Sub
        
        Public Overridable Sub RedirectToLoginPage()
            RequestAuthorizationCode()
        End Sub
        
        Public Overridable Sub RedirectToStartPage(ByVal context As HttpContext)
            If context.User.Identity.IsAuthenticated Then
                context.Response.Redirect(StartPage)
            Else
                context.Response.Redirect(((ApplicationServices.Current.UserHomePageUrl() + "?ReturnUrl=")  _
                                + HttpUtility.UrlEncode(ApplicationServices.ResolveClientUrl(StartPage))))
            End If
        End Sub
        
        Public Overridable Function AuthenticateTicket(ByVal user As MembershipUser) As Boolean
            Return true
        End Function
        
        Public Overridable Sub SignOut()
        End Sub
        
        Protected Overridable Sub HandleException(ByVal context As HttpContext, ByVal ex As Exception)
            Do While (Not (ex.InnerException) Is Nothing)
                ex = ex.InnerException
            Loop
            Dim [error] As ServiceRequestError = New ServiceRequestError()
            [error].Message = ex.Message
            [error].ExceptionType = ex.GetType().ToString()
            If Not (context.IsCustomErrorEnabled) Then
                [error].StackTrace = ex.StackTrace
            End If
            context.Server.ClearError()
            context.Response.TrySkipIisCustomErrors = true
            context.Response.ContentType = "application/json"
            context.Response.Clear()
            context.Response.Write(JsonConvert.SerializeObject([error]))
        End Sub
        
        Public MustOverride Function GetHandlerName() As String
        
        Public MustOverride Sub RequestAuthorizationCode()
        
        Protected MustOverride Function GetAccessTokenRequest(ByVal code As String, ByVal refresh As Boolean) As WebRequest
        
        Protected MustOverride Function GetQueryRequest(ByVal method As String, ByVal token As String) As WebRequest
    End Class
    
    Partial Public Class OAuthHandlerFactory
        Inherits OAuthHandlerFactoryBase
    End Class
    
    Public Class OAuthHandlerFactoryBase
        
        Public Shared Handlers As SortedDictionary(Of String, Type) = New SortedDictionary(Of String, Type)()
        
        Public Shared Function Create(ByVal service As String) As OAuthHandler
            Return New OAuthHandlerFactory().GetHandler(service)
        End Function
        
        Public Shared Function GetActiveHandler() As OAuthHandler
            Dim saas As HttpCookie = HttpContext.Current.Request.Cookies(".PROVIDER")
            If ((Not (saas) Is Nothing) AndAlso (Not (saas.Value) Is Nothing)) Then
                Return OAuthHandlerFactory.Create(saas.Value)
            End If
            Return Nothing
        End Function
        
        Public Overridable Function GetHandler(ByVal service As String) As OAuthHandler
            Dim t As Type = Nothing
            If Handlers.TryGetValue(service.ToLower(), t) Then
                Return CType(Activator.CreateInstance(t),OAuthHandler)
            End If
            Return Nothing
        End Function
        
        Public Shared Function CreateAutoLogin() As OAuthHandler
            Return New OAuthHandlerFactory().GetAutoLoginHandler()
        End Function
        
        Public Overridable Function GetAutoLoginHandler() As OAuthHandler
            Return Nothing
        End Function
    End Class
    
    Partial Public Class DnnOAuthHandler
        Inherits DnnOAuthHandlerBase
    End Class
    
    Partial Public Class DnnOAuthHandlerBase
        Inherits OAuthHandler
        
        Private m_ShowNavigation As String
        
        Private m_UserInfo As JObject
        
        Protected Overrides ReadOnly Property Scope() As String
            Get
                Dim sc As String = Config("Scope")
                Dim tokens As String = Config("Tokens")
                If Not (String.IsNullOrEmpty(tokens)) Then
                    sc = (sc  _
                                + (" token:" + String.Join(" token:", tokens.Split(Global.Microsoft.VisualBasic.ChrW(32)))))
                End If
                Return sc
            End Get
        End Property
        
        Public Overrides Function GetHandlerName() As String
            Return "DNN"
        End Function
        
        Public Overrides Sub RequestAuthorizationCode()
            Dim authUrl As String = String.Format("{0}?response_type=code&client_id={1}&redirect_uri={2}&state={3}", ClientUri, Config.ClientId, Config.RedirectUri, Uri.EscapeDataString(GetState()))
            If Not (String.IsNullOrEmpty(Scope)) Then
                authUrl = (authUrl  _
                            + ("&scope=" + Uri.EscapeDataString(Scope)))
            End If
            Dim username As String = HttpContext.Current.Request.QueryString("username")
            If Not (String.IsNullOrEmpty(username)) Then
                authUrl = (authUrl  _
                            + ("&username=" + username))
            End If
            HttpContext.Current.Response.Redirect(authUrl)
        End Sub
        
        Protected Overrides Function GetAccessTokenRequest(ByVal code As String, ByVal refresh As Boolean) As WebRequest
            Dim request As WebRequest = WebRequest.Create(ClientUri)
            request.Method = "POST"
            Dim codeType As String = "code"
            If refresh Then
                codeType = "access_token"
            End If
            Dim body As String = String.Format("{0}={1}&client_id={2}&client_secret={3}&redirect_uri={4}&grant_type=authorization"& _ 
                    "_code", codeType, code, Config.ClientId, Config.ClientSecret, Uri.EscapeDataString(Config.RedirectUri))
            Dim bodyBytes() As Byte = Encoding.UTF8.GetBytes(body)
            request.ContentType = "application/x-www-form-urlencoded"
            request.ContentLength = bodyBytes.Length
            Using stream As Stream = request.GetRequestStream()
                stream.Write(bodyBytes, 0, bodyBytes.Length)
            End Using
            Return request
        End Function
        
        Protected Overrides Function GetQueryRequest(ByVal method As String, ByVal token As String) As WebRequest
            Dim request As WebRequest = WebRequest.Create((ClientUri  _
                            + ("?method=" + method)))
            request.Headers(HttpRequestHeader.Authorization) = ("Bearer " + token)
            Return request
        End Function
        
        Public Overrides Function GetState() As String
            Return (MyBase.GetState()  _
                        + ("|showNavigation=" + HttpContext.Current.Request.QueryString("showNavigation")))
        End Function
        
        Public Overrides Sub SetState(ByVal state As String)
            MyBase.SetState(state)
            For Each part As String in state.Split(Global.Microsoft.VisualBasic.ChrW(124))
                Dim ps() As String = part.Split(Global.Microsoft.VisualBasic.ChrW(61))
                If (ps(0) = "showNavigation") Then
                    m_ShowNavigation = ps(1)
                End If
            Next
        End Sub
        
        Public Overrides Sub RestoreSession(ByVal context As HttpContext)
            If String.IsNullOrEmpty(m_ShowNavigation) Then
                m_ShowNavigation = context.Request.QueryString("showNavigation")
            End If
            Dim session As String = context.Request.QueryString("session")
            If (Not (String.IsNullOrEmpty(session)) AndAlso (session = "new")) Then
                ApplicationServices.Current.UserLogout()
            Else
                MyBase.RestoreSession(context)
                If (Not (StoreToken) AndAlso context.User.Identity.IsAuthenticated) Then
                    RedirectToStartPage(context)
                End If
            End If
        End Sub
        
        Public Overrides Sub RedirectToStartPage(ByVal context As HttpContext)
            Dim connector As String = "?"
            If StartPage.Contains("?") Then
                connector = "&"
            End If
            StartPage = (StartPage  _
                        + (connector  _
                        + ("_showNavigation=" + m_ShowNavigation)))
            MyBase.RedirectToStartPage(context)
        End Sub
        
        Public Overrides Function GetUserName() As String
            Return CType(m_UserInfo("UserName"),String)
        End Function
        
        Public Overrides Function GetUserEmail(ByVal user As MembershipUser) As String
            Return CType(m_UserInfo("UserEmail"),String)
        End Function
        
        Public Overrides Function GetUserRoles(ByVal user As MembershipUser) As List(Of String)
            Dim roles As List(Of String) = MyBase.GetUserRoles(user)
            For Each r As JToken in m_UserInfo.Value(Of JArray)("Roles")
                roles.Add(r.ToString())
            Next
            Return roles
        End Function
        
        Public Overrides Function SyncUser() As MembershipUser
            m_UserInfo = Query("me", false)
            Dim user As MembershipUser = MyBase.SyncUser()
            SiteContentFile.WriteJson(String.Format("sys/users/{0}.json", user.UserName), CType(m_UserInfo("Tokens"),JObject))
            Return user
        End Function
        
        Public Overrides Function GetUserImageUrl(ByVal user As MembershipUser) As String
            Return String.Format("{0}/DnnImageHandler.ashx?mode=profilepic&userId={1}&h=80&w=80", ClientUri, Convert.ToInt32(m_UserInfo("UserID")))
        End Function
        
        Public Overrides Sub SignOut()
            Dim url As String = ApplicationServices.ResolveClientUrl(ApplicationServices.Current.UserHomePageUrl())
            ServiceRequestHandler.Redirect(String.Format("{0}?_logout=true&client_id={1}&redirect_uri={2}", ClientUri, Config.ClientId, url))
        End Sub
    End Class
    
    Public Class UserTicket
        
        Public UserName As String
        
        Public Email As String
        
        Public Token As String
        
        Public Picture As String
        
        Public Sub New()
            MyBase.New
        End Sub
        
        Public Sub New(ByVal user As MembershipUser)
            MyBase.New
            UserName = user.UserName
            Email = user.Email
            Picture = ApplicationServices.Create().UserPictureString(user)
        End Sub
        
        Public Sub New(ByVal user As MembershipUser, ByVal token As String)
            Me.New(user)
            Me.Token = token
        End Sub
    End Class
    
    Public Class ManifestFile
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_FullFileName As String
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_Name As String
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_Path As String
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_MD5 As String
        
        <System.Diagnostics.DebuggerBrowsable(System.Diagnostics.DebuggerBrowsableState.Never)>  _
        Private m_Length As Integer
        
        Public Sub New()
            MyBase.New
        End Sub
        
        Public Sub New(ByVal relativePath As String)
            MyBase.New
            If relativePath.Contains("?") Then
                relativePath = relativePath.Substring(0, relativePath.IndexOf("?"))
            End If
            Me.Path = relativePath.Replace(Global.Microsoft.VisualBasic.ChrW(92), Global.Microsoft.VisualBasic.ChrW(47)).Replace("~/", String.Empty)
            Me.FullFileName = HttpContext.Current.Server.MapPath(("~/" + Me.Path))
            Me.Name = System.IO.Path.GetFileName(Me.Path)
            Dim fileBytes() As Byte = File.ReadAllBytes(Me.FullFileName)
            Me.MD5 = ComputeHash(fileBytes)
            Me.Length = fileBytes.Length
        End Sub
        
        <JsonIgnore()>  _
        Public Property FullFileName() As String
            Get
                Return Me.m_FullFileName
            End Get
            Set
                Me.m_FullFileName = value
            End Set
        End Property
        
        Public Property Name() As String
            Get
                Return Me.m_Name
            End Get
            Set
                Me.m_Name = value
            End Set
        End Property
        
        Public Property Path() As String
            Get
                Return Me.m_Path
            End Get
            Set
                Me.m_Path = value
            End Set
        End Property
        
        Public Property MD5() As String
            Get
                Return Me.m_MD5
            End Get
            Set
                Me.m_MD5 = value
            End Set
        End Property
        
        Public Property Length() As Integer
            Get
                Return Me.m_Length
            End Get
            Set
                Me.m_Length = value
            End Set
        End Property
        
        Public Shared Function ComputeHash(ByVal data() As Byte) As String
            Dim prov As MD5 = New MD5CryptoServiceProvider()
            Dim hashData() As Byte = prov.ComputeHash(data)
            Dim sb As StringBuilder = New StringBuilder()
            Dim i As Integer = 0
            Do While (i < hashData.Length)
                sb.Append(hashData(i).ToString("x2"))
                i = (i + 1)
            Loop
            Return sb.ToString()
        End Function
        
        Public Shared Function GetConfig(ByVal config As String) As ManifestFile
            Dim configBytes() As Byte = Encoding.UTF8.GetBytes(config)
            Dim configFile As ManifestFile = New ManifestFile()
            configFile.FullFileName = "config.js"
            configFile.Path = "js/host/config.js"
            configFile.Name = "config.js"
            configFile.Length = configBytes.Length
            configFile.MD5 = ComputeHash(configBytes)
            Return configFile
        End Function
    End Class
    
    Public Class FolderCacheDependency
        Inherits CacheDependency
        
        Private m_Watcher As FileSystemWatcher
        
        Public Sub New(ByVal dirName As String, ByVal filter As String)
            MyBase.New
            m_Watcher = New FileSystemWatcher(dirName, filter)
            m_Watcher.EnableRaisingEvents = true
            AddHandler m_Watcher.Changed, AddressOf Me.watcher_Changed
            AddHandler m_Watcher.Deleted, AddressOf Me.watcher_Changed
            AddHandler m_Watcher.Created, AddressOf Me.watcher_Changed
            AddHandler m_Watcher.Renamed, AddressOf Me.watcher_Renamed
        End Sub
        
        Sub watcher_Renamed(ByVal sender As Object, ByVal e As RenamedEventArgs)
            NotifyDependencyChanged(Me, e)
        End Sub
        
        Sub watcher_Changed(ByVal sender As Object, ByVal e As FileSystemEventArgs)
            NotifyDependencyChanged(Me, e)
        End Sub
    End Class
End Namespace
