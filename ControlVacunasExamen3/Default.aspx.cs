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
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarVacunas();
            }
        }

        private void CargarVacunas()
        {
            string cadena = System.Configuration.ConfigurationManager.ConnectionStrings["ConexionVacunas"].ConnectionString;
            using (SqlConnection conexion = new SqlConnection(cadena))
            {
                try
                {
                    conexion.Open();
                    // Si la conexión es exitosa, ejecuta la consulta.
                    SqlDataAdapter da = new SqlDataAdapter("SELECT V.VacunaID, V.NombreVacuna, V.FechaAplicacion, V.Paciente, V.Dosis, T.NombreTipo FROM Vacuna V INNER JOIN TipoVacuna T ON V.TipoID = T.TipoID", conexion);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    GridViewVacunas.DataSource = dt;  // Aquí se enlaza el GridView con los datos
                    GridViewVacunas.DataBind();  // Bind para actualizar la vista
                }
                catch (Exception ex)
                {
                    // Muestra el mensaje de error en caso de fallo de la conexión.
                    Response.Write("Error al conectar: " + ex.Message);
                }
            }
        }
    }
}
