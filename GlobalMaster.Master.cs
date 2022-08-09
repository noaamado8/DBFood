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
            if (this.Session["user"] == null)
            {
                wBtnLogout.Visible = false;
                wBtnLogin.Visible = true;
                currentUser.Visible = false;
                currentUser.Text = "";
            }
            else
            {
                wBtnLogin.Visible = false;
                wBtnLogout.Visible = true;
                currentUser.Visible = true;
                currentUser.Text = this.Session["user"].ToString();

            }
        }


        protected void wBtnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void wBtnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("index.aspx");
        }
    }
}