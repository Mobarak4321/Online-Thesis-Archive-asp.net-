using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Online_Thesis_Archive.pages
{
    public partial class edit_students : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        protected string sql;

        protected void Page_Load(object sender, EventArgs e)
        {
              // PAGE RESTRICTION
              if (Session["UserLogin"] != null)
              {
                session.Text = Session["UserLogin"].ToString();
                    if (!IsPostBack)
                    {
                        id.Text = Session["id"].ToString();
                        name.Text = Session["name"].ToString();
                        email.Text = Session["email"].ToString();
                    }
              } else
              {
                Response.Redirect("index.aspx");
              }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["MyConnection"].ToString();
            conn.Open();
            sql = "UPDATE students_list SET name=@name, email=@email WHERE books_id=@books_id";
            cmd = new SqlCommand(sql, conn);

            cmd.Parameters.AddWithValue("@name", name.Text);
            cmd.Parameters.AddWithValue("@email", email.Text);
            cmd.Parameters.AddWithValue("@books_id", id.Text);
            cmd.ExecuteNonQuery();
           
            conn.Close();
            cmd.Dispose();
            Response.Redirect("archive.aspx");
        }
    }
}