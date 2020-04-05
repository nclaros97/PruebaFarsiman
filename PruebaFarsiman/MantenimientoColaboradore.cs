using Logica;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PruebaFarsiman
{
    public partial class MantenimientoColaboradore : Form
    {
        public bool IsInsert;
        public MantenimientoColaboradore()
        {
            InitializeComponent();
        }

        private void BtnCerrar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void MantenimientoColaboradore_Load(object sender, EventArgs e)
        {
            cbSucursal.DisplayMember = "SUCURSAL";
            cbSucursal.ValueMember = "ID";
            cbSucursal.DataSource = scriptGeneral.getCBSucursal();

            cbTransportista.ValueMember = "ID";
            cbTransportista.DisplayMember = "TRANSPORTISTA";
            cbTransportista.DataSource = scriptGeneral.getCBTransportista();

            if (IsInsert)
            {
                lblAccion.Text = "Nuevo Colaborador";
            }
            else
            {
                lblAccion.Text = $"Editar Colaborador {txtNombres.Text} {txtApellidos.Text}";
            }

        }

        private void btnConfirmar_Click(object sender, EventArgs e)
        {
            if (IsInsert)
            {
                if (scriptGeneral.insertColaborador(txtNombres.Text, txtApellidos.Text, txtDireccion.Text, txtTelefono.Text, float.Parse(txtDistancia.Text),
                    int.Parse(cbTransportista.SelectedValue.ToString()), int.Parse(cbSucursal.SelectedValue.ToString()) ))
                {
                    this.Close();
                }
            }
            else
            {
                if (scriptGeneral.updateColaborador(int.Parse(txtId.Text),txtNombres.Text, txtApellidos.Text, txtDireccion.Text, txtTelefono.Text, float.Parse(txtDistancia.Text),
                    int.Parse(cbTransportista.SelectedValue.ToString()), int.Parse(cbSucursal.SelectedValue.ToString())))
                {
                    this.Close();
                }
            }
        }
    }
}
