using System;
using System.Data.SqlClient;
using System.Configuration;

namespace ControlVacunas
{
    public partial class AgregarVacuna : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarTiposVacuna();
            }
        }

        private void CargarTiposVacuna()
        {
            string cadena = ConfigurationManager.ConnectionStrings["ControlVacunasConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cadena))
            {
                SqlCommand cmd = new SqlCommand("SELECT TipoVacunaID, NombreTipo FROM TiposVacuna", con);
                con.Open();
                ddlTipo.DataSource = cmd.ExecuteReader();
                ddlTipo.DataTextField = "NombreTipo";
                ddlTipo.DataValueField = "TipoVacunaID";
                ddlTipo.DataBind();
                ddlTipo.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-- Seleccione --", "0"));
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (ddlTipo.SelectedValue == "0" || string.IsNullOrWhiteSpace(txtNombre.Text))
            {
                lblMensaje.Text = "Por favor complete todos los campos.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string cadena = ConfigurationManager.ConnectionStrings["ControlVacunasConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cadena))
            {
                SqlCommand cmd = new SqlCommand("InsertarVacuna", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@NombreVacuna", txtNombre.Text);
                cmd.Parameters.AddWithValue("@TipoVacunaID", ddlTipo.SelectedValue);

                con.Open();
                cmd.ExecuteNonQuery();
                lblMensaje.Text = "Vacuna agregada exitosamente.";
                lblMensaje.ForeColor = System.Drawing.Color.Green;
                txtNombre.Text = "";
                ddlTipo.SelectedIndex = 0;
            }
        }
    }
}
