using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace ControlVacunasExamen3
{
	public partial class Reporte : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

        }

        private void CargarVacunas()
        {
            string cadena = System.Configuration.ConfigurationManager.ConnectionStrings["ConexionVacunas"].ConnectionString;
            using (SqlConnection conexion = new SqlConnection(cadena))
            {
                try
                {
                    conexion.Open();

                    // Crear el comando para ejecutar el procedimiento almacenado
                    SqlCommand comando = new SqlCommand("sp_ReporteVacunasPorTipo", conexion);
                    comando.CommandType = CommandType.StoredProcedure;

                    // Usar SqlDataAdapter para llenar el DataTable
                    SqlDataAdapter da = new SqlDataAdapter(comando);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    // Asignar el DataTable al GridView
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    // Manejo de excepciones
                    Response.Write("Error: " + ex.Message);
                }
            }
        }
    }
}




