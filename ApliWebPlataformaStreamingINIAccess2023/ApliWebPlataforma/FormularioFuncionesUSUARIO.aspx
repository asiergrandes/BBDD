<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="FormularioFuncionesUSUARIO.aspx.vb" Inherits="ApliWebPlataforma.FormularioFuncionesUSUARIO" %>
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
        .style30
        {
            width: 160px;
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
            height: 525px;
            color:Black;
            font-size:medium;
        }
          .style102
          {
              text-decoration: underline;
              font-weight: bold;
              font-size: large;
          }
    </style>
 </asp:Content>
   

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="header"><h1 class="style37">Funciones USUARIO REGISTRADO</h1></div>
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
                        Modificar mis datos personales</td>
                </tr>
        </table>
        <table >
            <tr>
                <td class="style20">
                    &nbsp;</td>
                <td class="style27" >
                    Nombre 
                    y apellidos</td>
                <td class="style28">
                    <asp:TextBox ID="Nombre" runat="server"  
                        ToolTip="Introduzca su nombre y apellidos" SkinID="-1"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="Modificar" runat="server" Text="Modificar datos" />
                </td>
            </tr>
            <tr>
                <td class="style20">
                    &nbsp;</td>
                <td class="style27" >
                    Dirección</td>
                <td class="style28">
                    <asp:TextBox ID="Direccion" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
             
            <table >
                <tr>
                    <td class="style32">
                        &nbsp;</td>
                    <td class="style102">
                        Aumentar mi crédito</td>
                </tr>
        </table>
        <table >
            <tr>
                <td class="style20">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
                <td class="style24">
                    Introduzca aquí la cantidad en euros</td>
                <td class="style30">
                    <asp:TextBox ID="cantidadEuros" runat="server" Width="60px" ToolTip="Introduzca la cantidad en euros a aumentar el crédito" 
                        SkinID="-1"></asp:TextBox>
                </td>
                <td class="style23">
                    <asp:Button ID="Aumentar" runat="server" Text="Aumentar crédito" />
                    </td>
                <td>
                    &nbsp;</td>
            </tr>
            </table>
             <br />
        <table >
            <tr>
                <td class="style32">
                    &nbsp;</td>
                <td class="style102">
                    Alquilar película</td>
            </tr>
        </table>
        <table >
            <tr>
                <td class="style20">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
                <td class="style24">
                    Seleccione de la lista la película a alquilar</td>
                <td class="style31">
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="peliculasdisponilbes" DataTextField="titulo" DataValueField="titulo">
                    </asp:DropDownList>
                    <asp:AccessDataSource ID="peliculasdisponilbes" runat="server" DataFile="C:\temp\PlataformaStreaming_Grandes_Herranz.mdb" SelectCommand="select titulo 
from pelicula
where estado= 'disponible'"></asp:AccessDataSource>
                </td>
                <td class="style23">
                    <asp:Button ID="Alquilar" runat="server" Text="Alquilar" />
                    </td>
            </tr>
            </table>
                      <br />
        <table >
            <tr>
                <td class="style32">
                    &nbsp;</td>
                <td class="style102">
                    Devolver película</td>
            </tr>
        </table>
        <table >
            <tr>
                <td class="style20">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
                <td class="style24">
                    Seleccione de la lista la película a devolver</td>
                <td class="style31">
                    <asp:DropDownList ID="DropDownList2" runat="server" DataTextField="TITULO" DataValueField="TITULO" DataSourceID="peliculasAlquiladasPorUsuario">
                    </asp:DropDownList>
                    <asp:AccessDataSource ID="peliculasAlquiladasPorUsuario" runat="server" DataFile="c:\TEMP\PlataformaStreaming_Grandes_Herranz.mdb" SelectCommand="SELECT PELICULA.TITULO FROM PELICULA INNER JOIN ALQUILER ON PELICULA.CODIGO = ALQUILER.CODIGO WHERE PELICULA.ESTADO = 'alquilada' AND ALQUILER.USUARIOLOGIN = ?">
                        <SelectParameters>
                            <asp:SessionParameter Name="?" SessionField="usuarioLogin" />
                        </SelectParameters>
                    </asp:AccessDataSource>
                </td>
                <td class="style23">
                    <asp:Button ID="Devolver" runat="server" Text="Devolver" />
                    </td>
            </tr>
            </table>
    <table>
    <asp:Button ID="VolverPrincipal" runat="server" Text="Volver a la Página Principal" />
    </table>
    </div>
</asp:Content>
