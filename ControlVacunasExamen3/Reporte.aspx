<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reporte.aspx.cs" Inherits="ControlVacunasExamen3.Reporte" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Reporte de Vacunas por Tipo</title>
    <style>
        h2 {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Reporte de Vacunas Aplicadas por Tipo</h2>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="true" 
                          CssClass="table table-bordered table-striped" />
        </div>
    </form>
</body>
</html>

