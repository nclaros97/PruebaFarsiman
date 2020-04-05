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
    public partial class RegistroViajes : Form
    {
        public RegistroViajes()
        {
            InitializeComponent();
        }

        private void RegistroViajes_Load(object sender, EventArgs e)
        {
            cbTransportista.ValueMember = "ID";
            cbTransportista.DisplayMember = "TRANSPORTISTA";
            cbTransportista.DataSource = scriptGeneral.getCBTransportista();
        }

        private void btnNuevo_Click(object sender, EventArgs e)
        {
            MantenimientoRegistroViajes frm = new MantenimientoRegistroViajes();
            frm.ShowDialog();
        }

        private void btnFiltrar_Click(object sender, EventArgs e)
        {
            float total = 0;
            GridColaboradores.DataSource = scriptGeneral.reporte(int.Parse(cbTransportista.SelectedValue.ToString()), dtDesde.Value, dtHasta.Value);
            for (int i = 0; i < GridColaboradores.Rows.Count -1; i++)
            {
                total += float.Parse(GridColaboradores.Rows[i].Cells[4].Value.ToString());
            }
            lblTotal.Text = $"TOTAL L {total}";
        }

        private void BtnCerrar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
