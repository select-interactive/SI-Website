
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles MyBase.Load
        ' Load in the recent blogs for the What's Happening Section
        loadRecentBlogs()
    End Sub

    Private Sub loadRecentBlogs()
        ltrlLatestBlogs.Text = (New wsBlog).loadRecentPostsList()
    End Sub

End Class
