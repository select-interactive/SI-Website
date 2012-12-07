
Partial Class portfolio_Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles MyBase.Load
        Dim body As Control = Master.FindControl("MasterBody")
        body.ID = "portfolio"
    End Sub

End Class
