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
    public partial class edit_thesis : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        protected string sql;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserLogin"] != null)
            {
                session.Text = Session["UserLogin"].ToString();
                if(!IsPostBack)
                {
                   book_id.Text = Session["books_id"].ToString();
                   title.Text = Session["title"].ToString();
                   yearLvl.Text = Session["year"].ToString();
                   batchLvl.Text = Session["batch"].ToString();
                }
            }
            else
            {
                Response.Redirect("archive.aspx");
            }
        }

        protected void btnUodate_Click(object sender, EventArgs e)
        {
            if (Filesave.HasFile)
            {

                Random r = new Random();
                int num = r.Next();
                string file = Path.GetFileName(Filesave.PostedFile.FileName);
                Filesave.SaveAs(Server.MapPath("~/uploads/") + (num.ToString()) + "-" + file);

                conn.ConnectionString = ConfigurationManager.ConnectionStrings["MyConnection"].ToString();
                conn.Open();
                sql = "UPDATE archive_list SET title=@title, year=@year, batch=@batch,file_name=@file_name, file_path=@file_path WHERE books_id=@books_id";
                cmd = new SqlCommand(sql, conn);

                cmd.Parameters.AddWithValue("@books_id", book_id.Text.ToString());
                cmd.Parameters.AddWithValue("@title", title.Text.ToString());
                cmd.Parameters.AddWithValue("@year", yearLvl.Text.ToString());
                cmd.Parameters.AddWithValue("@batch", batchLvl.Text.ToString());
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