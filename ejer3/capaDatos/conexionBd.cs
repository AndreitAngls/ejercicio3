using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace ejer3.capaDatos
{
    class conexionBd
    {
        static private string conexionCad = "Server=DESKTOP-4D84P86; DataBase=bdAndrea; Integrated Security=true";
        private SqlConnection conexion = new SqlConnection(conexionCad);
        
        public SqlConnection AbrirConexion()
        {
            if (conexion.State == ConnectionState.Closed)
                conexion.Open();
            return conexion;
        }

        public SqlConnection CerrarConexion()
        {
            if (conexion.State == ConnectionState.Open)
                conexion.Close();
            return conexion;
        }
    }
}
