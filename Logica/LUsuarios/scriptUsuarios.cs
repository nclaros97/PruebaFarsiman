using Datos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Windows.Forms;

namespace Logica.LUsuarios
{
    public class scriptUsuarios
    {
        public static string nickUsuario;
        public static int userId;
        public static bool Login(string user, string psw)
        {
            try
            {
                conexion_db.getConnection();
                SqlCommand SqlCmd = new SqlCommand("dbo.[PUSUARIOS]", conexion_db.conexion);
                SqlCmd.CommandType = CommandType.StoredProcedure;
                SqlCmd.Parameters.AddWithValue("accion", "LOGIN");
                SqlCmd.Parameters.AddWithValue("@usuNick", user);
                SqlCmd.Parameters.AddWithValue("@usuCorreo", user);
                SqlCmd.Parameters.AddWithValue("@usuPassw", psw);
                SqlCmd.Parameters.Add("@var", SqlDbType.VarChar, 100).Direction = ParameterDirection.Output;
                SqlCmd.ExecuteNonQuery();

                if (SqlCmd.Parameters["@var"].Value.ToString().Equals("1"))
                {
                    return true;
                }

            }
            catch (SqlException ex)
            {
                MessageBox.Show($"ERROR: \n {ex.ToString()}");
            }
            return false;
        }

        public static DataTable getCredencialesUsuario(string user, string pssw)
        {
            conexion_db.getConnection();
            DataTable data = new DataTable();
            SqlDataAdapter SqlCmd = new SqlDataAdapter("dbo.[PUSUARIOS]", conexion_db.conexion);
            SqlCmd.SelectCommand.CommandType = CommandType.StoredProcedure;
            SqlCmd.SelectCommand.Parameters.AddWithValue("accion", "GET_DATA_USER");
            SqlCmd.SelectCommand.Parameters.AddWithValue("@usuNick", user);
            SqlCmd.SelectCommand.Parameters.AddWithValue("@usuCorreo", user);
            SqlCmd.SelectCommand.Parameters.AddWithValue("@usuPassw", pssw);
            SqlCmd.Fill(data);
            return data;
        }
    }
}
