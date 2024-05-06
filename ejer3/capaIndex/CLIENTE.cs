using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ejer3.capaDatos;

namespace ejer3.capaIndex
{
    public partial class CLIENTE : Form
    {
        public CLIENTE()
        {
            InitializeComponent();
        }

        cliente objcliente = new cliente();
        string operacion = "Añadir";
        string idCliente;

        private void CLIENTE_Load(object sender, EventArgs e)
        {
            ListarCuenta();
            ListarCliente();
        }

        private void ListarCuenta()
        {
            cliente objCli = new cliente();
            cmbCuenta.DataSource = objCli.ListarCuenta();
            cmbCuenta.DisplayMember = "CUENTA_BANCARIA";
            cmbCuenta.ValueMember = "IDCUENTA";
        }

        private void LimpiarFormulario()
        {
            txtNombre.Clear();
            txtApellido.Clear();
            txtCi.Clear();
            txtDomicilio.Clear();
            txtCelular.Clear();
            txtCorreo.Clear();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            if (operacion == "Añadir")
            {
                objcliente.AgregarCliente(
                                                Convert.ToInt32(cmbCuenta.SelectedValue),
                                                txtNombre.Text,
                                                txtApellido.Text,
                                                Convert.ToInt32(txtCi.Text),
                                                txtDomicilio.Text,
                                                Convert.ToInt32(txtCelular.Text),
                                                txtCorreo.Text
                                         );
                MessageBox.Show("SE AGREGO CORRECTAMENTE!!!");
            }
            else
                if (operacion == "Editar")
                {
                    objcliente.EditarCliente(Convert.ToInt32(idCliente), Convert.ToInt32(cmbCuenta.SelectedValue), txtNombre.Text, txtApellido.Text, Convert.ToInt32(txtCi.Text), txtDomicilio.Text, Convert.ToInt32(txtCelular.Text), txtCorreo.Text);
                    MessageBox.Show("EDICION CORRECTA!!!");
                }
           ListarCliente();
           LimpiarFormulario();
        }

        private void ListarCliente()
        {
            cliente objCli = new cliente();
            dataGridView1.DataSource = objCli.ListarCliente();
        }

        private void btnEditar_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count > 0)
            {
                operacion = "Editar";
                cmbCuenta.Text = dataGridView1.CurrentRow.Cells["CUENTA_BANCARIA"].Value.ToString();
                txtNombre.Text = dataGridView1.CurrentRow.Cells["NOMBRES"].Value.ToString();
                txtApellido.Text = dataGridView1.CurrentRow.Cells["APELLIDOS"].Value.ToString();
                txtCi.Text = dataGridView1.CurrentRow.Cells["CI"].Value.ToString();
                txtDomicilio.Text = dataGridView1.CurrentRow.Cells["DOMICILIO"].Value.ToString();
                txtCelular.Text = dataGridView1.CurrentRow.Cells["CELULAR"].Value.ToString();
                txtCorreo.Text = dataGridView1.CurrentRow.Cells["CORREO"].Value.ToString();

                idCliente = dataGridView1.CurrentRow.Cells["ID"].Value.ToString();
            }
            else
                MessageBox.Show("SELECCIONE UNA FILA");
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count > 0)
            {
                objcliente.EliminarCliente(Convert.ToInt32(dataGridView1.CurrentRow.Cells[0].Value));
                //objcliente.EliminarCliente();
                MessageBox.Show("ELIMINACION CORRECTA!!!");
                ListarCliente();
            }
            else
                MessageBox.Show("SELECCIONE UNA FILA");
        }
    }
}
