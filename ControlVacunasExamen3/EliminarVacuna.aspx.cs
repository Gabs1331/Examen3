using System;
using System.Data.SqlClient;
using System.Configuration;

namespace ControlVacunas
{
    public partial class EliminarVacuna : System.Web.UI.Page
    {
        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            int vacunaID;
            if (!int.TryParse(txtID.Text, out vacunaID))
            {
                lblMensaje.Text = "Ingrese un ID válido.";
                return;
            }

            string cadena = ConfigurationManager.ConnectionStrings["ControlVacunasConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cadena))
            {
                SqlCommand cmd = new SqlCommand("EliminarVacuna", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@VacunaID", vacunaID);

                con.Open();
                int filas = cmd.ExecuteNonQuery();
                if (filas > 0)
                    lblMensaje.Text = "Vacuna eliminada correctamente.";
                else
                    lblMensaje.Text = "No se encontró una vacuna con ese ID.";
            }
        }
    }
}
