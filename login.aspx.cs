using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Security.Cryptography;



namespace DBFood
{
    public partial class login : System.Web.UI.Page
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {
            walertdanger.Visible = false;
            walertsuccess.Visible = false;
        }

        protected void login_Click(object sender, EventArgs e)
        {
            var usuario = email.Text;
            var contrasinal = password.Text;
            DataBase con = new DataBase();

            var stm = "SELECT email,passwordHash,idusers from users";
            MySqlCommand cmd = new MySqlCommand(stm, con.conexion());
            cmd.Prepare();
            MySqlDataReader lista = cmd.ExecuteReader();
            string us = "";
            var ps = "";
            int id = -1;
            while (lista.Read())
            {

                us = lista.GetString(0);
                ps = lista.GetString(1);
                id = lista.GetInt32(2);
            }

            if (usuario == us && contrasinal == ps)
            {
                walertsuccess.Text = "Benvida/Benvido "+us;
                walertsuccess.Visible = true;
                Session["user"]=us;
                Session["id_user"] = id;
                Response.Redirect("index.aspx");
            }
            else
            {
                walertdanger.Text = "Usuario ou contrasinal incorrectos";
                walertdanger.Visible = true;


            }
        }
    }
}
