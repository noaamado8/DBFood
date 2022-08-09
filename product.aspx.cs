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
        protected void Page_Load(object sender, EventArgs e)
        {




            var productcode = Request["code"];


            int id_product = 0;

            int nf_id = 0;
            string suitableString,nf_obj;

            DataBase conect = new DataBase();

            var stm = "SELECT  id_product, _code, name, description, brand, owner, embcode, iva, quantity, unit, glutenfree, vegetarian, vegan, palmoil, novagroup, nutriscore, ecoscore,id_nf, image from products WHERE _code like '%" + productcode + "%'"; //vale?
            var cmd = new MySqlCommand(stm, conect.conexion());
            cmd.Prepare();
            MySqlDataReader dbRecords = cmd.ExecuteReader();


            Product productX;
            productX = new Product();

            while (dbRecords.Read())
            {
                if (!dbRecords.IsDBNull(0)){

                   id_product = dbRecords.GetInt32(0);
                }

                if (!dbRecords.IsDBNull(1))
                {
                    productX.code = dbRecords.GetString(1);
                }
                if (!dbRecords.IsDBNull(2))
                {
                    productX.name = dbRecords.GetString(2);
                }
                if (!dbRecords.IsDBNull(3))
                {
                    productX.description = dbRecords.GetString(3);
                }
                if (!dbRecords.IsDBNull(4))
                {
                    productX.brand = dbRecords.GetString(4);

                }
                if (!dbRecords.IsDBNull(5))
                {
                    productX.owner = dbRecords.GetString(5);
                }
                if (!dbRecords.IsDBNull(6))
                {
                    productX.embcode = dbRecords.GetString(6);
                }
                if (!dbRecords.IsDBNull(7))
                {
                    productX.iva = dbRecords.GetString(7);
                }
                if (!dbRecords.IsDBNull(8))
                {
                    productX.quantity = dbRecords.GetString(8);
                }
                if (!dbRecords.IsDBNull(9))
                {
                    productX.unit = dbRecords.GetString(9);
                }
                if (!dbRecords.IsDBNull(10))
                {
                    productX.glutenfree = dbRecords.GetBoolean(10);
                }
                if (!dbRecords.IsDBNull(11))
                {
                    productX.vegetarian = dbRecords.GetBoolean(11);
                }
                if (!dbRecords.IsDBNull(12))
                {
                    productX.vegan = dbRecords.GetBoolean(12);
                }
                if (!dbRecords.IsDBNull(13))
                {
                    productX.palmoil = dbRecords.GetBoolean(13);
                }
                if (!dbRecords.IsDBNull(14))
                {
                    productX.novagroup = dbRecords.GetChar(14);
                }
                if (!dbRecords.IsDBNull(15))
                {
                    productX.nutriscore = dbRecords.GetChar(15);
                }
                if (!dbRecords.IsDBNull(16))
                {
                    productX.ecoscore = dbRecords.GetChar(16);

                }
                if (!dbRecords.IsDBNull(17))
                {
                    nf_id = dbRecords.GetInt32(17);


                }
                if (!dbRecords.IsDBNull(18))
                {
                    productX.image = dbRecords.GetString(18);


                }
            }

           
            name.Text = productX.name ;
          


            code.Text += productX.code;

            description.Text = productX.description;

            quantity.Text = productX.quantity;
            units.Text = '(' + productX.unit + ')';
            brand.Text = productX.brand;
            owner.Text = productX.owner;
            iva.Text += productX.iva + '%';

            embcode.Text += productX.embcode;
            productimage.ImageUrl = "cgi-bin\\pics\\" + productX.image + ".jpg";

            JavaScriptSerializer jss = new JavaScriptSerializer();

            suitableString = jss.Serialize(productX);



            ScriptManager.RegisterStartupScript(Page, Page.GetType(), DateTime.Now.ToString("yyyyMMddhhmmss"), "iconValues('" + suitableString + "');", true);

          

            dbRecords.Close();


            
            var stm2 = "SELECT  energy, fat, satured_fat, carbohydrates, sugars, fiber, proteins, alcohol, extras from nutritional_facts WHERE id_nf=" + nf_id ;
            var cmd2 = new MySqlCommand(stm2, conect.conexion());
            cmd2.Prepare();
            MySqlDataReader nfRecords = cmd2.ExecuteReader();

            Product.NutritionalFacts nfX;
            nfX = new Product.NutritionalFacts();

            while (nfRecords.Read())
            {
        

            if (!nfRecords.IsDBNull(0))
            {

                nfX.energy = nfRecords.GetFloat(0);
}
            if (!nfRecords.IsDBNull(1))
            {
                nfX.fat = nfRecords.GetFloat(1);
            }
            if (!nfRecords.IsDBNull(2))
            {
                nfX.saturedFat = nfRecords.GetFloat(2);
            }
            if (!nfRecords.IsDBNull(3))
            {
                nfX.carbohydrates = nfRecords.GetFloat(3);
            }
            if (!nfRecords.IsDBNull(4))
            {
                nfX.sugars = nfRecords.GetFloat(4);
            }
            if (!nfRecords.IsDBNull(5))
            {
                nfX.fiber = nfRecords.GetFloat(5);
            }
            if (!nfRecords.IsDBNull(6))
            {
                nfX.proteins = nfRecords.GetFloat(6);
            }
            if (!nfRecords.IsDBNull(7))
            {
                nfX.alcohol = nfRecords.GetFloat(7);
            }
            if (!nfRecords.IsDBNull(8))
            {
                nfX.extras = nfRecords.GetFloat(8);
            }
            

        }

            JavaScriptSerializer nf = new JavaScriptSerializer();

            nf_obj = nf.Serialize(nfX);

           

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), DateTime.Now.ToString("yyyyMMddhhmmss"), "nf_table('" + nf_obj + "');", true);

            nfRecords.Close();


            var stm3 = "SELECT * from ingredients where id_ingredient in (select id_ingredient from product_ingredient where id_product=" + id_product+")";
            var cmd3 = new MySqlCommand(stm3, conect.conexion());
            cmd3.Prepare();
            MySqlDataReader ingRecords = cmd3.ExecuteReader();

            Ingredient ingredient;
            List<Ingredient> ingList = new List<Ingredient>();
            JavaScriptSerializer mySer = new JavaScriptSerializer();




            string ingSerialized;


            while (ingRecords.Read())
            {

                ingredient = new Ingredient();
                ingredient.name= ingRecords.GetString(1);
                ingredient.description = ingRecords.GetString(2);
                ingredient.additive= ingRecords.GetBoolean(3);

                ingList.Add(ingredient);

                ingredients.Text += "-" +ingredient.name + " "+ingredient.description+"<br/>";

      
            }

       
        

            ingSerialized = mySer.Serialize(ingList);
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), DateTime.Now.ToString("yyyyMMddhhmmss"), "showIngredients('" + ingSerialized + "');", true);
            
        }
    }
}