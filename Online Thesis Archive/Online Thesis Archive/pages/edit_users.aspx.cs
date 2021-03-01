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
    public partial class edit_users : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        protected string sql;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserLogin"] != null)
            {
                session.Text = Session["UserLogin"].ToString();
                if (!IsPostBack)
                {
                    users_id.Text = Session["UserID"].ToString();
                    username.Text = Session["Username"].ToString();
                    password.Text = Session["Password"].ToString();
                    accessLvl.Text = Session["AccessLvl"].ToString();
                //    statusLvl.Text = Session["StatusLvl "].ToString();
                }
            }
            else
            {
                Response.Redirect("users.aspx");
            }

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["MyConnection"].ToString();
            conn.Open();
            sql = "UPDATE users_list SET username=@username, password=@password, access=@access, status=@status WHERE users_id=@users_id";
            cmd = new SqlCommand(sql, conn);

            cmd.Parameters.AddWithValue("@users_id", users_id.Text);
            cmd.Parameters.AddWithValue("@username", username.Text);
            cmd.Parameters.AddWithValue("@password", password.Text);
            cmd.Parameters.AddWithValue("@access", accessLvl.Text);
            cmd.Parameters.AddWithValue("@status", statusLvl.Text);
            cmd.ExecuteNonQuery();

            conn.Close();
            cmd.Dispose();
            Response.Redirect("users.aspx");
        }
    }
}