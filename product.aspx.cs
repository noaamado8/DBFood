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
    public partial class product : System.Web.UI.Page
    {

        GenericResponse response;
        Engine engine = new Engine();
        protected void Page_Load(object sender, EventArgs e)
        {

            var productcode = Request["code"];
            string serializedClass;

            response = engine._showProduct(productcode);





            if (response.error != "")
            {
                //show exception

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), DateTime.Now.ToString("yyyyMMddhhmmss") + "ab", "console.log(\"" + response.error + "\");", true);


            }
            else
            {
                if (response.obj != null)
                {
                    serializedClass = engine._serialize(response.obj);



                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), DateTime.Now.ToString("yyyyMMddhhmmss"), "_showProduct('" + serializedClass + "');", true);
                }
                else
                {
                    //class null

                }
            }

            //ingredients.Text += "-" + ingredient.name + " " + ingredient.description + "<br/>";

        }
    }
}