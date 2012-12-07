Imports wsContent

Partial Class work_Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles MyBase.Load
        ' Set the body ID
        Dim body As Control = Master.FindControl("MasterBody")
        body.ID = "work"

        ' Load the page content
        'Load_Content()

        ' If the user is an admin, load the edit scripts -- WE AREN'T DOING THIS RIGHT NOW
        'If User.Identity.IsAuthenticated AndAlso User.IsInRole("admin") Then
        'ltlrJS.Text = "<script defer src=""/ckeditor/ckeditor.js""></script><script defer src=""/ckeditor/adapters/jquery.js""></script>"
        'End If
    End Sub

    Protected Sub Load_Content()
        Dim ws As New wsContent

        ' Work Copy
        'ltrlWorkCopy.Text = ws.selectPageContentHTML(-1, 1)

        ' Email Hosting
        'ltrlWorkEmailDesc.Text = ws.selectPageContentHTML(-1, 2)
    End Sub

End Class
