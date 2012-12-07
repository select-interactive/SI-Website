Imports System.Collections.Generic
Imports nsJSON
Imports wsBlog

Partial Class news_Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles MyBase.Load
        Dim webUrl As String = Page.Request.QueryString("webUrl")
        If Not webUrl Is Nothing AndAlso webUrl.Length > 0 Then
            loadBlog(webUrl)
        ElseIf Not Page.Request.QueryString("year") Is Nothing AndAlso Not Page.Request.QueryString("month") Is Nothing Then
            loadArchives(Page.Request.QueryString("year"), Page.Request.QueryString("month"))
        Else
            loadMostRecentBlogs()
        End If

        Dim ws As New wsBlog
        ltrlRecentPost.Text = ws.loadRecentPostsList()
        ltrlRecentProjects.Text = ws.loadRecentProjectsList()
        ltrlArchives.Text = ws.getArchiveDataHTML()
    End Sub

    Private Sub loadBlog(ByVal webUrl As String)
        Try
            Dim ws As New wsBlog
            Dim bl As List(Of RowClass) = ws.selectBlogByWebUrl(webUrl)

            If bl.Count > 0 Then
                Dim b As RowClass = bl(0)
                Page.Title = b.cols("title")
                Page.MetaKeywords = b.cols("metakeywords")
                Page.MetaDescription = b.cols("metadesc")
                Dim html As String = ws.loadBlogHTML(b, True)
                ltrlBlogPost.Text = html

                ltrlBlogJS.Text = "<script defer src=""/ckeditor/ckeditor.js""></script><script defer src=""/ckeditor/adapters/jquery.js""></script><script defer>si=window.si || {};si.blogId=" & b.cols("blogId") & ";</script><script defer src=""/js/si/si.blog.v-1.0.min.js""></script>"
            End If
        Catch ex As Exception

        End Try

    End Sub

    Private Sub loadMostRecentBlogs()
        Try
            Dim ws As New wsBlog
            Dim blogs As List(Of RowClass) = ws.selectLastFiveBlogs()

            If blogs.Count > 0 Then
                Page.Title = "News from Select Interactive"
                Page.MetaKeywords = "Select Interactive, Blog, Projects, Thoughts, Ideas, News, Announcements"
                Page.MetaDescription = "The latest news, projects, thoughts, ideas and announcements from Select Interactive."

                Dim html As String = ""
                For i As Integer = 0 To blogs.Count - 1
                    html &= ws.loadBlogHTML(blogs(i), False)
                Next

                ltrlBlogPost.Text = html
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub loadArchives(ByVal year As String, ByVal month As String)
        Try
            Dim ws As New wsBlog

            Page.Title = "News from Select Interactive"
            Page.MetaKeywords = "Select Interactive, Blog, Projects, Thoughts, Ideas, News, Announcements"
            Page.MetaDescription = "The latest news, projects, thoughts, ideas and announcements from Select Interactive."

            ltrlBlogPost.Text = ws.loadArchiveBlogs(year, month)
        Catch ex As Exception

        End Try
    End Sub
End Class
