Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Collections.Generic
Imports System.Data.SqlTypes
Imports System.Data.SqlClient
Imports System.Text
Imports System.Xml
Imports System.IO
Imports System.Net.Mail
Imports nsJSON

<System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class wsBlog
    Inherits System.Web.Services.WebService

#Region "Selecting/Saving/Deleting Blogs"

    ' Select Blog
    <WebMethod()> _
    Public Function selectBlogs(ByVal blogId As Integer, ByVal webUrl As String, ByVal tagId As Integer, ByVal categoryId As Integer) As List(Of RowClass)
        Try
            If Not webUrl Is Nothing AndAlso webUrl.Length = 0 Then
                webUrl = Nothing
            End If

            Dim ta As New dsBlogTableAdapters.BlogTableAdapter
            Dim ds As New dsBlog

            ta.Fill(ds.Blog, blogId, webUrl, tagId, categoryId)

            Return New DataSetToListClass(ds.Blog).ReturnDS
        Catch ex As Exception
            Return Nothing
        End Try

        Return New List(Of RowClass)
    End Function

    ' Select blog by blogId
    <WebMethod()> _
    Public Function selectBlogByBlogId(ByVal blogId As Integer) As List(Of RowClass)
        Return selectBlogs(blogId, Nothing, -1, -1)
    End Function

    ' Select blog by webUrl
    <WebMethod()> _
    Public Function selectBlogByWebUrl(ByVal webUrl As String) As List(Of RowClass)
        Return selectBlogs(-1, webUrl, -1, -1)
    End Function

    ' Select blogs by tagId
    <WebMethod()> _
    Public Function selectBlogsByTagId(ByVal tagId As Integer) As List(Of RowClass)
        Return selectBlogs(-1, Nothing, tagId, -1)
    End Function

    ' Select blogs by categoryId
    <WebMethod()> _
    Public Function selectBlogsByCategoryid(ByVal categoryId As Integer) As List(Of RowClass)
        Return selectBlogs(Nothing, Nothing, Nothing, categoryId)
    End Function

    ' Select last five blogs
    <WebMethod()> _
    Public Function selectLastFiveBlogs() As List(Of RowClass)
        Try
            Dim ta As New dsBlogTableAdapters.BlogTableAdapter
            Dim ds As New dsBlog
            ta.FillByLastFive(ds.Blog)
            Return New DataSetToListClass(ds.Blog).ReturnDS
        Catch ex As Exception
            Return Nothing
        End Try

        Return New List(Of RowClass)
    End Function

    ' Select last five projects
    <WebMethod()> _
    Public Function selectLastFiveProjects() As List(Of RowClass)
        Try
            Dim ta As New dsBlogTableAdapters.BlogTableAdapter
            Dim ds As New dsBlog
            ta.FillByLastFiveProjects(ds.Blog)
            Return New DataSetToListClass(ds.Blog).ReturnDS
        Catch ex As Exception
            Return Nothing
        End Try

        Return New List(Of RowClass)
    End Function

    ' Load Blog HTML by Blog as a RowClass
    <WebMethod()> _
    Public Function loadBlogHTML(ByVal b As RowClass, ByVal showComments As Boolean) As String
        Dim html As String = "<article id=""blog-" & b.cols("blogId") & """>"

        ' Blog title and date
        Dim blogDate As DateTime = b.cols("datePosted")
        html &= "<hgroup>" _
              & "  <h2>"

        If Not showComments Then
            html &= "<a href=""/news/" & b.cols("webUrl") & """>" & b.cols("title") & "</a></h2>"
        Else
            html &= b.cols("title") & "</h2>"
        End If

        html &= "</hgroup>"

        ' Blog post
        html &= "<div class=""body"">"

        ' If the post is about a project
        If b.cols("categoryId") = 1 Then
            Dim projectUrl = b.cols("projectUrl")

            ' Check for image
            If Not IsDBNull(b.cols("primaryPic")) AndAlso Not b.cols("primaryPic") Is Nothing AndAlso b.cols("primaryPic").ToString.Length > 0 Then
                html &= "<div class=""proj-pic""><a href=""http://" & projectUrl & """ target=""_blank""><img src=""/img/news/projects/" & b.cols("primaryPic") & """ alt=""" & b.cols("title") & """ /></a></div>"
            End If

            ' Project url
            html &= "<div class=""proj-url"">Project URL: <a href=""http://" & projectUrl & """ target=""_blank"">" & projectUrl & "</a></div>"
        End If

        html &= b.cols("body")

        ' If the post is about a project
        If b.cols("categoryId") = 1 Then
            ' Tags
            Dim tags As List(Of RowClass) = loadTagsByBlog(b.cols("blogId"))
            If tags.Count > 0 Then
                html &= "<div class=""tags"">Tools: "
                For i As Integer = 0 To tags.Count - 1
                    Dim t As RowClass = tags(i)
                    If i > 0 Then
                        html &= ", "
                    End If
                    html &= "<a href=""#"" data-tag-id=""" & t.cols("tagId") & """>" & t.cols("tagName") & "</a>"
                    If i + 1 = tags.Count Then
                        html &= "."
                    End If
                Next
                html &= "</div>"
            End If
        End If

        ' Close the body
        html &= "</div>"

        ' Date and Author
        html &= "<div class=""date-author"">" _
              & "  <time datetime=""" & blogDate & """>" & blogDate.ToString("D") & "</time>" _
              & "  &nbsp;&mdash;&nbsp;" _
              & "  <a href=""mailto:" & b.cols("authorEmail") & "?subject=" & b.cols("title") & """>By " & b.cols("authorName") & "</a>" _
              & "</div>"

        ' Social
        Dim urlToShare = "http://www.select-interactive.com/news/" & b.cols("webUrl")
        html &= "<div class=""social clearfix"">"

        If Not showComments Then
            html &= "<div style=""float:left;font-size:.9em;margin-right:20px;width:auto;""><a href=""/news/" & b.cols("webUrl") & "#comments"">View Comments (" & b.cols("numComments") & ")</a></div>"
        End If

        html &= "<div style=""float:left;width:75px;""><g:plusone style=""vertical-align:top;"" size=""medium"" href=""" & urlToShare & """ annotation=""bubble"" width=""70""></g:plusone></div>" _
              & "<div style=""float:left;width:150px;""><fb:like style=""vertical-align:top;"" href=""" & urlToShare & """ send=""true"" width=""90"" show_faces=""false"" layout=""button_count"" /></div>" _
              & "<div style=""float:left;width:75px;""><a style=""vertical-align:top;"" href=""https://twitter.com/share"" class=""twitter-share-button"" data-url=""" & urlToShare & """>Tweet</a></div>" _
              & "</div>"

        ' Load and show approved comments
        If showComments Then
            html &= "<div id=""comments"">"
            Dim comments As List(Of RowClass) = selectComments(-1, b.cols("blogId"), True)

            If comments.Count > 0 Then
                html &= "<h4>Comments</h4>"

                For i As Integer = 0 To comments.Count - 1
                    Dim comment As RowClass = comments(i)
                    Dim commentDate As Date = comment.cols("commentDate")
                    html &= "<div class=""comment"" data-comment-id=""" & comment.cols("commentId") & """>"

                    If User.Identity.IsAuthenticated AndAlso User.IsInRole("admin") Then
                        html &= "<button class=""delete"">Delete</button>"
                    End If

                    html &= comment.cols("comment") & "<div class=""comment-by"">- " & comment.cols("commentBy") & " on " & commentDate.ToString("MMMM dd, yyyy h:mm tt") & "</div>" _
                          & "</div>"
                Next
            End If

            html &= "<div id=""form-comment"" class=""form""><h4>Post a Comment</h4>" _
                  & "<div class=""r""><label for=""ta-comment"">*Comment:</label><textarea id=""ta-comment""></textarea></div>" _
                  & "<div class=""r""><label for=""tb-name"">*Your Name:</label><input type=""text"" id=""tb-name"" /></div>" _
                  & "<div class=""r""><label for=""tb-email"">*Your Email Address:</label><input type=""email"" id=""tb-email"" /></div>" _
                  & "<div class=""r""><button id=""btn-submit-comment"">Submit Comment</button></div>" _
                  & "<div id=""status-comment"" class=""status""></div>" _
                  & "</div>"

            html &= "</div>"
        End If

        ' End Blog
        html &= "</article>"

        Return html
    End Function

    ' Save blog
    <WebMethod()> _
    Public Function saveBlog(ByVal blogId As Integer, ByVal title As String, ByVal body As String, ByVal primaryPic As String, ByVal thumbPic As String, ByVal projectUrl As String, ByVal metadesc As String, ByVal metakeywords As String, ByVal isActive As Boolean, ByVal tags() As String, ByVal categoryId As Integer) As String
        Try
            ' Rewrite the Title replacing characters with - to save as the url
            Dim chars() As Char = title.ToCharArray()
            Dim url = ""
            For i As Integer = 0 To chars.Length - 1
                Dim c As Char = chars(i)
                If c = "!" Or c = "/" Or c = "\" Or c = "?" Or c = "+" Or c = "=" Or c = ")" Or c = "(" Or c = "'" Or c = ";" Or c = ":" Or c = """" Or c = "," Or c = "." Or c = "@" Or c = "#" Or c = "$" Or c = "%" Or c = "^" Or c = "&" Or c = "*" Or c = "~" Or c = "`" Or c = " " Then
                    If i + 1 < chars.Length Then
                        url &= "-"
                    End If
                Else
                    url &= c
                End If
            Next

            Dim ta As New dsBlogTableAdapters.BlogTableAdapter
            Dim theBlogId As Integer = -1
            ta.Update(blogId, title, body, primaryPic, thumbPic, url, projectUrl, metadesc, metakeywords, isActive, (New wsUser).getActiveUserId(), categoryId, theBlogId)

            ' Delete all blog/tag lookups
            Dim taTags As New dsBlogTableAdapters.BlogTagTableAdapter
            taTags.SI_Blog_Tag_Lookup_DeleteByBlogId(theBlogId)

            ' Save all blog/tag lookups
            If Not tags(0) = "-1" Then
                For i As Integer = 0 To tags.Length - 1
                    taTags.SI_Blog_Tag_Lookup_Insert(theBlogId, tags(i))
                Next
            End If

            ' Update the RSS File
            buildRSSFile()

            Return theBlogId
        Catch ex As Exception
            Return ex.ToString()
        End Try
    End Function

    ' Load Recent Posts List
    <WebMethod()> _
    Public Function loadRecentPostsList() As String
        Try
            Dim l As List(Of RowClass) = selectLastFiveBlogs()

            If l.Count > 0 Then
                Dim html As String = "<ul class=""recent-posts"">"

                For i As Integer = 0 To l.Count - 1
                    Dim b As RowClass = l(i)
                    html &= "<li><a href=""/news/" & b.cols("webUrl") & """>" & b.cols("title") & "</a></li>"
                Next

                html &= "</ul>"

                Return html
            End If
        Catch ex As Exception
            Return ex.ToString()
        End Try

        Return ""
    End Function

    ' Load Recent Projects List
    <WebMethod()> _
    Public Function loadRecentProjectsList() As String
        Try
            Dim l As List(Of RowClass) = selectLastFiveProjects()

            If l.Count > 0 Then
                Dim html As String = "<ul class=""recent-posts"">"

                For i As Integer = 0 To l.Count - 1
                    Dim b As RowClass = l(i)
                    html &= "<li><a href=""/news/" & b.cols("webUrl") & """>" & b.cols("title") & "</a></li>"
                Next

                html &= "</ul>"

                Return html
            End If
        Catch ex As Exception
            Return ex.ToString()
        End Try

        Return ""
    End Function

    ' Delete blog
    <WebMethod()> _
    Public Function deleteBlog(ByVal blogId As Integer) As String
        Try
            Dim ta As New dsBlogTableAdapters.BlogTableAdapter
            ta.Delete(blogId)
        Catch ex As Exception
            Return ex.ToString()
        End Try

        Return "success"
    End Function

#End Region

#Region "Tags"

    ' Load tags
    <WebMethod()> _
    Public Function loadTags(ByVal tagId As Integer) As List(Of RowClass)
        Try
            Dim ta As New dsBlogTableAdapters.BlogTagTableAdapter
            Dim ds As New dsBlog
            ta.Fill(ds.BlogTag, tagId)
            Return New DataSetToListClass(ds.BlogTag).ReturnDS
        Catch ex As Exception
            Return Nothing
        End Try

        Return New List(Of RowClass)
    End Function

    ' Load tags by Blog
    <WebMethod()> _
    Public Function loadTagsByBlog(ByVal blogId As Integer) As List(Of RowClass)
        Try
            Dim ta As New dsBlogTableAdapters.BlogTagTableAdapter
            Dim ds As New dsBlog
            ta.FillByBlog(ds.BlogTag, blogId)
            Return New DataSetToListClass(ds.BlogTag).ReturnDS
        Catch ex As Exception
            Return Nothing
        End Try

        Return New List(Of RowClass)
    End Function

    ' Load tag details - HTML string
    <WebMethod()> _
    Public Function loadTagDetails(ByVal tagId As Integer) As String
        Try
            Dim tag As RowClass = loadTags(tagId)(0)
            If Not tag.cols("tagId") Is Nothing And tag.cols("tagId") > 0 Then
                Dim html As String = "<div class=\""modal tag-details\""><a class=\""modal-close tag-close\"" href=\""#\""></a>"

                html &= "<div class=\""r clearfix\"">" _
                      & "  <div class=\""c\""><a href=\""" & tag.cols("tagURL") & "\"" target=\""_blank\""><img src=\""/img/tags/" & tag.cols("tagImg") & "\"" /></a></div>" _
                      & "  <div class=\""c\"">" _
                      & "    <hgroup><h1>" & tag.cols("tagName") & "</h1></hgroup>" _
                      & "    <p>" & tag.cols("tagDescription") & "</p>" _
                      & "  </div>" _
                      & "</div>"

                html &= "</div>"

                Return "{""status"":""success"",""msg"":""" & html & """}"
            Else
                Return "{""status"":""error"",""msg"":""Tag not found.""}"
            End If
        Catch ex As Exception
            Return "{""status"":""error"",""msg"":""" & ex.ToString & """}"
        End Try
    End Function

#End Region

#Region "Categories"

    ' Load Categories
    <WebMethod()> _
    Public Function loadCategories(ByVal categoryId As Integer) As List(Of RowClass)
        Try
            Dim ta As New dsBlogTableAdapters.BlogCategoryTableAdapter
            Dim ds As New dsBlog
            ta.Fill(ds.BlogCategory, -1)
            Return New DataSetToListClass(ds.BlogCategory).ReturnDS
        Catch ex As Exception
            Return Nothing
        End Try

        Return New List(Of RowClass)
    End Function

#End Region

#Region "Comments"

    ' Save a comment
    <WebMethod()> _
    Public Function saveComment(ByVal commentId As Integer, ByVal blogId As Integer, ByVal commentBy As String, _
                                ByVal email As String, ByVal comment As String, ByVal isApproved As Boolean) As String
        Try
            Dim theCommentId As Integer = -1
            Dim ta As New dsBlogTableAdapters.BlogCommentsTableAdapter
            ta.Update(commentId, blogId, commentBy, email, comment, isApproved, theCommentId)

            Return theCommentId
        Catch ex As Exception
            Return ex.ToString()
        End Try
    End Function

    ' Insert a new comment
    <WebMethod()> _
    Public Function insertComment(ByVal blogId As Integer, ByVal commentBy As String, ByVal email As String, ByVal comment As String) As String
        Try
            ' Validate the email address
            If Not Regex.IsMatch(email, "\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*") Then
                Return "Error: Invalid email address."
            End If

            Dim commentId As Integer = CInt(saveComment(-1, blogId, commentBy, email, comment, True))
            Dim theBlog As RowClass = selectBlogByBlogId(blogId)(0)
            Dim theComment As RowClass = selectComments(commentId, -1, True)(0)

            ' Generate the email
            Dim htmlBody As String = "<html><body style=""margin:0;padding:0;color:#444;background-color:#f8f8f9;"">" _
                                   & "<table align=""center"" border=""0"" cellspacing=""0"" cellpadding=""0"" style=""margin:0 auto;padding:0;width:550px;background:#eaeaea;"">" _
                                   & "  <tr><td style=""padding:20px;color:#444;font-family:Arial,Sans-Serif;font-size: 10pt;"">" _
                                   & "      <div style=""margin:0 0 20px 0;text-align:center;""><img src=""http://select-interactive.com/img/logos/SI-75height.png"" alt=""Select Interactive"" /></div>" _
                                   & "      <p>A new comment has been posted to the blog: " & theBlog.cols("title") & "</p>" _
                                   & "      <p style=""margin-bottom:0px;"">Posted by: " & commentBy & "<br /><br />Email: " & email & "<br /><br />Comment:</p>" _
                                   & "      <div style=""margin-top:2px;padding:8px;border:1px solid #e4e4e4;background:#f7f7f7;"">" & comment & "</div>" _
                                   & "      <p><a href=""http://www.select-interactive.com/news/" & theBlog.cols("webUrl") & """>Link to View</a></p>" _
                                   & "      <p style=""font-size:9pt;"">Do not respond to this email. It was automatically generated for Select Interactive.</p>" _
                                   & "  </td></tr>" _
                                   & "</table>" _
                                   & "</body></html>"

            Dim smtp As New SmtpClient
            Dim authenInfo As New Net.NetworkCredential("smtp@dfwmail.net", "outgoing")
            smtp.UseDefaultCredentials = False
            smtp.Credentials = authenInfo
            smtp.Port = "25"
            smtp.Host = "mail.sohopros.com"

            Dim mm As New MailMessage("""Select Interactive"" <blog-comment@select-interactive.com>", "jeremy@select-interactive.com")
            With mm
                .IsBodyHtml = True
                .Subject = "New Blog Comment"
                .Body = htmlBody
            End With

            smtp.Send(mm)

            Dim commentDate As Date = theComment.cols("commentDate")
            Dim html = "<div class=""comment out"" data-comment-id=""" & theComment.cols("commentId") & """>"

            If User.Identity.IsAuthenticated AndAlso User.IsInRole("admin") Then
                html &= "<button class=""delete"">Delete</button>"
            End If

            html &= theComment.cols("comment") & "<div class=""comment-by"">- " & theComment.cols("commentBy") & " on " & commentDate.ToString("MMMM dd, yyyy h:mm tt") & "</div>" _
                  & "</div>"

            Return html
        Catch ex As Exception
            Return "Error: " & ex.ToString
        End Try
    End Function

    ' Select comment(s)
    <WebMethod()> _
    Public Function selectComments(ByVal commentId As Integer, ByVal blogId As Integer, ByVal isApproved As Boolean) As List(Of RowClass)
        Try
            Dim ta As New dsBlogTableAdapters.BlogCommentsTableAdapter
            Dim ds As New dsBlog
            ta.Fill(ds.BlogComments, commentId, blogId, isApproved)

            Return New DataSetToListClass(ds.BlogComments).ReturnDS
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

    ' Delete comment
    <WebMethod()> _
    Public Function deleteComment(ByVal commentId As Integer) As String
        Try
            Dim ta As New dsBlogTableAdapters.BlogCommentsTableAdapter
            ta.Delete(commentId)
            Return "success"
        Catch ex As Exception
            Return ex.ToString()
        End Try
    End Function

#End Region

#Region "Archives"

    ' Get Archive Data
    <WebMethod()> _
    Public Function getArchiveData() As List(Of RowClass)
        Try
            Dim ta As New dsBlogTableAdapters.ArchiveDataTableAdapter
            Dim ds As New dsBlog
            ta.Fill(ds.ArchiveData)
            Return New DataSetToListClass(ds.ArchiveData).ReturnDS
        Catch ex As Exception
            Return Nothing
        End Try
    End Function

    ' Get Archive Data as HTML
    <WebMethod()> _
    Public Function getArchiveDataHTML() As String
        Dim html As String = ""
        Dim strMonths() As String = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"}

        Try
            Dim months As List(Of RowClass) = getArchiveData()

            If months.Count > 0 Then
                html = "<ul class=""recent-posts"">"

                For i As Integer = 0 To months.Count - 1
                    Dim m As RowClass = months(i)
                    html &= "<li><a href=""/news/" & m.cols("postYear") & "/" & strMonths(m.cols("postMonth") - 1).ToLower & """ data-month=""" & m.cols("postMonth") & """ data-year=""" & m.cols("postYear") & """>" & strMonths(m.cols("postMonth") - 1) & " " & m.cols("postYear") & " (" & m.cols("postCount") & ")</a></li>"
                Next
            Else
                html = "Unable to load archives at this time."
            End If
        Catch ex As Exception
            html = "Unable to load archives at this time."
        End Try

        Return html
    End Function

    ' Load blogs by archive
    <WebMethod()> _
    Public Function loadArchiveBlogs(ByVal year As String, ByVal month As String) As String
        Dim strMonths() As String = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"}
        Dim html As String = ""

        Try
            Dim intMonth As Integer = -1
            For i As Integer = 0 To strMonths.Count - 1
                If month = strMonths(i).ToLower Then
                    intMonth = i + 1
                    i = strMonths.Count
                End If
            Next

            Dim ta As New dsBlogTableAdapters.BlogTableAdapter
            Dim ds As New dsBlog
            ta.FillByArchive(ds.Blog, year, intMonth.ToString)
            Dim blogs As List(Of RowClass) = New DataSetToListClass(ds.Blog).ReturnDS

            If blogs.Count > 0 Then
                For i As Integer = 0 To blogs.Count - 1
                    html &= loadBlogHTML(blogs(i), False)
                Next
            Else
                html = "<p>No blogs found for " & month & " " & year & ".</p>"
            End If

        Catch ex As Exception
            html = "<p>Unable to load blogs at this time.</p>"
        End Try

        Return html
    End Function

#End Region

#Region "RSS Feed"

    Private Function buildRSSFile() As Boolean
        Dim isProduction As Boolean = False
        If HttpContext.Current.Request.Url.Host.Contains("select-interactive.com") Then
            isProduction = True
        End If

        ' Development
        Dim objX As XmlTextWriter


        If isProduction = True Then
            ' Production
            objX = New XmlTextWriter("D:\Webcustomers\Select Interactive\www.select-interactive.com\wwwroot\feed\rssfeed.xml", System.Text.Encoding.UTF8)
        Else
            ' Development
            objX = New XmlTextWriter("C:\inetpub\wwwroot\Select Interactive\feed\rssfeed.xml", System.Text.Encoding.UTF8)
        End If

        objX.WriteStartDocument()
        objX.WriteStartElement("rss")
        objX.WriteAttributeString("version", "2.0")
        objX.WriteStartElement("channel")
        objX.WriteElementString("title", "News from Select Interactive")
        If isProduction = True Then
            objX.WriteElementString("link", "http://select-interactive.com/news/")
        Else
            objX.WriteElementString("link", "http://select/news/")
        End If
        objX.WriteElementString("description", "The latest news, projects, thoughts, ideas and announcements from Select Interactive.")
        objX.WriteElementString("ttl", "5")

        Dim objConnection As New SqlConnection("Server=216.62.58.25;Initial Catalog=Select Interactive;Persist Security Info=True;User ID=sa;Password=danh4741")
        objConnection.Open()
        Dim sql As String = "select top 10 blogId, title, body, datePosted, isActive, webUrl, metadesc, metakeywords from SI_Blog where isActive = 1 order by datePosted desc"
        Dim objCommand As New SqlCommand(sql, objConnection)
        Dim objReader As SqlDataReader = objCommand.ExecuteReader()
        While objReader.Read()
            objX.WriteStartElement("item")
            objX.WriteElementString("title", objReader.GetString(1))
            'If objReader.GetString(2).Length > 500 Then
            'objX.WriteElementString("description", objReader.GetString(2).Substring(0, 500) + " ...read more...")
            'Else
            objX.WriteElementString("description", objReader.GetString(2))
            'End If

            If isProduction = True Then
                objX.WriteElementString("link", "http://select-interactive.com/news/" + objReader.GetString(5))
            Else
                objX.WriteElementString("link", "http://select/news/" + objReader.GetString(5))
            End If


            objX.WriteElementString("pubDate", FormatDateTime(objReader.GetDateTime(3), DateFormat.GeneralDate))
            objX.WriteEndElement()
        End While
        objReader.Close()
        objConnection.Close()

        objX.WriteEndElement()
        objX.WriteEndElement()
        objX.WriteEndDocument()
        objX.Flush()
        objX.Close()

        Return True
    End Function

#End Region

End Class