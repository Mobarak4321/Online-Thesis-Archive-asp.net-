using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Thesis_Archive.Master_Pages
{
    public partial class LoginHeader : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            access.Text = Session["access"].ToString();
            if (access.Text == "students")
            {
                usersBtn.Visible = false;
            }
            else
            {
                usersBtn.Visible = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("index.aspx");
        }
    }
}