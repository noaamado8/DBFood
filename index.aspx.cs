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
    public partial class index : System.Web.UI.Page
    {
        GenericResponse response;
        Engine engine = new Engine();

        protected void Page_Load(object sender, EventArgs e)
        {

            response = engine._listProducts();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), DateTime.Now.ToString("yyyyMMddhhmmss") + "a", "console.log('"+ response.error +"');", true);
            if (response.error != "")
            {
                //show exception
            }
            else
            {
                if (response.obj != null)
                {
                    //serialize
                    string stringSerialized = engine._serialize(response.obj);
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), DateTime.Now.ToString("yyyyMMddhhmmss"), "genDTProducts('" + stringSerialized + "');", true);
                }
                else
                {
                    //class return is null
                }
            }
        }
    }
}