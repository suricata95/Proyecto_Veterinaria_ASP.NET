<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="ProcesoFactura.aspx.cs" Inherits="VeterinariaWeb.Procesos.ProcesoFactura" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="form-horizontal">
        <%-- Este h4 para informar cual acción esta realizando --%>
        <h4>Generar Facturas</h4>   

        <div class="form-group">

            <asp:Label ID="Label5" runat="server" Text="Cliente" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <%-- Copie todas las clases de css para cada etiqueta , por ejemplo si quita la etiqueta "entrada" el textbox queda del ancho de la pantalla --%>
                 <asp:TextBox ID="txtDuenno" runat="server" CssClass="form-control entrada"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="validar" ErrorMessage="Ingrese el Cliente" ControlToValidate="txtDuenno" Display="Dynamic" ForeColor="#cc0000"></asp:RequiredFieldValidator>
            </div>
        </div>


        <div class="form-group">
            <asp:Label ID="Label4" runat="server" Text="Detalle" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                 <asp:DropDownList ID="ddlFactura" runat="server" AutoPostBack="true" CssClass="form-control entrada" OnSelectedIndexChanged="ddlFactura_SelectedIndexChanged"></asp:DropDownList>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <p>
                            <b>Descripción: </b>
                            <asp:Label Text="" ID="lblDescripcion" runat="server" />
                            <b>Precio :</b> <asp:Label ID="lblPrecio" Text="" runat="server" />
                        </p>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ddlFactura" EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>


         <%--<div class="form-group">
            <asp:Label ID="Label8" runat="server" Text="SubTotal" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txtSubTotal" runat="server" ReadOnly="true" CssClass="form-control entrada"></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ddlFactura" EventName="SelectedIndexChanged" />
                        
                       
                    </Triggers>
                </asp:UpdatePanel>
             
            </div>
        </div>--%>

        <div class="form-group">
            <asp:Label ID="Label1" runat="server" Text="Fecha Factura" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtFechaFactura" runat="server" CssClass="form-control entrada" placeholder="Fecha Factura"></asp:TextBox>
                <ajaxToolkit:CalendarExtender runat="server" Format="dd/MM/yyyy" PopupButtonID="ImageButton" BehaviorID="txtFecha_CalendarExt"
                    TargetControlID="txtFechaFactura" ID="txtFecha_CalendarExt"> </ajaxToolkit:CalendarExtender>
                <asp:Image ID="ImageButton" ImageUrl="~/img/calendar.png" runat="server" AlternateText="Fecha" ImageAlign="Left"/>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="validar" ErrorMessage="Ingrese la fecha de la factura" ControlToValidate="txtFechaFactura" Display="Dynamic" ForeColor="#cc0000"></asp:RequiredFieldValidator>
            </div>
        </div>


        <%--<div class="form-group">
            <asp:Label ID="Label2" runat="server" Text="Impuesto" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtImpuesto" runat="server" CssClass="form-control entrada"  ></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="validar" ErrorMessage="Ingrese el impuesto" ControlToValidate="txtImpuesto" Display="Dynamic" ForeColor="#cc0000"></asp:RequiredFieldValidator>
            </div>
        </div>--%>

        <%--<div class="form-group">
            <asp:Label ID="Label6" runat="server" Text="Descuento" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtDescuento" runat="server" CssClass="form-control entrada" ReadOnly="true"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="validar" ErrorMessage="Ingrese el descuento" ControlToValidate="txtDescuento" Display="Dynamic" ForeColor="#cc0000"></asp:RequiredFieldValidator>
            </div>
        </div>--%>

        <div class="form-group">
            <asp:Label ID="Label7" runat="server" Text="Total" CssClass="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="txtTotal" runat="server" ReadOnly="true" CssClass="form-control entrada"></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ddlFactura" EventName="SelectedIndexChanged" />
                        <%--<asp:AsyncPostBackTrigger ControlID="txtSubTotal" EventName="TextChanged" />--%>
                       
                    </Triggers>
                </asp:UpdatePanel>
                 
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                
                <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" ValidationGroup="validar" CssClass="btn btn-default" OnClick="btnNuevo_Click1"/>
            </div>
        </div>

         

      </div>


     <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
              
           <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="grvFacturas" runat="server" AutoGenerateColumns="false" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
            <Columns>
                <asp:BoundField DataField="usuario" HeaderText="Usuario" ReadOnly="True"></asp:BoundField>
                <asp:BoundField DataField="fecha" HeaderText="Fecha" ReadOnly="True"></asp:BoundField>
                <asp:BoundField DataField="nombreCliente" HeaderText="Nombre Cliente" ReadOnly="True"></asp:BoundField>
                <asp:BoundField DataField="nombreDetalle" HeaderText="Detalle" ReadOnly="True"></asp:BoundField>
                <asp:BoundField DataField="total" HeaderText="Total" ReadOnly="True"></asp:BoundField>

            </Columns>
            <EditRowStyle BackColor="#7C6F57"></EditRowStyle>

            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White"></FooterStyle>

            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White"></HeaderStyle>

            <PagerStyle HorizontalAlign="Center" BackColor="#666666" ForeColor="White"></PagerStyle>

            <RowStyle BackColor="#E3EAEB"></RowStyle>

            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

            <SortedAscendingCellStyle BackColor="#F8FAFA"></SortedAscendingCellStyle>

            <SortedAscendingHeaderStyle BackColor="#246B61"></SortedAscendingHeaderStyle>

            <SortedDescendingCellStyle BackColor="#D4DFE1"></SortedDescendingCellStyle>

            <SortedDescendingHeaderStyle BackColor="#15524A"></SortedDescendingHeaderStyle>
        </asp:GridView>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger  ControlID="btnNuevo" EventName="Click"/>
            </Triggers>
        </asp:UpdatePanel>
            </div>
        </div>


</asp:Content>
