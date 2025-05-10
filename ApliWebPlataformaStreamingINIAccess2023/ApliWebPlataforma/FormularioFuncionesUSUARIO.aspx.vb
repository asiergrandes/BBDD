Imports System.Data.OleDb 'Para las conexiones tipo OleDb -- ACCESS
Public Class FormularioFuncionesUSUARIO
    Inherits System.Web.UI.Page
    'Asigna a Usuario el LoginName actual pasado a min�sculas (para las comparaciones)
    Dim usuario As String = StrConv(System.Web.HttpContext.Current.User.Identity.Name, VbStrConv.Lowercase)
    'Indicamos la cadena de conexion (tipo OLEDB)
    Dim cadenaConexion As String = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\TEMP\PlataformaStreaming_Grandes_Herranz.mdb"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Comprobamos que se haya iniciado sesi�n
        If usuario = "" Then
            MsgBox("Debes Iniciar Sesi�n como usuario registrado para poder operar aqu�")
            Response.Redirect("default.aspx")
        End If
        If Page.IsPostBack = False Then 'Solamente se hace cuando vaya a esta p�gina
            'DECLARAR LAS VARIABLES NECESARIAS para las instrucciones de BD
            Dim conexion As OleDb.OleDbConnection
            Dim strSQL As String
            Dim dbComm As OleDbCommand
            'PASO 1. CREAR UNA CONEXION Y ABRIRLA
            conexion = New OleDb.OleDbConnection(cadenaConexion)
            conexion.Open()
            '*******************************************************************************************
            ' SE RECUPERA EL ESTADO DEL USUARIO QUE HA INICIADO LA SESI�N
            '*******************************************************************************************
            'PASOS 2 Y 3. PREPARAR LA INSTRUCCION SQL Y EJECUTARLA
            strSQL = "SELECT estado FROM USUARIOREG WHERE usuarioLogin=?"
            dbComm = New OleDbCommand(strSQL, conexion)
            dbComm.Parameters.Add(New OleDbParameter("usuario", OleDbType.VarChar)).Value = usuario
            Dim estado As String  'Para guardar el estado del usuario en la aplicaci�n
            estado = dbComm.ExecuteScalar()    ' Ejecuta una SELECT en la que solo se obtiene un dato

            '*******************************************************************************************
            ' SI ES UN USUARIO REGISTRADO ACTIVO (su estado es A), SE MUESTRAN SUS DATOS PERSONALES
            '*******************************************************************************************
            If estado <> "A" Then
                'Si su estado no es activo visualizar un mensaje
                MsgBox("Has sido dado de baja por el administrador de la plataforma. No puedes operar.")
                Response.Redirect("default.aspx")
            Else
                'Recuperar los dem�s datos del usuario desde la BD y mostrarlos -- EJEMPLO DE SELECT
                'PASO 2. Preparar la instrucci�n SQL a ejecutar
                strSQL = "SELECT nombre_apellido,direccion,credito FROM USUARIOREG WHERE usuarioLogin='" & usuario & "'"
                dbComm = New OleDbCommand(strSQL, conexion)
                'PASO 3. Ejecutarla
                Dim datosUsuarioReader As OleDbDataReader
                datosUsuarioReader = dbComm.ExecuteReader()  'Ejecuta una SELECT que obtiene varios datos
                'Tratar el resultado, es decir, los datos obtenidos por la select
                While datosUsuarioReader.Read() 'Si hay varias filas las va leyendo una por una
                    'Se asignan los datos recuperados a los distintos TextBox de la p�gina Web
                    Me.Nombre.Text = datosUsuarioReader(0) 'Primer dato de la fila
                    Me.Direccion.Text = datosUsuarioReader(1) 'Segundo dato de la fila
                End While
            End If
            'PASO 4. CERRAR LA CONEXI�N Y LIBERAR MEMORIA
            conexion.Close()
            conexion.Dispose()
        End If
    End Sub


    Protected Sub VolverPrincipal_Click(ByVal sender As Object, ByVal e As EventArgs) Handles VolverPrincipal.Click
        Response.Redirect("default.aspx")
    End Sub

    Protected Sub Aumentar_Click(sender As Object, e As EventArgs) Handles Aumentar.Click
        Dim conexion As OleDb.OleDbConnection
        Dim instruccionSQL As String
        Dim dbComm As OleDbCommand
        conexion = New OleDb.OleDbConnection(cadenaConexion)
        conexion.Open()
        instruccionSQL = "UPDATE USUARIOREG SET CREDITO=CREDITO + ? WHERE usuarioLogin=?"
        dbComm = New OleDbCommand(instruccionSQL, conexion)
        dbComm.Parameters.Add("param1", OleDbType.Double)
        dbComm.Parameters("param1").Value = CDbl(cantidadEuros.Text)
        dbComm.Parameters.Add("param2", OleDbType.VarChar)
        dbComm.Parameters("param2").Value = usuario
        dbComm.ExecuteNonQuery()

        conexion.Close()
        conexion.Dispose()
    End Sub

    Protected Sub Modificar_Click(sender As Object, e As EventArgs) Handles Modificar.Click
        Dim conexion As OleDb.OleDbConnection
        Dim instruccionSQL As String
        Dim dbComm As OleDbCommand
        conexion = New OleDb.OleDbConnection(cadenaConexion)
        conexion.Open()
        instruccionSQL = "UPDATE USUARIOREG SET NOMBRE_APELLIDO = ? , DIRECCION = ? WHERE USUARIOLOGIN = ?"
        dbComm = New OleDbCommand(instruccionSQL, conexion)
        dbComm.Parameters.Add("param1", OleDbType.VarChar)
        dbComm.Parameters("param1").Value = Nombre.Text
        dbComm.Parameters.Add("param2", OleDbType.VarChar)
        dbComm.Parameters("param2").Value = Direccion.Text
        dbComm.Parameters.Add("param3", OleDbType.VarChar)
        dbComm.Parameters("param3").Value = usuario
        dbComm.ExecuteNonQuery()
        conexion.Close()
        conexion.Dispose()
    End Sub

    Private Sub Alquilar_Click(sender As Object, e As EventArgs) Handles Alquilar.Click
        Dim conexion As OleDb.OleDbConnection
        Dim instruccionSQL As String
        Dim dbComm As OleDbCommand
        Dim transaccion As OleDbTransaction
        conexion = New OleDb.OleDbConnection(cadenaConexion)
        conexion.Open()

        transaccion = conexion.BeginTransaction()

        Try
            instruccionSQL = "select credito from usuarioreg where usuariologin= ?"
            dbComm = New OleDbCommand(instruccionSQL, conexion, transaccion)
            dbComm.Parameters.Add("param1", OleDbType.VarChar)
            dbComm.Parameters("param1").Value = usuario
            Dim credito As Double
            credito = dbComm.ExecuteScalar()

            instruccionSQL = "select precio from pelicula where titulo= ?"
            dbComm = New OleDbCommand(instruccionSQL, conexion, transaccion)
            dbComm.Parameters.Add("param1", OleDbType.VarChar)
            dbComm.Parameters("param1").Value = DropDownList1.Text
            Dim precio As Double
            precio = dbComm.ExecuteScalar()

            instruccionSQL = "select codigo from pelicula where titulo= ?"
            dbComm = New OleDbCommand(instruccionSQL, conexion, transaccion)
            dbComm.Parameters.Add("param1", OleDbType.VarChar)
            dbComm.Parameters("param1").Value = DropDownList1.Text
            Dim codigo As Integer
            codigo = dbComm.ExecuteScalar()

            If credito >= precio Then
                If precio = 0 Then
                    instruccionSQL = "insert into alquiler(usuariologin,codigo,fechainicio) values (?,?,date())"
                    dbComm = New OleDbCommand(instruccionSQL, conexion, transaccion)
                    dbComm.Parameters.Add("param1", OleDbType.VarChar)
                    dbComm.Parameters("param1").Value = usuario
                    dbComm.Parameters.Add("param2", OleDbType.Integer)
                    dbComm.Parameters("param2").Value = codigo
                    dbComm.ExecuteNonQuery()

                    instruccionSQL = "update pelicula set estado = 'alquilada' where codigo = ?"
                    dbComm = New OleDbCommand(instruccionSQL, conexion, transaccion)
                    dbComm.Parameters.Add("param1", OleDbType.Integer)
                    dbComm.Parameters("param1").Value = codigo
                    dbComm.ExecuteNonQuery()
                Else
                    instruccionSQL = "update usuarioreg set credito = credito - ? where usuariologin = ?"
                    dbComm = New OleDbCommand(instruccionSQL, conexion, transaccion)
                    dbComm.Parameters.Add("param1", OleDbType.Double)
                    dbComm.Parameters("param1").Value = precio
                    dbComm.Parameters.Add("param2", OleDbType.VarChar)
                    dbComm.Parameters("param2").Value = usuario
                    dbComm.ExecuteNonQuery()

                    instruccionSQL = "insert into alquiler(usuariologin,codigo,fechainicio,fechafin) values (?,?,DATE(),DATEADD('d', 2, DATE()))"
                    dbComm = New OleDbCommand(instruccionSQL, conexion, transaccion)
                    dbComm.Parameters.Add("param1", OleDbType.VarChar)
                    dbComm.Parameters("param1").Value = usuario
                    dbComm.Parameters.Add("param2", OleDbType.Integer)
                    dbComm.Parameters("param2").Value = codigo
                    dbComm.ExecuteNonQuery()

                    instruccionSQL = "update pelicula set estado = 'alquilada' where codigo = ?"
                    dbComm = New OleDbCommand(instruccionSQL, conexion, transaccion)
                    dbComm.Parameters.Add("param1", OleDbType.Integer)
                    dbComm.Parameters("param1").Value = codigo
                    dbComm.ExecuteNonQuery()
                End If
            End If

            transaccion.Commit()
        Catch ex As Exception
            transaccion.Rollback()
        End Try
        
        DropDownList1.DataBind()
        DropDownList2.DataBind()

        conexion.Close()
        conexion.Dispose()
    End Sub

    Protected Sub Devolver_Click(sender As Object, e As EventArgs) Handles Devolver.Click
        Dim conexion As OleDb.OleDbConnection
        Dim instruccionSQL As String
        Dim dbComm As OleDbCommand
        Dim transaccion As OleDbTransaction
        conexion = New OleDb.OleDbConnection(cadenaConexion)
        conexion.Open()

        transaccion = conexion.BeginTransaction()

        Try
            instruccionSQL = "select codigo from pelicula where titulo= ?"
            dbComm = New OleDbCommand(instruccionSQL, conexion, transaccion)
            dbComm.Parameters.Add("param1", OleDbType.VarChar)
            dbComm.Parameters("param1").Value = DropDownList2.Text
            Dim codigo As Integer
            codigo = dbComm.ExecuteScalar()

            instruccionSQL = "select precio from pelicula where titulo= ?"
            dbComm = New OleDbCommand(instruccionSQL, conexion, transaccion)
            dbComm.Parameters.Add("param1", OleDbType.VarChar)
            dbComm.Parameters("param1").Value = DropDownList1.Text
            Dim precio As Double
            precio = dbComm.ExecuteScalar()

            instruccionSQL = "select fechafin from alquiler where codigo= ?"
            dbComm = New OleDbCommand(instruccionSQL, conexion, transaccion)
            dbComm.Parameters.Add("param1", OleDbType.VarChar)
            dbComm.Parameters("param1").Value = codigo
            Dim fechafin As Date
            fechafin = dbComm.ExecuteScalar()

            instruccionSQL = "update pelicula set estado = 'disponible' where codigo = ?"
            dbComm = New OleDbCommand(instruccionSQL, conexion, transaccion)
            dbComm.Parameters.Add("param1", OleDbType.Integer)
            dbComm.Parameters("param1").Value = codigo
            dbComm.ExecuteNonQuery()

            If DateTime.Now > fechafin Then
                instruccionSQL = "update usuarioreg set credito = credito - precio*DATEDIFF('d',DATE(),fechafin) where usuariologin = ?"
                dbComm = New OleDbCommand(instruccionSQL, conexion, transaccion)
                dbComm.Parameters.Add("param1", OleDbType.VarChar)
                dbComm.Parameters("param1").Value = usuario
                dbComm.ExecuteNonQuery()
            End If

            transaccion.Commit()

        Catch ex As Exception
            transaccion.Rollback()
        End Try

        DropDownList1.DataBind()
        DropDownList2.DataBind()

        conexion.Close()
        conexion.Dispose()
    End Sub
End Class