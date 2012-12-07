Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Collections.Generic
Imports nsJSON

<System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class wsContent
    Inherits System.Web.Services.WebService

#Region "Pages"

    ' Save Page
    <WebMethod()> _
    Public Function savePage(ByVal pageId As Integer, ByVal page As String) As String
        Dim thePageId As Integer = -1
        Try
            Dim ta As New dsContentTableAdapters.PageTableAdapter
            ta.Update(pageId, page, thePageId)
        Catch ex As Exception
            Return Nothing
        End Try

        Return thePageId
    End Function

    ' Delete Page
    <WebMethod()> _
    Public Function deletePage(ByVal pageId As Integer) As String
        Try
            Dim ta As New dsContentTableAdapters.PageTableAdapter
            ta.Delete(pageId)
        Catch ex As Exception
            Return ex.ToString()
        End Try

        Return "success"
    End Function

    ' Select Page
    <WebMethod()> _
    Public Function selectPage(ByVal pageId As Integer) As List(Of RowClass)
        Try
            Dim ta As New dsContentTableAdapters.PageTableAdapter
            Dim ds As New dsContent

            ta.Fill(ds.Page, pageId)

            Return New DataSetToListClass(ds.Page).ReturnDS
        Catch ex As Exception
            Return Nothing
        End Try

        Return New List(Of RowClass)
    End Function

#End Region

#Region "Content"

    ' Save Page Content
    <WebMethod()> _
    Public Function savePageContent(ByVal contentId As Integer, ByVal pageId As Integer, ByVal pageContent As String) As String
        Dim theContentId As Integer = -1
        Try
            Dim ta As New dsContentTableAdapters.PageContentTableAdapter
            ta.Update(contentId, pageId, pageContent, theContentId)
        Catch ex As Exception
            Return ex.ToString()
        End Try

        Return theContentId
    End Function

    ' Save Page Content
    <WebMethod()> _
    Public Function savePageContentAndGetHTML(ByVal contentId As Integer, ByVal pageContent As String) As String
        Try
            savePageContent(contentId, -1, pageContent)
            Return selectPageContentHTML(contentId, -1)
        Catch ex As Exception
            Return ex.ToString()
        End Try

        Return ""
    End Function

    ' Select Page Content
    <WebMethod()> _
    Public Function selectPageContent(ByVal contentId As Integer, ByVal pageId As Integer) As RowClass
        Try
            Dim ta As New dsContentTableAdapters.PageContentTableAdapter
            Dim ds As New dsContent

            ta.Fill(ds.PageContent, contentId, pageId)

            Dim l As List(Of RowClass) = New DataSetToListClass(ds.PageContent).ReturnDS

            If l.Count > 0 Then
                Return l(0)
            End If
        Catch ex As Exception
            Return Nothing
        End Try

        Return New RowClass
    End Function

    ' Select Page Content HTML
    <WebMethod()> _
    Public Function selectPageContentHTML(ByVal contentId As Integer, ByVal pageId As Integer) As String
        Try
            Dim content As RowClass = selectPageContent(contentId, pageId)

            Dim isEditable As String = ""

            If User.Identity.IsAuthenticated AndAlso User.IsInRole("admin") Then
                isEditable = "<a href=""#"" class=""cms-edit"">Edit</a>"
            End If

            Dim html As String = "<div class=""editable"" data-content-id=""" & content.cols("contentId") & """>" _
                               & isEditable _
                               & content.cols("pageContent") _
                               & "</div>"

            Return html
        Catch ex As Exception
            Return ex.ToString()
        End Try

        Return ""
    End Function
#End Region


End Class