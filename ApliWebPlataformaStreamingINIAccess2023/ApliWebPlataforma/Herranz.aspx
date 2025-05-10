<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Herranz.aspx.vb" Inherits="ApliWebPlataforma.Herranz" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 7px;
        }
        .auto-style2 {
            width: 733px;
        }
        .auto-style3 {
            width: 733px;
            height: 21px;
        }
        .auto-style4 {
            width: 7px;
            height: 21px;
        }
        .auto-style5 {
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
    <table style="width: 100%;">
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Titulo" runat="server" Font-Bold="True" Font-Size="Large" Font-Underline="True" ForeColor="#546E96" Text="VALORACION MEDIA SUPERIOR A UN NUMERO DE LAS PELICULAS DE UN AÑO"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="TEXTO" runat="server" Text="las medias de las valoraciones de todas las peliculas del año pedido, solo saldran las medias de las peliculas con una valoracion media superior al numero entre 0 y 5 (con coma como indicador decimal) , saldran ordenadas de mayor a menor media. ( recomiendo poner año 2018 )"></asp:Label>
            </td>
            <td class="auto-style4"></td>
            <td class="auto-style5"></td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:TextBox ID="TextoAño" runat="server" Width="204px">Introduzca el año</asp:TextBox>
            </td>
            <td class="auto-style1">
                <asp:Button ID="ValoracionesMedias" runat="server" Text="Enseñar Valoraciones" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:TextBox ID="ValoracionMinima" runat="server" Width="207px">Introduzca la valoracion minima</asp:TextBox>
            </td>
            <td class="auto-style1">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:AccessDataSource ID="valoraciones" runat="server" DataFile="C:\temp\PlataformaStreaming_Grandes_Herranz.mdb" SelectCommand="select pelicula.titulo , Round(Avg(valoracion.valoracion), 2) as valoracion_media
from pelicula inner join valoracion on pelicula.codigo = valoracion.codigo
where year(pelicula.fecha_estreno) = ?
group by titulo HAVING avg(valoracion.valoracion) &gt;= ?
order by avg(valoracion.valoracion) DESC;">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextoAño" Name="?" PropertyName="Text" />
                        <asp:ControlParameter ControlID="ValoracionMinima" Name="?" PropertyName="Text" />
                    </SelectParameters>
                </asp:AccessDataSource>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderColor="#465767" DataSourceID="valoraciones" Height="146px" PageSize="7" Width="796px">
                    <Columns>
                        <asp:BoundField DataField="titulo" HeaderText="titulo" SortExpression="titulo" />
                        <asp:BoundField DataField="valoracion_media" HeaderText="valoracion_media" ReadOnly="True" SortExpression="valoracion_media" />
                    </Columns>
                    <HeaderStyle BackColor="#546E96" Font-Bold="True" ForeColor="White" />
                    <RowStyle Width="200px" Wrap="True" />
                </asp:GridView>
            </td>
            <td class="auto-style1">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</div>
</asp:Content>
