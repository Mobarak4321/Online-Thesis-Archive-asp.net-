using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;

namespace Online_Thesis_Archive.pages
{
    public partial class add_thesis : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        public string sql;

        protected void Page_Load(object sender, EventArgs e)
        {
            // PAGE RESTRICTION
            if (Session["UserLogin"] != null)
            {
                session.Text = Session["UserLogin"].ToString();               
            }
            else
            {
                Response.Redirect("archive.aspx");
            }
        }

        protected void btn_Add_Click(object sender, EventArgs e)
        {
            if (Filesave.HasFile)
            {

                DateTime now = DateTime.Now;
                var dateNow = now.ToString("MMMM dd, yyyy");

                Random r = new Random();
                int num = r.Next();
                string file = Path.GetFileName(Filesave.PostedFile.FileName);
                Filesave.SaveAs(Server.MapPath("~/uploads/") + (num.ToString()) + "-" + file);

                conn.ConnectionString = ConfigurationManager.ConnectionStrings["MyConnection"].ToString();
                conn.Open();
                sql = "INSERT INTO archive_list (title, year, batch, date_added, file_name, file_path) VALUES (@title, @year, @batch, @date_added, @file_name, @file_path)";
                cmd = new SqlCommand(sql, conn);

                cmd.Parameters.AddWithValue("@title", title.Text.ToString());
                cmd.Parameters.AddWithValue("@year", yearLvl.Text.ToString());
                cmd.Parameters.AddWithValue("@batch", batchLvl.Text.ToString());
                cmd.Parameters.AddWithValue("@date_added", dateNow);
                cmd.Parameters.AddWithValue("@file_name", (num.ToString()) + "-" + file);
                cmd.Parameters.AddWithValue("@file_path", Server.MapPath("~/uploads/") + (num.ToString()) + "-" + file);
                 cmd.ExecuteNonQuery();

                conn.Close();
                cmd.Dispose();
                Response.Redirect("archive.aspx");
            }
        }
    }
}