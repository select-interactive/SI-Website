
Partial Class controls_footer
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles MyBase.Load
        If HttpContext.Current.User.Identity.IsAuthenticated Then
            ltrlLoggedIn.Text = "// <a href=""#"" class=""logout"">Logout</a>"
        End If
    End Sub

End Class
