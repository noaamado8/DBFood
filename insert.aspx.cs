using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Text;


namespace DBFood
{
    public partial class insert : System.Web.UI.Page
    {
        Engine engine = new Engine();
        GenericResponse response;
        Product product = new Product();
      //  List<string> intolerance_list = new List<string>();
        

        bool editing; //aegun el code request


        protected void Page_Load(object sender, EventArgs e)
        {
            //Validar usuario

            //Chequear roles

            if (this.Session["user_email"] == null || this.Session["user_email"].ToString() == "")
            {
                Response.Redirect("login.aspx");
            }

            if (Request["code"] != null)
            {
                editing = true;
            }
        }


     


        protected void wBtnAddProduct_Click(object sender, EventArgs e)
        {


            #region nutfac_obj

            product.nutritionalFacts.energy = float.Parse(nfenergy.Text);
            product.nutritionalFacts.fat = float.Parse(nffat.Text);
            product.nutritionalFacts.saturedFat = float.Parse(nfsaturedfat.Text);
            product.nutritionalFacts.carbohydrates = float.Parse(nfcarbohydrates.Text);
            product.nutritionalFacts.sugars = float.Parse(nfsugars.Text);
            product.nutritionalFacts.fiber = float.Parse(nffiber.Text);
            product.nutritionalFacts.proteins = float.Parse(nfproteins.Text);
            product.nutritionalFacts.alcohol = float.Parse(nfalcohol.Text);
            product.nutritionalFacts.extras = float.Parse(nfextras.Text);
            product.nutritionalFacts.salt = float.Parse(nfsalt.Text);
            product.nutritionalFacts.vitA = float.Parse(nfvita.Text);
            product.nutritionalFacts.vitD = float.Parse(nfvitd.Text);
            product.nutritionalFacts.vitE = float.Parse(nfvite.Text);
            product.nutritionalFacts.vitK = float.Parse(nfvitk.Text);
            product.nutritionalFacts.vitC = float.Parse(nfvitc.Text);
            product.nutritionalFacts.thiamine = float.Parse(nfthiamine.Text);
            product.nutritionalFacts.riboflavin = float.Parse(nfriboflavin.Text);
            product.nutritionalFacts.niacin = float.Parse(nfniacin.Text);
            product.nutritionalFacts.vitB6 = float.Parse(nfvitb6.Text);
            product.nutritionalFacts.folic_acid = float.Parse(nffolicacid.Text);
            product.nutritionalFacts.vitB12 = float.Parse(nfvitb12.Text);
            product.nutritionalFacts.biotin = float.Parse(nfbiotine.Text);
            product.nutritionalFacts.pantothenic_acid = float.Parse(nfpantothenicacid.Text);
            product.nutritionalFacts.potassium = float.Parse(nfpotassium.Text);
            product.nutritionalFacts.chlorine = float.Parse(nfchlorine.Text);
            product.nutritionalFacts.calcium = float.Parse(nfcalcium.Text);
            product.nutritionalFacts.phosphorus = float.Parse(nfphosphorus.Text);
            product.nutritionalFacts.magnesium = float.Parse(nfmagnesium.Text);
            product.nutritionalFacts.iron = float.Parse(nfiron.Text);
            product.nutritionalFacts.zinc = float.Parse(nfzinc.Text);
            product.nutritionalFacts.copper = float.Parse(nfcopper.Text);
            product.nutritionalFacts.manganese = float.Parse(nfmanganese.Text);
            product.nutritionalFacts.fluorine = float.Parse(nffluorine.Text);
            product.nutritionalFacts.selenium = float.Parse(nfenergy.Text);
            product.nutritionalFacts.chrome = float.Parse(nfenergy.Text);
            product.nutritionalFacts.molybdenum = float.Parse(nfenergy.Text);
            product.nutritionalFacts.iodine = float.Parse(nfiodine.Text);


            #endregion



            StringBuilder sb = new StringBuilder();
            string[] fileContent = image.PostedFile.ContentType.Split('/');
            string imagename = code.Text + "." + fileContent[1];

            #region product_obj

            product.code = code.Text;
            product.name = name.Text;
            product.description = description.Text;
            product.brand = brand.Text;
            product.embcode = embcode.Text;
            product.owner = owner.Text;
            product.iva = iva.Text;
            product.quantity = quantity.Text;
            product.unit = unit.Text;
            product.glutenfree = glutenfree.Checked;
            product.vegetarian = vegetarian.Checked;
            product.vegan = vegan.Checked;
            product.palmoil = has_palmoil.Checked;
            product.novagroup = Convert.ToChar(novagroup.SelectedValue);
            product.ecoscore = Convert.ToChar(ecoscore.SelectedValue);
            product.nutriscore = Convert.ToChar(nutriscore.SelectedValue);
            product.image = imagename;
            product.id_user = Convert.ToInt32(this.Session["id_user"]);

            if (pack_check.Checked)
            {
                product.pack = true;
                product.multiplier = Convert.ToInt32(pack_multiplier.Text);

            }



            #endregion



            if (image.HasFile)
            {
                //                string[] extensions =['jpg', 'jpeg','png'];

                try
                {
                    sb.AppendFormat(" Uploading file: {0}", image.FileName);

                    //saving the file
                    image.SaveAs("C:\\Users\\Iago&Noa\\Documents\\Visual Studio 2015\\Projects\\DBFood\\DBFood\\cgi-bin\\pics\\" + imagename);

                    //Showing the file information
                    sb.AppendFormat("<br/> Save As: {0}", image.PostedFile.FileName);
                    sb.AppendFormat("<br/> File type: {0}", image.PostedFile.ContentType);
                    sb.AppendFormat("<br/> File length: {0}", image.PostedFile.ContentLength);
                    sb.AppendFormat("<br/> File name: {0}", image.PostedFile.FileName);

                }
                catch (Exception ex)
                {
                    sb.Append("<br/> Error <br/>");
                    sb.AppendFormat("Unable to save file <br/> {0}", ex.Message);
                }
            }



            //ingredients
            string[] ingredients_names_Arr = ingredients.Text.Split(',');
            string[] ingredients_description_Arr = ingredients_description.Text.Split(',');
            string[] ingredients_percentage_Arr = ingredients_percentage.Text.Split(',');
            string[] ingredients_additive_Arr = ingredients_additive.Text.Split(',');


            for (int i=0; i < ingredients_names_Arr.Length; i++)
            {
                Ingredient ingredient = new Ingredient();

                ingredient.name = ingredients_names_Arr[i];
                ingredient.description = ingredients_description_Arr[i];
                ingredient.additive = Convert.ToBoolean(ingredients_additive_Arr[i]) ;
                ingredient.percentage = float.Parse(ingredients_percentage_Arr[i]);

                product.ingredients.Add(ingredient);

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), DateTime.Now.ToString("yyyyMMddhhmmss") + "f", "console.log('" + ingredient.ToString() + "ll');", true);

            }



                  

            string[] intolerances_all = intolerances.Text.Split(',');
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), DateTime.Now.ToString("yyyyMMddhhmmss") + "z", "console.log('" + intolerances_all.ToString() + "lista');", true);
            
            foreach (string intolerance_each in intolerances_all)
            {

                product.intolerances.Add(intolerance_each);

            }


            string[] materials_all = materials.Text.Split(',');
           

            foreach (string material_each in materials_all)
            {

                product.materials.Add(material_each);

            }



            response = engine._addProduct(product);
                if (response.error != "")
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), DateTime.Now.ToString("yyyyMMddhhmmss") + "a", "console.log('" + response.error + "erro');", true);

                }
                else
                {
                    if (response.operation_success)
                    {

                        //serialize???????
                        //mostrar succes 
                    }
                    else
                    {
                        //class return is null
                    }
                }

            

        }

     

    }

 

       




}
