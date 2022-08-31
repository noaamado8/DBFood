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
        GenericResponse response;
        Engine engine = new Engine();
        protected void Page_Load(object sender, EventArgs e)
        {


        }
        protected void Page_Unload(object sender, EventArgs e)
        {


        }
        protected void login_Click(object sender, EventArgs e)
        {
            string _email = email.Text;
            string _password = password.Text;
            User user;

            response = engine._login(_email, _password);

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), DateTime.Now.ToString("yyyyMMddhhmmss") + "a", "console.log(" + response + ");", true);
            /*if (response.error != "")
            {
                //show exception
            }
            else
            {*/
                if (response.operation_success)
                {
                    user = (User)response.obj;

                  
                    
                    Session["user_email"] = user.email;
                    Session["id_user"] = user.id;
                    Response.Redirect("myproducts.aspx");

            }
            else
                {
                    walertdanger.Text = "Usuario ou contrasinal incorrectos";
                    walertdanger.Visible = true;
                };
            
        }
    }
}
