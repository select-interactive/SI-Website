﻿Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.IO
Imports nsJSON

<System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class wsUser
    Inherits System.Web.Services.WebService

#Region "Login/Logout"

    ' Login
    <WebMethod()> _
    Public Function siUserLogin(ByVal username As String, ByVal password As String, ByVal remember As Boolean) As String
        Try
            If Membership.ValidateUser(username, password) Then
                Dim mu As MembershipUser = Membership.GetUser(username)
                FormsAuthentication.SetAuthCookie(username, remember)
            Else
                Return "Login failed. Please try again."
            End If
        Catch ex As Exception
            Return ex.ToString()
        End Try

        Return "success"
    End Function

    ' Logout
    <WebMethod()> _
    Public Function siUserLogout() As String
        Try
            FormsAuthentication.SignOut()
        Catch ex As Exception
            Return ex.ToString()
        End Try

        Return "success"
    End Function

#End Region

    ' Get the logged in user's id
    <WebMethod()> _
    Public Function getActiveUserId() As String
        Try
            Dim mu As MembershipUser = Membership.GetUser(HttpContext.Current.User.Identity.Name)
            Return mu.ProviderUserKey.ToString()
        Catch ex As Exception
            Return ""
        End Try
    End Function

End Class