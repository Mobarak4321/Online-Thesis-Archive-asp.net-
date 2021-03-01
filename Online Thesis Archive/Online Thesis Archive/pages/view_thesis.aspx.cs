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
    public partial class view_thesis : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            // PAGE RESTRICTION
            if (Session["UserLogin"] != null)
            {

                session.Text = Session["UserLogin"].ToString();
                if (!IsPostBack)
                {
                    books_id.Text = Session["books_id"].ToString();
                    Label1.Text = Session["title"].ToString();
                    Label2.Text = Session["year"].ToString();
                    Label3.Text = Session["batch"].ToString();
                    Label4.Text = Session["batch"].ToString();

                    //StudentList();
                }

            }
            else
            {
                Response.Redirect("index.aspx");
            }
        }

        protected void editBtn_Click(object sender, EventArgs e)
        {
            int index = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;

            edit_thesis frm = new edit_thesis();

            Session["id"] = GridView1.Rows[index].Cells[0].Text;
            Session["name"] = GridView1.Rows[index].Cells[1].Text;
            Session["email"] = GridView1.Rows[index].Cells[2].Text;

            Response.Redirect("edit_students.aspx");
        }

        protected void RedirectBtn_Click(object sender, EventArgs e)
        {
            Session["Book_ID"] = books_id.Text.ToString();
            Response.Redirect("add_students.aspx");
        }
    }
}