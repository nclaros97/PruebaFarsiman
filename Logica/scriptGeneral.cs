using Datos;
using Logica.LUsuarios;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Windows.Forms;

namespace Logica
{
    public class scriptGeneral
    {
        public static object getGridColaboradores()
        {
            conexion_db.getConnection();
            DataTable data = new DataTable();
            try
            {
                SqlDataAdapter sqlDA = new SqlDataAdapter("dbo.PGENERAL", conexion_db.conexion);
                sqlDA.SelectCommand.CommandType = CommandType.StoredProcedure;
                sqlDA.SelectCommand.Parameters.AddWithValue("accion", "SELECT_GRID_COLABORADOR");
                sqlDA.Fill(data);

            }
            catch (Exception ex)
            {
                MessageBox.Show($"ERROR: \n {ex.ToString()}");
            }
            return data;
        }

        public static object getCBSucursal()
        {
            conexion_db.getConnection();
            DataTable data = new DataTable();
            try
            {
                SqlDataAdapter sqlDA = new SqlDataAdapter("dbo.PGENERAL", conexion_db.conexion);
                sqlDA.SelectCommand.CommandType = CommandType.StoredProcedure;
                sqlDA.SelectCommand.Parameters.AddWithValue("accion", "SELECT_CB_SUCURSAL");
                sqlDA.Fill(data);

            }
            catch (Exception ex)
            {
                MessageBox.Show($"ERROR: \n {ex.Message.ToString()}");
            }
            return data;
        }

        public static object reporte(int transportistaId, DateTime value1, DateTime value2)
        {
            conexion_db.getConnection();
            DataTable data = new DataTable();
            try
            {
                SqlDataAdapter sqlDA = new SqlDataAdapter("dbo.PGENERAL", conexion_db.conexion);
                sqlDA.SelectCommand.CommandType = CommandType.StoredProcedure;
                sqlDA.SelectCommand.Parameters.AddWithValue("accion", "REPORTE");
                sqlDA.SelectCommand.Parameters.AddWithValue("@SerTraId", transportistaId);
                sqlDA.SelectCommand.Parameters.AddWithValue("@fechaDesde", value1);
                sqlDA.SelectCommand.Parameters.AddWithValue("@fechaHasta", value2);
                sqlDA.Fill(data);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"ERROR: \n {ex.ToString()}");
            }
            return data;
        }

        public static object getGridColaboradoresParametros(int v1, int v2)
        {
            conexion_db.getConnection();
            DataTable data = new DataTable();
            try
            {
                SqlDataAdapter sqlDA = new SqlDataAdapter("dbo.PGENERAL", conexion_db.conexion);
                sqlDA.SelectCommand.CommandType = CommandType.StoredProcedure;
                sqlDA.SelectCommand.Parameters.AddWithValue("accion", "SELECT_GRID_COLABORADOR_PARAMETRO");
                sqlDA.SelectCommand.Parameters.AddWithValue("@SucId", v1);
                sqlDA.SelectCommand.Parameters.AddWithValue("@SerTraId", v2);
                sqlDA.Fill(data);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"ERROR: \n {ex.ToString()}");
            }
            return data;
        }

        public static bool insertViaje(DateTime dtFecha, int v)
        {
            conexion_db.getConnection();
            SqlCommand SqlCmd = new SqlCommand("dbo.PGENERAL", conexion_db.conexion);
            SqlCmd.CommandType = CommandType.StoredProcedure;
            SqlCmd.Parameters.AddWithValue("@viaFecha", dtFecha);
            SqlCmd.Parameters.AddWithValue("@ColId", v);
            SqlCmd.Parameters.AddWithValue("@UsuId", scriptUsuarios.userId);
            SqlCmd.Parameters.AddWithValue("accion", "INS_VIAJE");

            SqlCmd.ExecuteNonQuery();
            return true;
        }

        public static bool updateColaborador(int id, string nombre, string apellido, string direccion, string telefono, float distancia,
                    int transportista, int sucursal)
        {
            conexion_db.getConnection();
            SqlCommand SqlCmd = new SqlCommand("dbo.PGENERAL", conexion_db.conexion);
            SqlCmd.CommandType = CommandType.StoredProcedure;
            SqlCmd.Parameters.AddWithValue("@colNombres", nombre);
            SqlCmd.Parameters.AddWithValue("@colApellidos", apellido);
            SqlCmd.Parameters.AddWithValue("@colTelefono", telefono);
            SqlCmd.Parameters.AddWithValue("@colDireccion", direccion);
            SqlCmd.Parameters.AddWithValue("@colDistancia", distancia);
            SqlCmd.Parameters.AddWithValue("@SerTraId", transportista);
            SqlCmd.Parameters.AddWithValue("@ColId", id);
            SqlCmd.Parameters.AddWithValue("@SucId", sucursal);
            SqlCmd.Parameters.AddWithValue("accion", "UPD_COLABORADOR");

            SqlCmd.ExecuteNonQuery();
            MessageBox.Show($"Colaborador: {nombre} actualizado satisfactoriamente!");
            return true;
        }

        public static bool insertColaborador(string nombre, string apellido, string direccion, string telefono, float distancia,
                    int transportista, int sucursal )
        {
            conexion_db.getConnection();
            SqlCommand SqlCmd = new SqlCommand("dbo.PGENERAL", conexion_db.conexion);
            SqlCmd.CommandType = CommandType.StoredProcedure;
            SqlCmd.Parameters.AddWithValue("@colNombres", nombre);
            SqlCmd.Parameters.AddWithValue("@colApellidos", apellido);
            SqlCmd.Parameters.AddWithValue("@colTelefono", telefono);
            SqlCmd.Parameters.AddWithValue("@colDireccion", direccion);
            SqlCmd.Parameters.AddWithValue("@colDistancia", distancia);
            SqlCmd.Parameters.AddWithValue("@SerTraId", transportista);
            SqlCmd.Parameters.AddWithValue("@SucId", sucursal);
            SqlCmd.Parameters.AddWithValue("accion", "INS_COLABORADOR");

            SqlCmd.ExecuteNonQuery();
            MessageBox.Show($"Colaborador: {nombre} Creado satisfactoriamente!");
            return true;
        }

        public static bool deleteColaborador(int v)
        {
            conexion_db.getConnection();

            SqlCommand SqlCmd = new SqlCommand("dbo.PGENERAL", conexion_db.conexion);
            SqlCmd.CommandType = CommandType.StoredProcedure;
            SqlCmd.Parameters.AddWithValue("@ColId", v);
            SqlCmd.Parameters.AddWithValue("accion", "DLT_COLABORADOR");
            SqlCmd.ExecuteNonQuery();
            MessageBox.Show($"Colaborador eliminado satisfactoriamente!");
            return true;
        }

        public static object getCBTransportista()
        {
            conexion_db.getConnection();
            DataTable data = new DataTable();
            try
            {
                SqlDataAdapter sqlDA = new SqlDataAdapter("dbo.PGENERAL", conexion_db.conexion);
                sqlDA.SelectCommand.CommandType = CommandType.StoredProcedure;
                sqlDA.SelectCommand.Parameters.AddWithValue("accion", "SELECT_CB_TRANSPORTISTA");
                sqlDA.Fill(data);

            }
            catch (Exception ex)
            {
                MessageBox.Show($"ERROR: \n {ex.Message.ToString()}");
            }
            return data;
        }
    }
}
