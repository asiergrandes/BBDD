Public Class FormVerPELICULAS
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Mostrar_Click(sender As Object, e As EventArgs) Handles Mostrar.Click
        Dim varNombre As String 'Se declara una variable de tipo string llamada varNombre
        varNombre = Me.Nombre.Text 'Se asigna a esa variable el valor de la caja de texto
        Me.Mensaje.Text = ”Hola “ & varNombre & “ !” 'Se concatena con & y se pone en el Label
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged

    End Sub

    Private Sub Label1_Load(sender As Object, e As EventArgs) Handles quincena.Load
        Dim ahora As String
        ahora = Now
        Me.quincena.Text = "ESTRENOS QUINCENA (fecha de hoy = " & ahora & " )"


    End Sub




End Class