Imports Microsoft.VisualBasic
Imports System.Web.Compilation
Imports System.Web.UI
Imports System.Web
Imports System.Web.Routing

Public Class CustomRouteHandler : Implements IRouteHandler
    Public Property VirtualPath As String

    Public Sub New(ByVal virtualPath As String)
        Me.VirtualPath = virtualPath
    End Sub

    Public Function GetHttpHandler(requestContext As System.Web.Routing.RequestContext) As System.Web.IHttpHandler Implements System.Web.Routing.IRouteHandler.GetHttpHandler
        Dim qs As String = ""

        If Not requestContext.RouteData.Values("webUrl") Is Nothing Then
            qs = "?webUrl=" & requestContext.RouteData.Values("webUrl")
        ElseIf Not requestContext.RouteData.Values("year") Is Nothing AndAlso Not requestContext.RouteData.Values("month") Is Nothing Then
            qs = "?year=" & requestContext.RouteData.Values("year") & "&month=" & requestContext.RouteData.Values("month")
        End If

        HttpContext.Current.RewritePath(String.Concat(VirtualPath, qs))

        Dim page As IHttpHandler = BuildManager.CreateInstanceFromVirtualPath(VirtualPath, GetType(Page))
        Return page
    End Function
End Class
