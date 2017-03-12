<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="FiltroDuenno.aspx.cs" Inherits="VeterinariaWeb.Filtros.FiltroDuenno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GVFiltro" runat="server" AllowPaging="true" AllowSorting="true" AutoGenerateColumns="false" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Buscar" HeaderText="Buscar" SortExpression="Buscar" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=localhost;Initial Catalog=DBVeterinaria;Persist Security Info=True;User ID=sa;Password=123456"SelectCommand="SELECT [campo_para_buscar], [el_resto_de_tus_datos] FROM [Tu_Tabla] WHERE ([campo_para_buscar] LIKE '%' + @campo_para_buscar+ '%')">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" DefaultValue="%%" Name="campo_para_buscar" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

<add name="Default" connectionString=""/>