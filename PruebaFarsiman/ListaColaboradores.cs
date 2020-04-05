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
    public partial class ListaColaboradores : Form
    {
        public ListaColaboradores()
        {
            InitializeComponent();
        }

        private void btnNuevo_Click(object sender, EventArgs e)
        {
            MantenimientoColaboradore frm = new MantenimientoColaboradore();
            frm.IsInsert = true;
            frm.FormClosed += new FormClosedEventHandler(Form_Closed);
            frm.ShowDialog();
        }

        private void ListaColaboradores_Load(object sender, EventArgs e)
        {
            GridColaboradores.DataSource = scriptGeneral.getGridColaboradores();
            GridColaboradores.Columns[6].Visible = false;
            GridColaboradores.Columns[8].Visible = false;
        }

        private void btnEditar_Click(object sender, EventArgs e)
        {
            if (GridColaboradores.SelectedRows.Count == 1)
            {
                MantenimientoColaboradore frm = new MantenimientoColaboradore();
                frm.IsInsert = false;
                frm.txtId.Text = GridColaboradores.CurrentRow.Cells[0].Value.ToString();
                frm.txtNombres.Text = GridColaboradores.CurrentRow.Cells[1].Value.ToString();
                frm.txtApellidos.Text = GridColaboradores.CurrentRow.Cells[2].Value.ToString();
                frm.txtDireccion.Text = GridColaboradores.CurrentRow.Cells[4].Value.ToString();
                frm.txtTelefono.Text = GridColaboradores.CurrentRow.Cells[3].Value.ToString();
                frm.txtDistancia.Text = GridColaboradores.CurrentRow.Cells[5].Value.ToString();
                frm.cbSucursal.SelectedItem = int.Parse(GridColaboradores.CurrentRow.Cells[8].Value.ToString());
                frm.cbTransportista.SelectedItem = int.Parse(GridColaboradores.CurrentRow.Cells[6].Value.ToString());
                frm.FormClosed += new FormClosedEventHandler(Form_Closed);
                frm.ShowDialog();

            }
            else
                MessageBox.Show("seleccione una fila por favor");
        }

        private void Form_Closed(object sender, EventArgs e)
        {
            GridColaboradores.DataSource = scriptGeneral.getGridColaboradores();
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            if (GridColaboradores.SelectedRows.Count == 1)
            {
                if (MessageBox.Show($"¿Está seguro de eliminar al colaborador: {GridColaboradores.CurrentRow.Cells[1].Value.ToString()}?",
                    "Alerta¡¡", MessageBoxButtons.YesNo) == DialogResult.Yes)
                {
                    scriptGeneral.deleteColaborador(Convert.ToInt32(GridColaboradores.CurrentRow.Cells[0].Value.ToString()));
                    GridColaboradores.DataSource = scriptGeneral.getGridColaboradores();
                }
                else
                {
                    MessageBox.Show("Eliminacion cancelada");
                }
            }
            else
                MessageBox.Show("seleccione una fila para poder eliminar por favor");
        }
    }
}
