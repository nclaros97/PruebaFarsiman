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
    public partial class Login : Form
    {
        public bool estado = false;
        public bool cerrar = true;
        public Login()
        {
            InitializeComponent();
        }

        private void Login_Load(object sender, EventArgs e)
        {
            MenuPrincipal frm = Owner as MenuPrincipal;
            frm.cerrar = cerrar;
            frm.isLogin = true;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnEntrar_Click(object sender, EventArgs e)
        {
            try
            {
                if (scriptUsuarios.Login(txtUsuario.Text, txtPass.Text))
                {
                    DataTable credenciales = new DataTable();
                    credenciales = scriptUsuarios.getCredencialesUsuario(txtUsuario.Text, txtPass.Text);
                    MenuPrincipal frm = Owner as MenuPrincipal;
                    frm.sesion = true;
                    frm.cerrar = false;
                    frm.isLogin = false;
                    scriptUsuarios.nickUsuario = credenciales.Rows[0][0].ToString();
                    scriptUsuarios.userId = int.Parse(credenciales.Rows[0][3].ToString());
                    //se muestran los datos del usuario logeado
                    frm.nombreCompleto = credenciales.Rows[0][2].ToString();
                    frm.correo = $"{credenciales.Rows[0][1].ToString()}";
                    this.Close();
                }
                else
                {
                    MessageBox.Show("El Usuario o Contraseña es incorrecto");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error al iniciar sesion \n"+ ex.ToString());
            }
        }
    }
}
