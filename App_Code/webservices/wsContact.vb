Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Net.Mail

<System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class wsContact
    Inherits System.Web.Services.WebService

    <WebMethod()> _
    Public Function sendContactMessage(ByVal reason As String, ByVal name As String, ByVal email As String, ByVal phone As String, ByVal message As String) As String
        Try
            ' Validate the email address
            If Not Regex.IsMatch(email, "\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*") Then
                Return "Invalid email address."
            End If

            ' Generate the email
            Dim htmlBody As String = "<html><body style=""margin:0;padding:0;color:#444;background-color:#f8f8f9;"">" _
                                   & "<table align=""center"" border=""0"" cellspacing=""0"" cellpadding=""0"" style=""margin:0 auto;padding:0;width:550px;background:#eaeaea;"">" _
                                   & "  <tr><td style=""padding:20px;color:#444;font-family:Arial,Sans-Serif;font-size: 10pt;"">" _
                                   & "      <div style=""margin:0 0 20px 0;text-align:center;""><img src=""http://select-interactive.com/img/logos/SI-75height.png"" alt=""Select Interactive"" /></div>" _
                                   & "      <p>" & name & " has completed the contact us form. Information provided below&mdash;</p>" _
                                   & "      <p style=""margin-bottom:0px;"">Email: " & email & "<br /><br />Phone: " & phone & "<br /><br />Contact Reason: " & reason & "<br /><br />Message:</p>" _
                                   & "      <p style=""margin-top:2px;padding:8px;border:1px solid #e4e4e4;background:#f7f7f7;"">" & message & "</p>" _
                                   & "      <p style=""font-size:9pt;"">Do not respond to this email. It was automatically generated for Select Interactive.</p>" _
                                   & "  </td></tr>" _
                                   & "</table>" _
                                   & "</body></html>"

            Dim smtp As New SmtpClient
            Dim authenInfo As New Net.NetworkCredential("azure_50acdae6efeeb5f758ff025f581db3a7@azure.com", "danh5258")
            smtp.UseDefaultCredentials = False
            smtp.Credentials = authenInfo
            smtp.Port = "25"
            smtp.Host = "smtp.sendgrid.net"

            Dim mm As New MailMessage("""Select Interactive"" <contact-request@select-interactive.com>", "jeremy@select-interactive.com")
            With mm
                .IsBodyHtml = True
                .Subject = "Contact Request From Website"
                .Body = htmlBody
            End With

            smtp.Send(mm)
        Catch ex As Exception
            Return ex.ToString()
        End Try

        Return "success"
    End Function

End Class
