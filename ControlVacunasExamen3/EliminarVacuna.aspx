<%@ Page Title="Eliminar Vacuna" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EliminarVacuna.aspx.cs" Inherits="ControlVacunas.EliminarVacuna" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Eliminar Vacuna</h2>

    <div class="form-group">
        <label for="txtID">ID de la Vacuna a eliminar:</label>
        <asp:TextBox ID="txtID" runat="server" CssClass="form-control"></asp:TextBox>
    </div>

    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger" OnClick="btnEliminar_Click" />
    <asp:Label ID="lblMensaje" runat="server" ForeColor="Red"></asp:Label>
</asp:Content>
