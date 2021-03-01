using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Online_Thesis_Archive
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        SqlConnection conn = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        SqlDataReader reader;
        string sql;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Login();
        }

        protected void Login()
        {
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["MyConnection"].ToString();
            sql = "SELECT * FROM users_list WHERE username=@username AND password=@password AND status='activate'";
            cmd = new SqlCommand(sql,conn);
            conn.Open();

            cmd.Parameters.AddWithValue("@username", username.Text.ToString());
            cmd.Parameters.AddWithValue("@password", password.Text.ToString());

            reader = cmd.ExecuteReader();
            if(reader.Read() == true)
            {
                if(reader.HasRows == true)
                {
                    if(reader.GetString(4).ToString() == "administrator")
                    {
                        Session["UserLogin"] = reader.GetString(1).ToString();
                        Session["access"] = reader.GetString(3).ToString();
                        Response.Redirect("archive.aspx");
                    }
                    else
                    {
                        Session["UserLogin"] = reader.GetString(1).ToString();
                        Session["access"] = reader.GetString(3).ToString();
                        Response.Redirect("archive.aspx");
                    }
                    conn.Close();
                }
                conn.Close();
            }
        }
    }
}