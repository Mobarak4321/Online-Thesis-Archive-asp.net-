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
    public partial class add_students : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        public string sql;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserLogin"] != null)
            {
                session.Text = Session["UserLogin"].ToString();
                if (!IsPostBack)
                {
                    book_id.Text = Session["Book_ID"].ToString();
                }
            }
            else
            {
                Response.Redirect("index.aspx");
            }
            
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["MyConnection"].ToString();
            conn.Open();
            sql = "INSERT INTO students_list (books_id, name, email) VALUES (@Bbooks_id, @name, @email)";
            cmd = new SqlCommand(sql, conn);

            cmd.Parameters.AddWithValue("@books_id", book_id.Text);
            cmd.Parameters.AddWithValue("@name", name.Text);
            cmd.Parameters.AddWithValue("@email", email.Text);

            cmd.ExecuteNonQuery();

            conn.Close();
            cmd.Dispose();
            Response.Redirect("archive.aspx");
        }
    }
}