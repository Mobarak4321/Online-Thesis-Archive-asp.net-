using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Online_Thesis_Archive.pages
{
    public partial class user : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserLogin"] != null)
            {
                session.Text = Session["UserLogin"].ToString();
                if (!IsPostBack)
                {

                }
            }
            else
            {
                Response.Redirect("index.aspx");
            }
        }

        protected void addUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("add_users.aspx");
        }

        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            int index = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;

            Session["UserID"] = GridView1.Rows[index].Cells[0].Text;
            Session["Username"] = GridView1.Rows[index].Cells[1].Text;
            Session["Password"] = GridView1.Rows[index].Cells[2].Text;
            Session["AccessLvl"] = GridView1.Rows[index].Cells[3].Text;
            Session["StatusLvl"] = GridView1.Rows[index].Cells[4].Text;

            Response.Redirect("edit_users.aspx");
        }

        protected void RemoveBtn_Click(object sender, EventArgs e)
        {

        }


    }
}