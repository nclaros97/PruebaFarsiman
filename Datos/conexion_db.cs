using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using System.Windows.Forms;

namespace Datos
{
    public class conexion_db
    {
        public static SqlConnection conexion = null;
        public static SqlConnection getConnection()
        {
            string servidor = "DESKTOP-LHQFM55";
            string database = "db_pruebaFarsiman";
            string usuario = "sa";
            string pssw = "N1lsonClaros";
            try
            {
                conexion = new SqlConnection($"Data Source={servidor};Integrated " +
                $"Security=False;Initial Catalog={database};User Id={usuario};Password={pssw};");
                conexion.Open();

            }
            catch (SqlException ex)
            {
                MessageBox.Show($"Error al intentar conectar con el servidor {servidor} \n {ex.ToString()}");
            }
            return conexion;
        }
    }
}
