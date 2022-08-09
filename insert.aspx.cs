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
        protected void Page_Load(object sender, EventArgs e)
        {
            //Validar usuario
            if (this.Session["user"] == null || this.Session["user"].ToString() == "")
            {
                Response.Redirect("login.aspx");
            }
        }
        protected void addProduct_Click(object sender, EventArgs e)
        {
            DataBase con = new DataBase();
            StringBuilder sb = new StringBuilder();
            string[] fileContent = image.PostedFile.ContentType.Split('/');
            if (image.HasFile)
            {
//                string[] extensions =['jpg', 'jpeg','png'];
           
                try
                {
                    sb.AppendFormat(" Uploading file: {0}", image.FileName);

                    //saving the file
                    image.SaveAs("C:\\Users\\Iago&Noa\\Documents\\Visual Studio 2015\\Projects\\DBFood\\DBFood\\cgi-bin\\pics\\" + image.FileName);

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
              //  walert.Text = sb.ToString();

            }


            var stm = "INSERT INTO products (_code,name,description,brand,embcode,owner,iva,quantity,unit,glutenfree,vegetarian,vegan,palmoil,novagroup,nutriscore,ecoscore,image,id_user) values (@code,@name,@description,@brand,@embcode,@owner,@iva,@quantity,@unit,@glutenfree,@vegetarian,@vegan,@palmoil,@novagroup,@nutriscore,@ecoscore,@image,@id_user)";
            MySqlCommand cmd = new MySqlCommand(stm, con.conexion());
            cmd.Parameters.AddWithValue("@code", code.Text);
            cmd.Parameters.AddWithValue("@name", name.Text);
            cmd.Parameters.AddWithValue("@description", description.Text);
            cmd.Parameters.AddWithValue("@brand", brand.Text);
            cmd.Parameters.AddWithValue("@embcode", embcode.Text);
            cmd.Parameters.AddWithValue("@owner", owner.Text);
            cmd.Parameters.AddWithValue("@iva", iva.Text);
            cmd.Parameters.AddWithValue("@quantity", quantity.Text);
            cmd.Parameters.AddWithValue("@unit", unit.Text);

            cmd.Parameters.AddWithValue("@glutenfree", glutenfree.Checked);
            cmd.Parameters.AddWithValue("@vegetarian", vegetarian.Checked);
            cmd.Parameters.AddWithValue("@vegan", vegan.Checked);
            cmd.Parameters.AddWithValue("@palmoil", has_palmoil.Checked);
            cmd.Parameters.AddWithValue("@novagroup", novagroup.Text);
            cmd.Parameters.AddWithValue("@nutriscore", nutriscore.Text);
            cmd.Parameters.AddWithValue("@ecoscore", nutriscore.Text);
            cmd.Parameters.AddWithValue("@image", code.Text+"."+fileContent[1]);
            cmd.Parameters.AddWithValue("@id_user", this.Session["id_user"]);



            cmd.Prepare();
            int rexistros = cmd.ExecuteNonQuery();

            if (rexistros != 0)
            {
                walertsuccess.Text = "The product has been added successfully";
                walertsuccess.Visible = true;
            }
            else
            {
                walertdanger.Text = "There was an error adding the product";
                walertdanger.Visible = true;
            }

        }





    }
}