﻿Imports MyCompany.Services
Imports Newtonsoft.Json.Linq
Imports System
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.IO
Imports System.Linq
Imports System.Reflection
Imports System.Text
Imports System.Text.RegularExpressions
Imports System.Web
Imports System.Web.Caching
Imports System.Xml
Imports System.Xml.XPath

Namespace MyCompany.Data
    
    Public Class ControllerConfiguration
        
        Private m_Navigator As XPathNavigator
        
        Private m_NamespaceManager As XmlNamespaceManager
        
        Private m_Resolver As IXmlNamespaceResolver
        
        Private m_ActionHandlerType As String
        
        Private m_DataFilterType As String
        
        Private m_HandlerType As String
        
        Public Shared VariableDetectionRegex As Regex = New Regex("\$\w+\$")
        
        Public Shared VariableReplacementRegex As Regex = New Regex("\$(\w+)\$([\s\S]*?)\$(\w+)\$")
        
        Public Shared LocalizationDetectionRegex As Regex = New Regex("\^\w+\^")
        
        Public Const [Namespace] As String = "urn:schemas-codeontime-com:data-aquarium"
        
        Private m_ConnectionStringName As String
        
        Private m_ControllerName As String
        
        Private m_ConflictDetectionEnabled As Boolean
        
        Private m_Expressions() As DynamicExpression
        
        Private m_PlugIn As IPlugIn
        
        Private m_RawConfiguration As String
        
        Private m_UsesVariables As Boolean
        
        Private m_RequiresLocalization As Boolean
        
        Public Sub New(ByVal path As String)
            Me.New(File.OpenRead(path))
        End Sub
        
        Public Sub New(ByVal stream As Stream)
            MyBase.New
            Dim sr As StreamReader = New StreamReader(stream)
            Me.m_RawConfiguration = sr.ReadToEnd()
            sr.Close()
            Me.m_UsesVariables = VariableDetectionRegex.IsMatch(Me.m_RawConfiguration)
            Me.m_RequiresLocalization = LocalizationDetectionRegex.IsMatch(Me.m_RawConfiguration)
            Initialize(New XPathDocument(New StringReader(Me.m_RawConfiguration)).CreateNavigator())
        End Sub
        
        Public Sub New(ByVal document As XPathDocument)
            Me.New(document.CreateNavigator())
        End Sub
        
        Public Sub New(ByVal navigator As XPathNavigator)
            MyBase.New
            Initialize(navigator)
        End Sub
        
        Public ReadOnly Property ConnectionStringName() As String
            Get
                Return m_ConnectionStringName
            End Get
        End Property
        
        Public ReadOnly Property ControllerName() As String
            Get
                Return m_ControllerName
            End Get
        End Property
        
        Public ReadOnly Property ConflictDetectionEnabled() As Boolean
            Get
                Return m_ConflictDetectionEnabled
            End Get
        End Property
        
        Public ReadOnly Property Resolver() As IXmlNamespaceResolver
            Get
                Return m_Resolver
            End Get
        End Property
        
        Public ReadOnly Property Navigator() As XPathNavigator
            Get
                Return m_Navigator
            End Get
        End Property
        
        Public Property Expressions() As DynamicExpression()
            Get
                Return m_Expressions
            End Get
            Set
                m_Expressions = value
            End Set
        End Property
        
        Public ReadOnly Property PlugIn() As IPlugIn
            Get
                Return m_PlugIn
            End Get
        End Property
        
        Public ReadOnly Property RawConfiguration() As String
            Get
                Return m_RawConfiguration
            End Get
        End Property
        
        Public ReadOnly Property UsesVariables() As Boolean
            Get
                Return m_UsesVariables
            End Get
        End Property
        
        Public ReadOnly Property RequiresLocalization() As Boolean
            Get
                Return m_RequiresLocalization
            End Get
        End Property
        
        Public ReadOnly Property TrimmedNavigator() As XPathNavigator
            Get
                Dim hiddenFields As List(Of String) = New List(Of String)()
                Dim fieldIterator As XPathNodeIterator = [Select]("/c:dataController/c:fields/c:field[@roles!='']")
                Do While fieldIterator.MoveNext()
                    Dim roles As String = fieldIterator.Current.GetAttribute("roles", String.Empty)
                    If Not (DataControllerBase.UserIsInRole(roles)) Then
                        hiddenFields.Add(fieldIterator.Current.GetAttribute("name", String.Empty))
                    End If
                Loop
                If (hiddenFields.Count = 0) Then
                    Return Navigator
                End If
                Dim doc As XmlDocument = New XmlDocument()
                doc.LoadXml(Navigator.OuterXml)
                Dim nav As XPathNavigator = doc.CreateNavigator()
                Dim dataFieldIterator As XPathNodeIterator = nav.Select("//c:dataField", Resolver)
                Do While dataFieldIterator.MoveNext()
                    If hiddenFields.Contains(dataFieldIterator.Current.GetAttribute("fieldName", String.Empty)) Then
                        Dim hiddenAttr As XPathNavigator = dataFieldIterator.Current.SelectSingleNode("@hidden")
                        If (hiddenAttr Is Nothing) Then
                            dataFieldIterator.Current.CreateAttribute(String.Empty, "hidden", String.Empty, "true")
                        Else
                            hiddenAttr.SetValue("true")
                        End If
                    End If
                Loop
                Return nav
            End Get
        End Property
        
        Public Function RequiresVirtualization(ByVal controllerName As String) As Boolean
            Dim rules As BusinessRules = CreateBusinessRules()
            Return ((Not (rules) Is Nothing) AndAlso rules.SupportsVirtualization(controllerName))
        End Function
        
        Public Function Virtualize(ByVal controllerName As String) As ControllerConfiguration
            Dim config As ControllerConfiguration = Me
            If Not (m_Navigator.CanEdit) Then
                Dim doc As XmlDocument = New XmlDocument()
                doc.LoadXml(m_Navigator.OuterXml)
                config = New ControllerConfiguration(doc.CreateNavigator())
            End If
            Dim rules As BusinessRules = CreateBusinessRules()
            If (Not (rules) Is Nothing) Then
                rules.VirtualizeController(controllerName, config.m_Navigator, config.m_NamespaceManager)
            End If
            Return config
        End Function
        
        Protected Overridable Sub Initialize(ByVal navigator As XPathNavigator)
            m_Navigator = navigator
            m_NamespaceManager = New XmlNamespaceManager(m_Navigator.NameTable)
            m_NamespaceManager.AddNamespace("c", ControllerConfiguration.Namespace)
            m_Resolver = CType(m_NamespaceManager,IXmlNamespaceResolver)
            ResolveBaseViews()
            m_ControllerName = CType(Evaluate("string(/c:dataController/@name)"),String)
            m_HandlerType = CType(Evaluate("string(/c:dataController/@handler)"),String)
            If String.IsNullOrEmpty(m_HandlerType) Then
                Dim t As Type = Type.GetType("MyCompany.Rules.SharedBusinessRules")
                If (Not (t) Is Nothing) Then
                    m_HandlerType = t.FullName
                End If
            End If
            m_ActionHandlerType = m_HandlerType
            m_DataFilterType = m_HandlerType
            Dim s As String = CType(Evaluate("string(/c:dataController/@actionHandlerType)"),String)
            If Not (String.IsNullOrEmpty(s)) Then
                m_ActionHandlerType = s
            End If
            s = CType(Evaluate("string(/c:dataController/@dataFilterType)"),String)
            If Not (String.IsNullOrEmpty(s)) Then
                m_DataFilterType = s
            End If
            Dim plugInType As String = CType(Evaluate("string(/c:dataController/@plugIn)"),String)
            If (Not (String.IsNullOrEmpty(plugInType)) AndAlso ApplicationServices.IsTouchClient) Then
                plugInType = String.Empty
            End If
            If Not (String.IsNullOrEmpty(plugInType)) Then
                Dim t As Type = Type.GetType(plugInType)
                m_PlugIn = CType(t.Assembly.CreateInstance(t.FullName),IPlugIn)
                m_PlugIn.Config = Me
            End If
        End Sub
        
        Public Overridable Sub Complete()
            m_ConnectionStringName = CType(Evaluate("string(/c:dataController/@connectionStringName)"),String)
            If String.IsNullOrEmpty(m_ConnectionStringName) Then
                m_ConnectionStringName = "MyCompany"
            End If
            m_ConflictDetectionEnabled = CType(Evaluate("/c:dataController/@conflictDetection='compareAllValues'"),Boolean)
            Dim expressions As List(Of DynamicExpression) = New List(Of DynamicExpression)()
            Dim expressionIterator As XPathNodeIterator = [Select]("//c:expression[@test!='' or @result!='']")
            Do While expressionIterator.MoveNext()
                expressions.Add(New DynamicExpression(expressionIterator.Current, m_NamespaceManager))
            Loop
            Dim ruleIterator As XPathNodeIterator = [Select]("/c:dataController/c:businessRules/c:rule[@type='JavaScript']")
            Do While ruleIterator.MoveNext()
                Dim rule As DynamicExpression = New DynamicExpression()
                rule.Type = DynamicExpressionType.ClientScript
                rule.Scope = DynamicExpressionScope.Rule
                Dim ruleNav As XPathNavigator = ruleIterator.Current
                rule.Result = String.Format("<id>{0}</id><commandName>{1}</commandName><commandArgument>{2}</commandArgument><"& _ 
                        "view>{3}</view><phase>{4}</phase><script>{5}</script>", ruleNav.GetAttribute("id", String.Empty), ruleNav.GetAttribute("commandName", String.Empty), ruleNav.GetAttribute("commandArgument", String.Empty), ruleNav.GetAttribute("view", String.Empty), ruleNav.GetAttribute("phase", String.Empty), ruleNav.Value)
                expressions.Add(rule)
            Loop
            m_Expressions = expressions.ToArray()
        End Sub
        
        Private Sub EnsureChildNode(ByVal parent As XPathNavigator, ByVal nodeName As String)
            Dim child As XPathNavigator = parent.SelectSingleNode(String.Format("c:{0}", nodeName), m_Resolver)
            If (child Is Nothing) Then
                parent.AppendChild(String.Format("<{0}/>", nodeName))
            End If
        End Sub
        
        Public Overridable Function EnsureVitalElements() As ControllerConfiguration
            'verify that the data controller has views and actions
            Dim root As XPathNavigator = SelectSingleNode("/c:dataController[c:views/c:view and c:actions/c:actionGroup]")
            If (Not (root) Is Nothing) Then
                Return Me
            End If
            'add missing configuration elements
            Dim doc As XmlDocument = New XmlDocument()
            doc.LoadXml(m_Navigator.OuterXml)
            Dim config As ControllerConfiguration = New ControllerConfiguration(doc.CreateNavigator())
            Dim fieldsNode As XPathNavigator = config.SelectSingleNode("/c:dataController/c:fields[not(c:field[@isPrimaryKey='true'])]")
            If (Not (fieldsNode) Is Nothing) Then
                fieldsNode.AppendChild("<field name=""PrimaryKey"" type=""Int32"" isPrimaryKey=""true"" readOnly=""true""/>")
            End If
            root = config.SelectSingleNode("/c:dataController")
            EnsureChildNode(root, "views")
            Dim viewsNode As XPathNavigator = config.SelectSingleNode("/c:dataController/c:views[not(c:view)]")
            If (Not (viewsNode) Is Nothing) Then
                Dim sb As StringBuilder = New StringBuilder("<view id=""view1"" type=""Form"" label=""Form""><categories><category id=""c1"" flow=""New"& _ 
                        "Column""><dataFields>")
                Dim fieldIterator As XPathNodeIterator = config.Select("/c:dataController/c:fields/c:field")
                Do While fieldIterator.MoveNext()
                    Dim fieldName As String = fieldIterator.Current.GetAttribute("name", String.Empty)
                    Dim hidden As Boolean = (fieldName = "PrimaryKey")
                    Dim length As String = fieldIterator.Current.GetAttribute("length", String.Empty)
                    If (String.IsNullOrEmpty(length) AndAlso (CType(fieldIterator.Current.Evaluate("not(c:items/@style!='')", m_Resolver),Boolean) = true)) Then
                        If (fieldIterator.Current.GetAttribute("type", String.Empty) = "String") Then
                            length = "50"
                        Else
                            length = "20"
                        End If
                    End If
                    sb.AppendFormat("<dataField fieldName=""{0}"" hidden=""{1}""", fieldName, hidden.ToString().ToLower())
                    If Not (String.IsNullOrEmpty(length)) Then
                        sb.AppendFormat(" columns=""{0}""", length)
                    End If
                    sb.Append(" />")
                Loop
                sb.Append("</dataFields></category></categories></view>")
                viewsNode.AppendChild(sb.ToString())
            End If
            EnsureChildNode(root, "actions")
            Dim actionsNode As XPathNavigator = config.SelectSingleNode("/c:dataController/c:actions[not(c:actionGroup)]")
            If (Not (actionsNode) Is Nothing) Then
                actionsNode.AppendChild("" & ControlChars.CrLf &"                          <actionGroup id=""ag1"" scope=""Form"">" & ControlChars.CrLf &"<action id=""a1"" "& _ 
                        "commandName=""Confirm"" causesValidation=""true"" whenLastCommandName=""New"" />" & ControlChars.CrLf &"<act"& _ 
                        "ion id=""a2"" commandName=""Cancel"" whenLastCommandName=""New"" />" & ControlChars.CrLf &"<action id=""a3"" c"& _ 
                        "ommandName=""Confirm"" causesValidation=""true"" whenLastCommandName=""Edit"" />" & ControlChars.CrLf &"<act"& _ 
                        "ion id=""a4"" commandName=""Cancel"" whenLastCommandName=""Edit"" />" & ControlChars.CrLf &"<action id=""a5"" "& _ 
                        "commandName=""Edit"" causesValidation=""true"" />" & ControlChars.CrLf &"</actionGroup>")
            End If
            Dim plugIn As XPathNavigator = config.SelectSingleNode("/c:dataController/@plugIn")
            If (Not (plugIn) Is Nothing) Then
                plugIn.DeleteSelf()
                config.m_PlugIn = Nothing
            End If
            Return config
        End Function
        
        Protected Overridable Sub ResolveBaseViews()
            Dim firstUnresolvedView As XPathNavigator = SelectSingleNode("/c:dataController/c:views/c:view[@baseViewId!='' and not (.//c:dataField)]")
            If (Not (firstUnresolvedView) Is Nothing) Then
                Dim document As XmlDocument = New XmlDocument()
                document.LoadXml(m_Navigator.OuterXml)
                m_Navigator = document.CreateNavigator()
                Dim unresolvedViewIterator As XPathNodeIterator = [Select]("/c:dataController/c:views/c:view[@baseViewId!='']")
                Do While unresolvedViewIterator.MoveNext()
                    Dim baseViewId As String = unresolvedViewIterator.Current.GetAttribute("baseViewId", String.Empty)
                    unresolvedViewIterator.Current.SelectSingleNode("@baseViewId").DeleteSelf()
                    Dim baseView As XPathNavigator = SelectSingleNode(String.Format("/c:dataController/c:views/c:view[@id='{0}']", baseViewId))
                    If (Not (baseView) Is Nothing) Then
                        Dim nodesToDelete As List(Of XPathNavigator) = New List(Of XPathNavigator)()
                        Dim emptyNodeIterator As XPathNodeIterator = unresolvedViewIterator.Current.Select("c:*[not(child::*) and .='']", m_Resolver)
                        Do While emptyNodeIterator.MoveNext()
                            nodesToDelete.Add(emptyNodeIterator.Current.Clone())
                        Loop
                        For Each n As XPathNavigator in nodesToDelete
                            n.DeleteSelf()
                        Next
                        Dim copyNodeIterator As XPathNodeIterator = baseView.Select("c:*", m_Resolver)
                        Do While copyNodeIterator.MoveNext()
                            If (unresolvedViewIterator.Current.SelectSingleNode(("c:" + copyNodeIterator.Current.LocalName), m_Resolver) Is Nothing) Then
                                unresolvedViewIterator.Current.AppendChild(copyNodeIterator.Current.OuterXml)
                            End If
                        Loop
                    End If
                Loop
                m_Navigator = New XPathDocument(New StringReader(m_Navigator.OuterXml)).CreateNavigator()
            End If
        End Sub
        
        Private Sub InitializeHandler(ByVal handler As Object)
            If ((Not (handler) Is Nothing) AndAlso TypeOf handler Is BusinessRules) Then
                CType(handler,BusinessRules).ControllerName = ControllerName
            End If
        End Sub
        
        Public Function CreateBusinessRules() As BusinessRules
            Dim handler As IActionHandler = CreateActionHandler()
            If (handler Is Nothing) Then
                Return Nothing
            Else
                Dim rules As BusinessRules = CType(handler,BusinessRules)
                rules.Config = Me
                Return rules
            End If
        End Function
        
        Public Function CreateActionHandler() As IActionHandler
            If String.IsNullOrEmpty(m_ActionHandlerType) Then
                Return Nothing
            Else
                Dim t As Type = Type.GetType(m_ActionHandlerType)
                Dim handler As Object = t.Assembly.CreateInstance(t.FullName)
                InitializeHandler(handler)
                If TypeOf handler Is BusinessRules Then
                    CType(handler,BusinessRules).Config = Me
                End If
                Return CType(handler,IActionHandler)
            End If
        End Function
        
        Public Function CreateDataFilter() As IDataFilter
            If String.IsNullOrEmpty(m_DataFilterType) Then
                Return Nothing
            Else
                Dim t As Type = Type.GetType(m_DataFilterType)
                Dim dataFilter As Object = t.Assembly.CreateInstance(t.FullName)
                InitializeHandler(dataFilter)
                If GetType(IDataFilter).IsInstanceOfType(dataFilter) Then
                    Return CType(dataFilter,IDataFilter)
                Else
                    Return Nothing
                End If
            End If
        End Function
        
        Public Function CreateRowHandler() As IRowHandler
            If String.IsNullOrEmpty(m_ActionHandlerType) Then
                Return Nothing
            Else
                Dim t As Type = Type.GetType(m_ActionHandlerType)
                Dim handler As Object = t.Assembly.CreateInstance(t.FullName)
                InitializeHandler(handler)
                If GetType(IRowHandler).IsInstanceOfType(handler) Then
                    Return CType(handler,IRowHandler)
                Else
                    Return Nothing
                End If
            End If
        End Function
        
        Public Sub AssignDynamicExpressions(ByVal page As ViewPage)
            Dim list As List(Of DynamicExpression) = New List(Of DynamicExpression)()
            If page.IncludeMetadata("expressions") Then
                For Each de As DynamicExpression in m_Expressions
                    If de.AllowedInView(page.View) Then
                        list.Add(de)
                    End If
                Next
            End If
            page.Expressions = list.ToArray()
        End Sub
        
        Public Function Clone() As ControllerConfiguration
            Dim variablesPath As String = Path.Combine(HttpRuntime.AppDomainAppPath, "Controllers\_variables.xml")
            Dim variables As SortedDictionary(Of String, String) = CType(HttpRuntime.Cache(variablesPath),SortedDictionary(Of String, String))
            If (variables Is Nothing) Then
                variables = New SortedDictionary(Of String, String)()
                If File.Exists(variablesPath) Then
                    Dim varDoc As XPathDocument = New XPathDocument(variablesPath)
                    Dim varNav As XPathNavigator = varDoc.CreateNavigator()
                    Dim varIterator As XPathNodeIterator = varNav.Select("/variables/variable")
                    Do While varIterator.MoveNext()
                        Dim varName As String = varIterator.Current.GetAttribute("name", String.Empty)
                        Dim varValue As String = varIterator.Current.Value
                        If Not (variables.ContainsKey(varName)) Then
                            variables.Add(varName, varValue)
                        Else
                            variables(varName) = varValue
                        End If
                    Loop
                End If
                HttpRuntime.Cache.Insert(variablesPath, variables, New CacheDependency(variablesPath))
            End If
            Return New ControllerConfiguration(New XPathDocument(New StringReader(New ControllerConfigurationUtility(m_RawConfiguration, variables).ReplaceVariables())))
        End Function
        
        Public Function Localize(ByVal controller As String) As ControllerConfiguration
            Dim localizedContent As String = Localizer.Replace("Controllers", (controller + ".xml"), m_Navigator.OuterXml)
            If (Not (PlugIn) Is Nothing) Then
                Dim doc As XmlDocument = New XmlDocument()
                doc.LoadXml(localizedContent)
                Return New ControllerConfiguration(doc.CreateNavigator())
            Else
                Return New ControllerConfiguration(New XPathDocument(New StringReader(localizedContent)))
            End If
        End Function
        
        Public Function SelectSingleNode(ByVal selector As String, ByVal ParamArray args() as System.[Object]) As XPathNavigator
            Return m_Navigator.SelectSingleNode(String.Format(selector, args), m_Resolver)
        End Function
        
        Public Function [Select](ByVal selector As String, ByVal ParamArray args() as System.[Object]) As XPathNodeIterator
            Return m_Navigator.Select(String.Format(selector, args), m_Resolver)
        End Function
        
        Public Function Evaluate(ByVal selector As String, ByVal ParamArray args() as System.[Object]) As Object
            Return m_Navigator.Evaluate(String.Format(selector, args), m_Resolver)
        End Function
        
        Public Function ReadActionData(ByVal path As String) As String
            If Not (String.IsNullOrEmpty(path)) Then
                Dim p() As String = path.Split(Global.Microsoft.VisualBasic.ChrW(47))
                If (p.Length = 2) Then
                    Dim dataNav As XPathNavigator = SelectSingleNode("/c:dataController/c:actions/c:actionGroup[@id='{0}']/c:action[@id='{1}']/c:data", p(0), p(1))
                    If (Not (dataNav) Is Nothing) Then
                        Return dataNav.Value
                    End If
                End If
            End If
            Return Nothing
        End Function
        
        Public Sub ParseActionData(ByVal path As String, ByVal variables As SortedDictionary(Of String, String))
            Dim data As String = ReadActionData(path)
            If Not (String.IsNullOrEmpty(data)) Then
                Dim m As Match = Regex.Match(data, "^\s*(\w+)\s*=\s*(.+?)\s*$", RegexOptions.Multiline)
                Do While m.Success
                    variables(m.Groups(1).Value) = m.Groups(2).Value
                    m = m.NextMatch()
                Loop
            End If
        End Sub
        
        Public Function ToJson() As String
            Dim config As ControllerConfiguration = Me.Virtualize(Me.ControllerName)
            Dim exceptions() As String = New String() {"//comment()", "c:dataController/c:commands", "c:dataController/@handler", "//c:field/c:formula", "//c:businessRules/rule[type=""Code"" or type=""Sql"" or type=""Email""]"}
            For Each ex As String in exceptions
                Dim toDelete As List(Of XPathNavigator) = New List(Of XPathNavigator)()
                Dim iterator As XPathNodeIterator = config.Select(ex)
                Do While iterator.MoveNext()
                    toDelete.Add(iterator.Current.Clone())
                Loop
                For Each node As XPathNavigator in toDelete
                    node.DeleteSelf()
                Next
            Next
            Return XmlConverter.ToJson(config.Navigator, "dataController", true, "commands", "output", "fields", "views", "categories", "dataFields", "actions", "actionGroup", "businessRules")
        End Function
    End Class
    
    Public Class ControllerConfigurationUtility
        
        Private Shared m_AssemblyResources As SortedDictionary(Of String, String)
        
        Private m_RawConfiguration As String
        
        Private m_Variables As SortedDictionary(Of String, String)
        
        Shared Sub New()
            m_AssemblyResources = New SortedDictionary(Of String, String)()
            Dim a As [Assembly] = GetType(ControllerConfigurationUtility).Assembly
            For Each resource As String in a.GetManifestResourceNames()
                m_AssemblyResources(resource.ToLowerInvariant()) = resource
            Next
        End Sub
        
        Public Sub New(ByVal rawConfiguration As String, ByVal variables As SortedDictionary(Of String, String))
            MyBase.New
            m_RawConfiguration = rawConfiguration
            m_Variables = variables
        End Sub
        
        Public Function ReplaceVariables() As String
            Return ControllerConfiguration.VariableReplacementRegex.Replace(m_RawConfiguration, AddressOf DoReplace)
        End Function
        
        Private Function DoReplace(ByVal m As Match) As String
            If (m.Groups(1).Value = m.Groups(3).Value) Then
                Dim s As String = Nothing
                If m_Variables.TryGetValue(m.Groups(1).Value, s) Then
                    Return s
                Else
                    Return m.Groups(2).Value
                End If
            End If
            Return m.Value
        End Function
        
        Public Shared Function GetResourceStream(ByVal ParamArray resourceNames() as string) As Stream
            Dim a As [Assembly] = GetType(ControllerConfigurationUtility).Assembly
            Dim resourceName As String = Nothing
            For Each resource As String in resourceNames
                If m_AssemblyResources.TryGetValue(resource.ToLowerInvariant(), resourceName) Then
                    Return a.GetManifestResourceStream(resourceName)
                End If
            Next
            Return Nothing
        End Function
        
        Public Shared Function GetResourceText(ByVal ParamArray resourceNames() as string) As String
            Dim res As Stream = GetResourceStream(resourceNames)
            If (res Is Nothing) Then
                Return Nothing
            End If
            Using sr As StreamReader = New StreamReader(res)
                Return sr.ReadToEnd()
            End Using
        End Function
        
        Public Shared Function GetFilePath(ByVal ParamArray paths() as string) As String
            For Each path As String in paths
                If File.Exists(path) Then
                    Return path
                End If
            Next
            Return Nothing
        End Function
        
        Public Shared Function GetFileText(ByVal ParamArray paths() as string) As String
            Dim path As String = GetFilePath(paths)
            If Not (String.IsNullOrEmpty(path)) Then
                Return File.ReadAllText(path)
            End If
            Return Nothing
        End Function
    End Class
    
    Public Class XmlConverter
        
        Private m_Navigator As XPathNavigator
        
        Private m_Arrays() As String = Nothing
        
        Private m_RenderMetadata As Boolean = false
        
        Private m_Root As String
        
        Private m_Sb As StringBuilder
        
        Public Sub New(ByVal navigator As XPathNavigator, ByVal root As String, ByVal metadata As Boolean, ByVal arrays() As String)
            MyBase.New
            m_Navigator = navigator
            m_Root = root
            m_RenderMetadata = metadata
            m_Arrays = arrays
        End Sub
        
        Public Overloads Shared Function ToJson(ByVal navigator As XPathNavigator, ByVal root As String, ByVal metadata As Boolean, ByVal ParamArray arrays() as System.[String]) As String
            Dim xmlc As XmlConverter = New XmlConverter(navigator, root, metadata, arrays)
            Return xmlc.ToJson()
        End Function
        
        Public Overloads Function ToJson() As String
            Dim nav As XPathNavigator = m_Navigator
            m_Sb = New StringBuilder("{"&Global.Microsoft.VisualBasic.ChrW(10))
            Do While (Not ((nav.Name = m_Root)) AndAlso nav.MoveToFirstChild())
            Loop
            XmlToJson(nav, false, 1)
            m_Sb.AppendLine(""&Global.Microsoft.VisualBasic.ChrW(10)&"}")
            Return m_Sb.ToString()
        End Function
        
        Private Sub WriteJsonValue(ByVal nav As XPathNavigator)
            Dim v As String = nav.ToString()
            Dim tempInt32 As Integer
            If Integer.TryParse(v, tempInt32) Then
                m_Sb.Append(tempInt32)
            Else
                Dim tempBool As Boolean
                If Boolean.TryParse(v, tempBool) Then
                    m_Sb.Append(tempBool.ToString().ToLower())
                Else
                    m_Sb.Append(HttpUtility.JavaScriptStringEncode(v, true))
                End If
            End If
        End Sub
        
        Private Sub WriteMultilineValue(ByVal nav As XPathNavigator)
            Dim type As String = Nothing
            Dim props As XPathNavigator = nav.CreateNavigator()
            Dim keepGoing As Boolean = true
            Do While keepGoing
                props.MoveToParent()
                If props.MoveToFirstAttribute() Then
                    keepGoing = false
                End If
            Loop
            keepGoing = true
            Do While keepGoing
                If (props.Name = "type") Then
                    type = props.Value
                End If
                If Not (props.MoveToNextAttribute()) Then
                    keepGoing = false
                End If
            Loop
            If String.IsNullOrEmpty(type) Then
                WriteJsonValue(nav)
            Else
                props.MoveToRoot()
                props.MoveToFirstChild()
                WriteJsonValue(nav)
            End If
        End Sub
        
        Private Sub XmlToJson(ByVal nav As XPathNavigator, ByVal isArrayMember As Boolean, ByVal depth As Integer)
            Dim padding As String = New String(Global.Microsoft.VisualBasic.ChrW(32), (depth * 2))
            Dim isArray As Boolean = m_Arrays.Contains(nav.Name)
            Dim isComplexArray As Boolean = (isArray AndAlso nav.HasAttributes)
            Dim closingBracket As Boolean = true
            If Not (isComplexArray) Then
                If Not (isArrayMember) Then
                    m_Sb.AppendFormat((padding + """{0}"": "), nav.Name)
                    If nav.MoveToFirstChild() Then
                        If (nav.NodeType = XPathNodeType.Text) Then
                            closingBracket = false
                        End If
                        nav.MoveToParent()
                    End If
                End If
                If closingBracket Then
                    If isArray Then
                        m_Sb.AppendLine("[")
                    Else
                        If Not (isArrayMember) Then
                            m_Sb.AppendLine("{")
                        Else
                            m_Sb.AppendLine((padding + "{"))
                        End If
                    End If
                End If
            End If
            Dim firstProp As Boolean = true
            Dim childPadding As String = (padding + "  ")
            Dim keepGoing As Boolean
            If (isComplexArray AndAlso isArrayMember) Then
                m_Sb.AppendLine((padding + "{"))
            End If
            If nav.MoveToFirstAttribute() Then
                keepGoing = true
                Do While keepGoing
                    If firstProp Then
                        firstProp = false
                    Else
                        m_Sb.AppendLine(",")
                    End If
                    m_Sb.AppendFormat((childPadding + """{0}"": "), nav.Name)
                    WriteJsonValue(nav)
                    If Not (nav.MoveToNextAttribute()) Then
                        keepGoing = false
                    End If
                Loop
                nav.MoveToParent()
                If isComplexArray Then
                    m_Sb.AppendLine(",")
                    m_Sb.AppendFormat((childPadding + """{0}"": ["&Global.Microsoft.VisualBasic.ChrW(10)), nav.Name)
                    firstProp = true
                End If
            End If
            If nav.MoveToFirstChild() Then
                If (nav.NodeType = XPathNodeType.Text) Then
                    If isArrayMember Then
                        m_Sb.AppendLine(",")
                        m_Sb.Append((childPadding + """@text"": "))
                    Else
                        m_Sb.AppendLine(" {")
                        m_Sb.Append((childPadding + """@value"": "))
                    End If
                    If nav.Value.Contains(""&Global.Microsoft.VisualBasic.ChrW(10)) Then
                        WriteMultilineValue(nav)
                    Else
                        WriteJsonValue(nav)
                    End If
                    If Not (isArrayMember) Then
                        m_Sb.Append((""&Global.Microsoft.VisualBasic.ChrW(10)  _
                                        + (padding + "}")))
                    End If
                Else
                    keepGoing = true
                    Do While keepGoing
                        If firstProp Then
                            firstProp = false
                        Else
                            m_Sb.AppendLine(",")
                        End If
                        XmlToJson(nav, isArray, (depth + 1))
                        If Not (nav.MoveToNext()) Then
                            keepGoing = false
                        End If
                    Loop
                End If
                nav.MoveToParent()
            End If
            If closingBracket Then
                m_Sb.AppendLine()
                If isComplexArray Then
                    m_Sb.Append((padding + "  ]"))
                Else
                    If isArray Then
                        m_Sb.Append((padding + "]"))
                    Else
                        m_Sb.Append((padding + "}"))
                    End If
                End If
            End If
            If (isComplexArray AndAlso isArrayMember) Then
                m_Sb.Append((""&Global.Microsoft.VisualBasic.ChrW(10)  _
                                + (padding + "}")))
            End If
            If nav.MoveToNext() Then
                m_Sb.AppendLine(",")
                XmlToJson(nav, isArrayMember, depth)
            End If
        End Sub
    End Class
End Namespace
