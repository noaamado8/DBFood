using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace DBFood
{
    public partial class myproducts : System.Web.UI.Page
    {
        GenericResponse response;
        Engine engine = new Engine();
        protected void Page_Load(object sender, EventArgs e)
        {
            string stringSerialized;

            //Validar usuario
            if (this.Session["user_email"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {

                //pasar id usuario

                int id_user = (int)this.Session["id_user"];

                response = engine._listUserProducts(id_user);
                if (response.error != "")
                {
                    //Exeception
                }
                else
                {

                    if (response.obj != null)
                    {
                        stringSerialized = engine._serialize(response.obj);
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), DateTime.Now.ToString("yyyyMMddhhmmss"), "listMyProducts('" + stringSerialized + "');", true);

                    }
                    else
                    {
                        //class null
                    }

                }



            }

        }



        protected void wBtnDelete_Click(object sender, EventArgs e)
        {

            string productcode = productCodeDel.Text;

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), DateTime.Now.ToString("yyyyMMddhhmmss") + 'c', "console.log('" + productcode + "AAAA');", true);


                

            response = engine._deleteProduct(productcode);

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), DateTime.Now.ToString("yyyyMMddhhmmss") + 'z', "console.log(" + engine._serialize(response) + ");", true);



            if (response.error != "")
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), DateTime.Now.ToString("yyyyMMddhhmmss") + "ab", "console.log(\"" + response.error + "\");", true);
            }
            else
            {

                if (response.operation_success)
                {

                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), DateTime.Now.ToString("yyyyMMddhhmmss") + 'b', "console.log('guajira');", true);
                    //ventanica de confirmacion


                    Response.Redirect(Request.Url.ToString(), true);

                }
                else
                {
                    //class null

                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), DateTime.Now.ToString("yyyyMMddhhmmss") + 'b', "console.log('guantanamera');", true);

                }



            }

        }




    }
}