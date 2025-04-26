<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ControlVacunasExamen3._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Aquí puedes poner contenido adicional para el head si quieres -->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Bienvenido al Sistema de Control de Vacunas</h1>
    <p>Este sistema permite gestionar la aplicación de vacunas a pacientes de forma sencilla y organizada.</p>

    <h3>¿Qué puedes hacer aquí?</h3>
    <ul>
        <li>Registrar nuevas vacunas aplicadas</li>
        <li>Modificar información de vacunas registradas</li>
        <li>Eliminar registros de vacunas</li>
        <li>Consultar vacunas por tipo</li>
        <li>Generar reportes de vacunas aplicadas</li>
    </ul>

    <p>Utiliza el menú de navegación para acceder a las diferentes funciones.</p>

    <!-- Aquí agregamos el GridView para mostrar los registros de vacunas -->
    <h3>Lista de Vacunas Registradas</h3>
    <asp:GridView ID="GridViewVacunas" runat="server" AutoGenerateColumns="false" 
        DataKeyNames="VacunaID" 
        CssClass="table table-striped" 
        AllowPaging="true" PageSize="10">
        <Columns>
            <asp:BoundField DataField="VacunaID" HeaderText="ID Vacuna" SortExpression="VacunaID" />
            <asp:BoundField DataField="NombreVacuna" HeaderText="Nombre de la Vacuna" SortExpression="NombreVacuna" />
            <asp:BoundField DataField="FechaAplicacion" HeaderText="Fecha de Aplicación" SortExpression="FechaAplicacion" />
            <asp:BoundField DataField="Paciente" HeaderText="Paciente" SortExpression="Paciente" />
            <asp:ButtonField ButtonType="Button" CommandName="Editar" Text="Editar" />
            <asp:ButtonField ButtonType="Button" CommandName="Eliminar" Text="Eliminar" />
        </Columns>
    </asp:GridView>

</asp:Content>

