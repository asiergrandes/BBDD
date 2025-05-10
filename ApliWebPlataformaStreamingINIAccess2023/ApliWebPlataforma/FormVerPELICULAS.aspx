<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="FormVerPELICULAS.aspx.vb" Inherits="ApliWebPlataforma.FormVerPELICULAS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<style type="text/css">
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
        width: 477px;
    }
    .style103
    {
        font-weight: bold;
        font-size: large;
        width: 477px;
        color: red;
    }
    .auto-style1 {
        text-decoration: underline;
        font-weight: bold;
        font-size: large;
        width: 650px;
    }
    .auto-style2 {
        font-weight: bold;
        font-size: large;
        width: 650px;
        color: red;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="header"><h1 class="style37">Catálogo PELÍCULAS</h1></div>
 <div class="style100">
 <br />
            <table >
             <tr>
                    <td class="style32">
                        &nbsp;</td>
                    <td class="auto-style1">
                        <asp:Label ID="quincena" runat="server"></asp:Label>
                        </td>
                </tr>
             <tr>
                    <td class="style32">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" Width="205px" AllowPaging="True" PageSize="5" EnableSortingAndPagingCallbacks="True" AllowSorting="True">
                            <Columns>
                                <asp:BoundField DataField="titulo" HeaderText="titulo" SortExpression="titulo" />
                            </Columns>
                            <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Size="Large" Font-Strikeout="False" Font-Underline="True" />
                        </asp:GridView>
                        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="C:\temp\PlataformaStreaming_Grandes_Herranz.mdb" SelectCommand="select titulo from pelicula"></asp:AccessDataSource>
                    </td>
                    <td class="auto-style2">
                        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="ultimaquincena" PageSize="5" BackColor="White" BorderColor="#99CCFF" BorderStyle="Solid" BorderWidth="2px" ForeColor="Black">
                            <Columns>
                                <asp:BoundField DataField="Titulo" HeaderText="Titulo" SortExpression="Titulo" />
                                <asp:BoundField DataField="Fecha_Alta" HeaderText="Fecha_Alta" SortExpression="Fecha_Alta" />
                            </Columns>
                            <HeaderStyle BackColor="#339966" BorderColor="#339966" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" ForeColor="White" />
                            <PagerStyle ForeColor="Black" />
                        </asp:GridView>
                        <asp:AccessDataSource ID="ultimaquincena" runat="server" DataFile="C:\temp\PlataformaStreaming_Grandes_Herranz.mdb" SelectCommand="SELECT [Titulo], [Fecha_Liberacion] as Fecha_Alta FROM [PELICULA] where datediff(&quot;d&quot;, now(), fecha_liberacion) &lt;=15"></asp:AccessDataSource>
                    </td>
                </tr>
             <tr>
                    <td class="style32">
                        Pon un nombre aquí:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="Nombre" runat="server"></asp:TextBox>
                        <asp:Button ID="Mostrar" runat="server" Text="Mostrar Saludo" />
                    </td>
                </tr>
             <tr>
                    <td class="style32">
                        &nbsp;</td>
                    <td class="auto-style2">
                        <asp:Label ID="Mensaje" runat="server"></asp:Label>
                    </td>
                </tr>
                </table>
 </div>
</asp:Content>
