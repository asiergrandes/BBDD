<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="FormularioFuncionesADM.aspx.vb" Inherits="ApliWebPlataforma.FormularioFuncionesADM" %>
   <asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
      <style type="text/css">
        .style2
        {
            width: 66px;
        }
        .style3
        {
            text-align: justify;
            
        }
        .style12
        {
            width: 10px;
        }
        .style20
        {
            width: 202px;
        }
        .style23
        {
            width: 73px;
        }
        .style24
        {
            width: 309px;
           
        }
        .style27
        {
            width: 320px;
        }
        .style28
        {
            width: 174px;
        }
        .style31
        {
            width: 158px;
              color: #FF0000;
          }
        .style32
        {
            width: 185px;
        }
        .style37
        {
            font-size: large;
        }
            .style100
        {
            
            color:Black;
            font-size:medium;
              height: 2096px;
              width: 879px;
          }
          .style102
          {
              text-decoration: underline;
              font-weight: bold;
              font-size: large;
          }
          .style103
          {
              width: 320px;
              color: #FF0000;
          }
          .style104
          {
              width: 309px;
              color: #FF0000;
          }
    </style>
 </asp:Content>
   

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="header"><h1 class="style37">Funciones ADMINISTRADOR</h1></div>
    <div class="style100">
    
        <br />

        <table >
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    Realice todas las funciones que quiera . Rellene los datos oportunos y pulse el 
                    botón.<br />
                    </td>
            </tr>
        </table>
            <br />
            <table >
                <tr>
                    <td class="style32">
                        &nbsp;</td>
                    <td class="style102">
                        Cambiar estado de un usuario</td>
                </tr>
        </table>
        <table >
            <tr>
                <td class="style20">
                    &nbsp;</td>
                <td class="style27" >
                    Cuenta del usuario a 
                    cambiar de estado</td>
                <td class="style28">
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="login_usuario" DataTextField="usuariologin" DataValueField="usuariologin">
                    </asp:DropDownList>
                    <asp:AccessDataSource ID="login_usuario" runat="server" DataFile="C:\temp\PlataformaStreaming_Grandes_Herranz.mdb" SelectCommand="select usuariologin from usuarioreg where usuariologin &lt;&gt; 'administrador'"></asp:AccessDataSource>
                </td>
                <td>
                    <asp:Button ID="cambiarEstadoSocio" runat="server" Text="Cambiar estado" />
                </td>
            </tr>
            <tr>
                <td class="style20">
                    &nbsp;</td>
                <td class="style103" >
                    <asp:DataList ID="DatosUsuario" runat="server" DataKeyField="UsuarioLogin" DataSourceID="usuario_todo">
                        <ItemTemplate>
                            UsuarioLogin:
                            <asp:Label ID="UsuarioLoginLabel" runat="server" Text='<%# Eval("UsuarioLogin") %>' />
                            <br />
                            Nombre_Apellido:
                            <asp:Label ID="Nombre_ApellidoLabel" runat="server" Text='<%# Eval("Nombre_Apellido") %>' />
                            <br />
                            Direccion:
                            <asp:Label ID="DireccionLabel" runat="server" Text='<%# Eval("Direccion") %>' />
                            <br />
                            Credito:
                            <asp:Label ID="CreditoLabel" runat="server" Text='<%# Eval("Credito") %>' />
                            <br />
                            Fecha_Hora_Alta:
                            <asp:Label ID="Fecha_Hora_AltaLabel" runat="server" Text='<%# Eval("Fecha_Hora_Alta") %>' />
                            <br />
                            Estado:
                            <asp:Label ID="EstadoLabel" runat="server" Text='<%# Eval("Estado") %>' />
                            <br />
<br />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:AccessDataSource ID="usuario_todo" runat="server" DataFile="C:\temp\PlataformaStreaming_Grandes_Herranz.mdb" SelectCommand="select * from usuarioreg where usuariologin = ?">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="?" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:AccessDataSource>
                </td>
                <td class="style28">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="mostrarDatosSocio" runat="server" Text="Mostrar/Ocultar usuario" />
                </td>
            </tr>
        </table>
             
               <br />
        <table >
            <tr>
                <td class="style32">
                    &nbsp;</td>
                <td class="style102">
                    Dar de alta una película</td>
            </tr>
        </table>
        <table >
            <tr>
                <td class="style20">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
                <td class="style24">
                    Código de la película a dar de alta</td>
                <td class="style31">
                    <asp:TextBox ID="codPeliculaAlta" runat="server"  
                        ToolTip="Introduzca el código de la película a dar de alta" SkinID="-1">Introduzca codigo</asp:TextBox>
                </td>
                <td class="style23">
                    <asp:Button ID="DarDeAltaPeli" runat="server" Text="Dar de alta película" />
                    </td>
            </tr>
            <tr>
                <td class="style20">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
                <td class="style24">
                    Titulo (con año entre parentesis)</td>
                <td class="style31">
                    <asp:TextBox ID="tituloPeliculaAlta" runat="server">ejemplo ( año )</asp:TextBox>
                </td>
                <td class="style23">
                    &nbsp;</td>
            </tr>
            </table>
                      <br />
        <table >
            <tr>
                <td class="style32">
                    &nbsp;</td>
                <td class="style102">
                    Dar de baja una película</td>
            </tr>
        </table>
        <table >
            <tr>
                <td class="style20">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
                <td class="style24">
                    Código de la película a dar de baja</td>
                <td class="style31">
                    <asp:DropDownList ID="codPeliculaBaja" runat="server" DataSourceID="peliculas" DataTextField="codigo" DataValueField="codigo">
                    </asp:DropDownList>
                    <asp:AccessDataSource ID="peliculas" runat="server" DataFile="C:\temp\PlataformaStreaming_Grandes_Herranz.mdb" SelectCommand="select codigo from pelicula"></asp:AccessDataSource>
                </td>
                <td class="style23">
                    <asp:Button ID="DarDeBajaPeli" runat="server" Text="Dar de baja esta película" />
                    </td>
            </tr>
            <tr>
                <td class="style20">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
                <td class="style104">
                    <asp:DataList ID="DatosPeli" runat="server" DataKeyField="Codigo" DataSourceID="peliculas_todo">
                        <ItemTemplate>
                            Codigo:
                            <asp:Label ID="CodigoLabel" runat="server" Text='<%# Eval("Codigo") %>' />
                            <br />
                            Titulo:
                            <asp:Label ID="TituloLabel" runat="server" Text='<%# Eval("Titulo") %>' />
                            <br />
                            Precio:
                            <asp:Label ID="PrecioLabel" runat="server" Text='<%# Eval("Precio") %>' />
                            <br />
                            Estado:
                            <asp:Label ID="EstadoLabel" runat="server" Text='<%# Eval("Estado") %>' />
                            <br />
                            Fecha_Liberacion:
                            <asp:Label ID="Fecha_LiberacionLabel" runat="server" Text='<%# Eval("Fecha_Liberacion") %>' />
                            <br />
                            Fecha_Fin_Disp:
                            <asp:Label ID="Fecha_Fin_DispLabel" runat="server" Text='<%# Eval("Fecha_Fin_Disp") %>' />
                            <br />
<br />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:AccessDataSource ID="peliculas_todo" runat="server" DataFile="C:\temp\PlataformaStreaming_Grandes_Herranz.mdb" SelectCommand="select * from pelicula where codigo = ?">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="codPeliculaBaja" Name="?" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:AccessDataSource>
                </td>
                <td class="style31">
                    &nbsp;</td>
                <td class="style23">
                    <asp:Button ID="mostrarDatosPeli" runat="server" 
                        Text="Mostrar/Ocultar película" />
                </td>
            </tr>
            </table>
    <table>
    <asp:Button ID="VolverPrincipal" runat="server" Text="Volver a la Página Principal" />
    </table>
    </div>
</asp:Content>
