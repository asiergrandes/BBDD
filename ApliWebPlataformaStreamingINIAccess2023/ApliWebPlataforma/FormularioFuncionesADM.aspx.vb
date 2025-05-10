Imports System.Data.OleDb 'Para las conexiones tipo OleDb -- ACCESS

Public Class FormularioFuncionesADM
    Inherits System.Web.UI.Page
    'Asigna a Usuario el LoginName actual pasado a minúsculas (para las comparaciones)
    Dim usuario As String = StrConv(System.Web.HttpContext.Current.User.Identity.Name, VbStrConv.Lowercase)
    Dim cadenaConexion As String = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\TEMP\PlataformaStreaming_Grandes_Herranz.mdb"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Asegurarse de que ha iniciado sesión como administrador
        If usuario = "" Then
            MsgBox("Debes Iniciar Sesión como administrador para poder operar aqui")
            Response.Redirect("default.aspx")
        Else
            If usuario <> "administrador" Then
                MsgBox("No eres el administrador. Solo puedes realizar las funciones del Usuario")
                Response.Redirect("default.aspx")
            End If
        End If
    End Sub

    Protected Sub VolverPrincipal_Click(sender As Object, e As EventArgs) Handles VolverPrincipal.Click
        Response.Redirect("default.aspx")
    End Sub

    Protected Sub cambiarEstadoSocio_Click(sender As Object, e As EventArgs) Handles cambiarEstadoSocio.Click
        Dim conexion As OleDb.OleDbConnection
        Dim instruccionSQL As String
        Dim dbComm As OleDbCommand
        conexion = New OleDb.OleDbConnection(cadenaConexion)
        conexion.Open()
        instruccionSQL = "select estado from usuarioreg where usuariologin = ?"
        dbComm = New OleDbCommand(instruccionSQL, conexion)
        dbComm.Parameters.Add("param1", OleDbType.VarChar)
        dbComm.Parameters("param1").Value = DropDownList1.Text
        Dim estado As String
        estado = dbComm.ExecuteScalar()
        If estado = "A" Then
            instruccionSQL = "update usuarioreg set estado = 'B' where usuariologin = ?"
            dbComm = New OleDbCommand(instruccionSQL, conexion)
            dbComm.Parameters.Add("param1", OleDbType.VarChar)
            dbComm.Parameters("param1").Value = DropDownList1.Text
            dbComm.ExecuteNonQuery()
        Else
            instruccionSQL = "update usuarioreg set estado = 'A' where usuariologin = ?"
            dbComm = New OleDbCommand(instruccionSQL, conexion)
            dbComm.Parameters.Add("param1", OleDbType.VarChar)
            dbComm.Parameters("param1").Value = DropDownList1.Text
            dbComm.ExecuteNonQuery()

        End If

        conexion.Close()
        conexion.Dispose()
    End Sub

    Protected Sub mostrarDatosSocio_Click(sender As Object, e As EventArgs) Handles mostrarDatosSocio.Click

        If DatosUsuario.Visible Then
            DatosUsuario.Visible = False
        Else
            DatosUsuario.DataBind()


            DatosUsuario.Visible = True
        End If
    End Sub

    Private Sub DarDeAltaPeli_Click(sender As Object, e As EventArgs) Handles DarDeAltaPeli.Click
        Dim conexion As OleDb.OleDbConnection
        Dim instruccionSQL As String
        Dim dbComm As OleDbCommand
        conexion = New OleDb.OleDbConnection(cadenaConexion)
        conexion.Open()
        instruccionSQL = "insert into pelicula(codigo, titulo) values ( ?, ?);"
        dbComm = New OleDbCommand(instruccionSQL, conexion)
        dbComm.Parameters.Add("param1", OleDbType.Integer)
        dbComm.Parameters("param1").Value = codPeliculaAlta.Text
        dbComm.Parameters.Add("param2", OleDbType.VarChar)
        dbComm.Parameters("param2").Value = tituloPeliculaAlta.Text
        dbComm.ExecuteNonQuery()
        conexion.Close()
        conexion.Dispose()

    End Sub

    Private Sub DarDeBajaPeli_Click(sender As Object, e As EventArgs) Handles DarDeBajaPeli.Click
        Dim conexion As OleDb.OleDbConnection
        Dim instruccionSQL As String
        Dim dbComm As OleDbCommand
        conexion = New OleDb.OleDbConnection(cadenaConexion)
        conexion.Open()
        instruccionSQL = "select estado from pelicula where codigo = ?"
        dbComm = New OleDbCommand(instruccionSQL, conexion)
        dbComm.Parameters.Add("param1", OleDbType.Integer)
        dbComm.Parameters("param1").Value = codPeliculaBaja.Text
        Dim estado As String
        estado = dbComm.ExecuteScalar()

        If estado = "descatalogada" Then
            instruccionSQL = "select Fecha_Fin_Disp from pelicula where codigo = ?"
            dbComm = New OleDbCommand(instruccionSQL, conexion)
            dbComm.Parameters.Add("param1", OleDbType.Integer)
            dbComm.Parameters("param1").Value = codPeliculaBaja.Text
            Dim fecha As Date
            fecha = dbComm.ExecuteScalar()
            If Now > fecha Then
                instruccionSQL = "delete from pelicula where codigo = ?"
                dbComm = New OleDbCommand(instruccionSQL, conexion)
                dbComm.Parameters.Add("param2", OleDbType.Integer)
                dbComm.Parameters("param2").Value = codPeliculaBaja.Text
                dbComm.ExecuteNonQuery()
            End If

        Else
            instruccionSQL = "update pelicula set estado = 'descatalogada' where codigo = ?"
            dbComm = New OleDbCommand(instruccionSQL, conexion)
            dbComm.Parameters.Add("param3", OleDbType.Integer)
            dbComm.Parameters("param3").Value = codPeliculaBaja.Text
            dbComm.ExecuteNonQuery()
            instruccionSQL = "update pelicula set Fecha_Fin_Disp = DATEADD('d', 2, DATE()) where codigo = ? AND Fecha_Fin_Disp is null "
            dbComm = New OleDbCommand(instruccionSQL, conexion)
            dbComm.Parameters.Add("param4", OleDbType.Integer)
            dbComm.Parameters("param4").Value = codPeliculaBaja.Text
            dbComm.ExecuteNonQuery()
        End If
        conexion.Close()
        conexion.Dispose()
    End Sub

    Private Sub mostrarDatosPeli_Click(sender As Object, e As EventArgs) Handles mostrarDatosPeli.Click
        If DatosPeli.Visible Then
            DatosPeli.Visible = False
        Else
            DatosPeli.DataBind()


            DatosPeli.Visible = True
        End If
    End Sub
End Class