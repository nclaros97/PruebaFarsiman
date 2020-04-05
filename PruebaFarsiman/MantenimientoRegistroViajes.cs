using Logica;
using Logica.LUsuarios;
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
    public partial class MantenimientoRegistroViajes : Form
    {
        private int transportistaId;
        private int suscursalId;
        public MantenimientoRegistroViajes()
        {
            InitializeComponent();
        }

        private void MantenimientoRegistroViajes_Load(object sender, EventArgs e)
        {
            cbSucursal.DisplayMember = "SUCURSAL";
            cbSucursal.ValueMember = "ID";
            cbSucursal.DataSource = scriptGeneral.getCBSucursal();

            cbTransportista.ValueMember = "ID";
            cbTransportista.DisplayMember = "TRANSPORTISTA";
            cbTransportista.DataSource = scriptGeneral.getCBTransportista();

            GridColaboradoresViaje.Columns[0].Visible = false;
        }

        private void btnFiltrar_Click(object sender, EventArgs e)
        {
            GridColaboradoresViaje.Columns[0].Visible = true;
            GridColaboradoresViaje.DataSource = scriptGeneral.getGridColaboradoresParametros(int.Parse(cbSucursal.SelectedValue.ToString()), int.Parse(cbTransportista.SelectedValue.ToString()) );
            transportistaId = int.Parse(cbTransportista.SelectedValue.ToString());
            suscursalId = int.Parse(cbSucursal.SelectedValue.ToString());
        }

        private void BtnCerrar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            int cantRegistros = 0, registros =0;
            try
            {
                for (int i = 0; i < GridColaboradoresViaje.Rows.Count - 1; i++)
                {
                    if (Convert.ToBoolean(GridColaboradoresViaje.Rows[i].Cells[0].EditedFormattedValue)==false)
                    {
                        cantRegistros++;
                    }
                    else
                    {
                        registros++;
                    }
                }

                if (cantRegistros == (GridColaboradoresViaje.Rows.Count - 1))
                {
                    MessageBox.Show("No hay colaboradores seleccionados para el viaje");
                }
                else
                {
                    for (int i = 0; i < GridColaboradoresViaje.Rows.Count - 1; i++)
                    {
                        if (Convert.ToBoolean(GridColaboradoresViaje.Rows[i].Cells[0].EditedFormattedValue) == true)
                        {
                            scriptGeneral.insertViaje(dtFecha.Value, int.Parse(GridColaboradoresViaje.Rows[i].Cells[1].Value.ToString()));
                        }
                    }
                    MessageBox.Show($"Total de colaboradores registrados en el viaje: {registros}");
                    this.Close();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"ERROR: \n{ex.ToString()}");
            }
        }
    }
}
