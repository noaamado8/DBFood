using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DBFood
{
    public partial class GlobalMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Session["user_email"] == null)
            {
                wBtnLogout.Visible = false;
                wBtnLogin.Visible = true;
                currentUser.Visible = false;
                currentUser.Text = "";
                myproductslist.Visible = false;
            }
            else
            {
                wBtnLogin.Visible = false;
                wBtnLogout.Visible = true;
                currentUser.Visible = true;
                currentUser.Text = this.Session["user_email"].ToString();
                myproductslist.Visible = true;
            }
        }


        protected void wBtnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void wBtnLogout_Click(object sender, EventArgs e)
        {

            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
            Response.Cache.SetNoStore();

            Response.CacheControl = "no-cache";
            Session["user_email"] = null;
            Session["id_user"] = null;

            Session.Abandon();

            System.Web.Security.FormsAuthentication.SignOut();
            Response.Redirect("index.aspx");   



        }


        protected void wBtnMyProductsList_Click(object sender, EventArgs e)
        {
            Response.Redirect("myproducts.aspx");
        }
        protected void wBtnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }
        protected void wBtnAbout_Click(object sender, EventArgs e)
        {
            Response.Redirect("about.aspx");
        }




    }
}