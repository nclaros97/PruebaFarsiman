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
    public partial class MenuPrincipal : Form
    {
        public bool cerrar;
        public bool isLogin;
        public bool sesion = false;
        public string nombreCompleto;
        public string correo;
        public string cargos;
        public MenuPrincipal()
        {
            InitializeComponent();
        }

        private void MenuPrincipal_Load(object sender, EventArgs e)
        {
            if (sesion)
            {
                POpciones.Enabled = true;
            }
            else
            {
                POpciones.Enabled = false;
                Login();
            }
        }

        private void Login()
        {
            if (this.PContenedor.Controls.Count > 0)
                this.PContenedor.Controls.RemoveAt(0);

            Login fm = new Login();
            AddOwnedForm(fm);
            fm.FormBorderStyle = FormBorderStyle.None;
            fm.TopLevel = false;
            //fm.Dock = DockStyle.Fill;
            fm.ControlBox = false;
            fm.Top = (PContenedor.Height / 2) - (fm.Height / 2);
            fm.Left = (PContenedor.Width / 2) - (fm.Width / 2);
            fm.FormBorderStyle = FormBorderStyle.None;
            fm.TopLevel = false;
            this.PContenedor.Controls.Add(fm);
            this.Tag = fm;
            fm.BringToFront();

            fm.Show();
            fm.FormClosed += new FormClosedEventHandler(MostrarMenuAlCerrarForms);
        }

        private void MostrarMenuAlCerrarForms(object sender, FormClosedEventArgs e)
        {
            //verificar estado del inicio de sesion;

            if (sesion)
            {

                POpciones.Enabled = true;
                lblNombreCompeto.Text = nombreCompleto;
                lblCorreo.Text = correo;
            }
            else
            {
                if (cerrar == false)
                {
                    POpciones.Enabled = false;
                    lblNombreCompeto.Text = "Nombre Completo";
                    lblCorreo.Text = "Correo";
                    Login();
                }
            }

        }

        private void AbrirFormEnPanel(object formHijo)
        {
            if (this.PContenedor.Controls.Count > 0)
                this.PContenedor.Controls.RemoveAt(0);
            Form fh = formHijo as Form;
            fh.Dock = DockStyle.Fill;

            fh.ControlBox = false;
            fh.Top = (PContenedor.Height / 2) - (fh.Height / 2); ;
            fh.Left = (PContenedor.Width / 2) - (fh.Width / 2);
            fh.FormBorderStyle = FormBorderStyle.None;
            fh.TopLevel = false;

            this.PContenedor.Controls.Add(fh);
            this.PContenedor.Tag = fh;
            fh.Show();
        }

        private void btnColaboradores_Click(object sender, EventArgs e)
        {
            ListaColaboradores fm = new ListaColaboradores();
            AbrirFormEnPanel(fm);
        }

        private void btnViajes_Click(object sender, EventArgs e)
        {
            RegistroViajes fm = new RegistroViajes();
            AbrirFormEnPanel(fm);
        }
    }
}
