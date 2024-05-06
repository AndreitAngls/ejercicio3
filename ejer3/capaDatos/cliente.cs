using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace ejer3.capaDatos
{
    class cliente
    {
        private conexionBd conexion = new conexionBd();
        private SqlCommand Comando = new SqlCommand();
        private SqlDataReader LeerFilas;

        public DataTable ListarCuenta()
        {
            DataTable Tabla = new DataTable();
            Comando.Connection = conexion.AbrirConexion();
            Comando.CommandText = "listarCuenta";
            Comando.CommandType = CommandType.StoredProcedure;
            LeerFilas = Comando.ExecuteReader();
            Tabla.Load(LeerFilas);
            LeerFilas.Close();
            conexion.CerrarConexion();
            return Tabla;
        }

        public void AgregarCliente(int cuentaId, string nombres, string apellidos, int ci, string domicilio, int celular, string correo)
        {
            Comando.Connection = conexion.AbrirConexion();
            Comando.CommandText = "agregarCliente";
            Comando.CommandType = CommandType.StoredProcedure;
            Comando.Parameters.AddWithValue("@CUENTA", cuentaId);
            Comando.Parameters.AddWithValue("@NOMBRES", nombres);
            Comando.Parameters.AddWithValue("@APELLIDOS", apellidos);
            Comando.Parameters.AddWithValue("@CI", ci);
            Comando.Parameters.AddWithValue("@DOMICILIO", domicilio);
            Comando.Parameters.AddWithValue("@CELULAR", celular);
            Comando.Parameters.AddWithValue("@CORREO", correo);
            Comando.ExecuteNonQuery();
            Comando.Parameters.Clear();
            conexion.CerrarConexion();
        }

        public DataTable ListarCliente()
        {
            DataTable Tabla = new DataTable();
            Comando.Connection = conexion.AbrirConexion();
            Comando.CommandText = "listarCliente";
            Comando.CommandType = CommandType.StoredProcedure;
            LeerFilas = Comando.ExecuteReader();
            Tabla.Load(LeerFilas);
            LeerFilas.Close();
            conexion.CerrarConexion();
            return Tabla;
        }

        public void EditarCliente(int idCliente, int cuentaId, string nombres, string apellidos, int ci, string domicilio, int celular, string correo)
        {
            Comando.Connection = conexion.AbrirConexion();
            Comando.CommandText = "update CLIENTE set CUENTA="+cuentaId+", NOMBRES='"+nombres+"', APELLIDOS='"+apellidos+"', CI="+ci+", DOMICILIO='"+domicilio+"', CELULAR="+celular+", CORREO='"+correo+"' WHERE IDCLIENTE="+idCliente+"";
            Comando.CommandType = CommandType.Text;
            Comando.ExecuteNonQuery();
            conexion.CerrarConexion();
        }

        public void EliminarCliente(int idCliente)
        {
            Comando.Connection = conexion.AbrirConexion();
            Comando.CommandText = "delete CLIENTE where IDCLIENTE="+idCliente;
            Comando.CommandType = CommandType.Text;
            Comando.ExecuteNonQuery();
            conexion.CerrarConexion();
        }
    }
}
