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
    public partial class add_users : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        public string sql;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserLogin"] != null)
            {
                session.Text = Session["UserLogin"].ToString();

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
            sql = "INSERT INTO users_list (username, password, access, status) VALUES (@username, @password, @access, @status)";
            cmd = new SqlCommand(sql, conn);

            cmd.Parameters.AddWithValue("@username", username.Text);
            cmd.Parameters.AddWithValue("@password", password.Text);
            cmd.Parameters.AddWithValue("@access", accessLvl.Text);
            cmd.Parameters.AddWithValue("@status", "activate");

            cmd.ExecuteNonQuery();

            conn.Close();
            cmd.Dispose();
            Response.Redirect("archive.aspx");
        }
    }
}