Public Class Herranz
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ValoracionesMedias_Click(sender As Object, e As EventArgs) Handles ValoracionesMedias.Click
        If GridView1.Visible Then
            GridView1.Visible = False
        Else
            GridView1.DataBind()
            GridView1.Visible = True
        End If
    End Sub
End Class