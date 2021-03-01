using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;

namespace Online_Thesis_Archive
{
    public partial class index : System.Web.UI.Page
    {
        StringBuilder table = new StringBuilder();
        SqlConnection conn = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        SqlDataReader reader;
        string sql;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            int index = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;

            Session["title"] = GridView1.Rows[index].Cells[0].Text;

            conn.ConnectionString = ConfigurationManager.ConnectionStrings["MyConnection"].ToString();
            sql = "SELECT * FROM archive_list WHERE title=@title";
            cmd = new SqlCommand(sql, conn);
            conn.Open();

            cmd.Parameters.AddWithValue("@title", Session["title"].ToString());

            reader = cmd.ExecuteReader();

            // READ COMMAND IF EXIST
            if (reader.Read() == true)
            {
                if (reader.HasRows == true)
                {
                    // EXECUTE DOWNLOAD FILE
                    Session["file_name"] = reader.GetString(5).ToString();
                    string file = Session["file_name"].ToString();

                    Response.ContentType = "application/octet-stream";
                    Response.AppendHeader("content-disposition", "attachment;filename=" + file);
                    Response.TransmitFile(Server.MapPath("~/uploads/" + file));
                    Response.End();
                    conn.Close();
                }
                conn.Close();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

            // INITIALIZE DATASOURCE
            GridView1.DataSourceID = String.Empty;
            GridView1.DataBind();

            if (GridView1.DataSource == null)
            {
                // CHANGE DATASOURCE
                GridView1.DataSource = SqlDataSearch;
                GridView1.DataBind();
            }
        }
    }
}