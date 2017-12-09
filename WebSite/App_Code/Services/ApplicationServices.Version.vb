Imports System

Namespace MyCompany.Services
    
    Partial Public Class ApplicationServices
        
        ''' The first three numbers in the version reflect the version of the app generator.
        ''' The last number is the value stored in DataAquarium.Version.xml file located in the root of the project.
        ''' The number is automatically incremented when the application is published from the app generator.
        Public Shared ReadOnly Property Version() As String
            Get
                Return "8.6.10.732"
            End Get
        End Property
        
        ''' The version of jQuery Mobile integrated in the app generator.
        Public Shared ReadOnly Property JqmVersion() As String
            Get
                Return "1.4.6"
            End Get
        End Property
        
        ''' The version reported to mobile clients adding this application.
        Public Shared ReadOnly Property HostVersion() As String
            Get
                Return "1.0.0.0"
            End Get
        End Property
    End Class
End Namespace
