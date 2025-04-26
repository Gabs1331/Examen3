<%@ Page Title="Agregar Vacuna" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarVacuna.aspx.cs" Inherits="ControlVacunas.AgregarVacuna" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Agregar Nueva Vacuna</h2>

    <div class="form-group">
        <label for="txtNombre">Nombre de la Vacuna:</label>
        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
    </div>

    <div class="form-group">
        <label for="ddlTipo">Tipo de Vacuna:</label>
        <asp:DropDownList ID="ddlTipo" runat="server" CssClass="form-control"></asp:DropDownList>
    </div>

    <asp:Button ID="btnAgregar" runat="server" Text="Agregar Vacuna" CssClass="btn btn-primary" OnClick="btnAgregar_Click" />
    <asp:Label ID="lblMensaje" runat="server" ForeColor="Green"></asp:Label>
</asp:Content>



