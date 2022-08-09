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
        protected void Page_Load(object sender, EventArgs e)
        {


            DataBase conect = new DataBase();

            var stm = "SELECT _code, name, iva from products LIMIT 1000";
            var cmd = new MySqlCommand(stm, conect.conexion());
            cmd.Prepare();
            MySqlDataReader dbRecords = cmd.ExecuteReader();


            Product product;
            List<Product> productList = new List<Product>();
            JavaScriptSerializer mySer = new JavaScriptSerializer();

            string stringSerialized;


            while (dbRecords.Read())
            {

                product= new Product();
                product.code=dbRecords.GetString(0);
                product.description = dbRecords.GetString(1).Replace("\\", "").Replace("/", "");//Nn me deixa quitar o Replace non sei pq
                product.iva = dbRecords.GetString(2);
            

                productList.Add(product);
            }

            stringSerialized = mySer.Serialize(productList);
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), DateTime.Now.ToString("yyyyMMddhhmmss"), "genDTProducts('" + stringSerialized + "');", true);

        }



      

    }
}