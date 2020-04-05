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
            string servidor = "127.0.0.1";
            string database = "db_pruebaFarsiman";
            string usuario = "";
            string pssw = "";
            try
            {
                //conexion = new SqlConnection($"Data Source={servidor};Integrated " +
                //$"Security=False;Initial Catalog={database};User Id={usuario};Password={pssw};");

                conexion = new SqlConnection($"Data Source={servidor};Integrated " +
                $"Security=True;Initial Catalog={database};");
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
