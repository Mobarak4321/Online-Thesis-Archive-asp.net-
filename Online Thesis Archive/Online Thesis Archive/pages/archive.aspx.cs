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

namespace Online_Thesis_Archive.pages
{
    public partial class archive : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        SqlDataReader reader;
        string sql;

        protected void Page_Load(object sender, EventArgs e)
        {
            // PAGE RESTRICTION
            if (Session["UserLogin"] != null)
            {
                if (Session["access"].ToString() == "students")
                {
                    addThesis.Visible = false;
                }
                else
                {
                    addThesis.Visible = true;
                }
            } else
            {
                Response.Redirect("index.aspx");
            }
        }

         protected void ViewBtn_Click(object sender, EventArgs e)
         {
             int index = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;

             Session["books_id"] = GridView1.Rows[index].Cells[0].Text;
             Session["title"] = GridView1.Rows[index].Cells[1].Text;
             Session["year"] = GridView1.Rows[index].Cells[2].Text;
             Session["batch"] = GridView1.Rows[index].Cells[3].Text;

             Response.Redirect("view_thesis.aspx");
         }

         protected void EditBtn_Click(object sender, EventArgs e)
         {
             int index = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;

             Session["books_id"] = GridView1.Rows[index].Cells[0].Text;

             conn.ConnectionString = ConfigurationManager.ConnectionStrings["MyConnection"].ToString();
             sql = "SELECT * FROM archive_list WHERE books_id=@books_id";
             cmd = new SqlCommand(sql, conn);
             conn.Open();

             cmd.Parameters.AddWithValue("@books_id", Session["books_id"].ToString());

             reader = cmd.ExecuteReader();

             // READ COMMAND IF EXIST
             if (reader.Read() == true)
             {
                 if (reader.HasRows == true)
                 {
                     // INITIALIZE VARIABLE
                     Session["title"] = reader.GetString(1).ToString();
                     Session["year"] = reader.GetString(2).ToString();
                     Session["batch"] = reader.GetString(3).ToString();
                     Session["file_name"] = reader.GetString(5).ToString();
                     Session["file_path"] = reader.GetString(6).ToString();

                     Response.Redirect("edit_thesis.aspx");
                     conn.Close();
                 }
                 conn.Close();
             }
         }

         protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
         {
             switch (e.Row.RowType)
             {
                 case DataControlRowType.DataRow:
                     DataRowView myDataRowView = (DataRowView)e.Row.DataItem;
                         Button Visible = (Button)e.Row.FindControl("EditBtn");
                         if (access.Text == "students")
                         {
                             Visible.Visible = false;
                         }
                         break;
             }
        }

         protected void addThesis_Click(object sender, EventArgs e)
         {
             Response.Redirect("add_thesis.aspx");
         }

         protected void DownloadBtn_Click(object sender, EventArgs e)
         {
             int index = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;

             Session["row_id"] = GridView1.Rows[index].Cells[0].Text;

             conn.ConnectionString = ConfigurationManager.ConnectionStrings["MyConnection"].ToString();
             sql = "SELECT * FROM archive_list WHERE books_id=@row_id";
             cmd = new SqlCommand(sql, conn);
             conn.Open();

             cmd.Parameters.AddWithValue("@row_id", Session["row_id"].ToString());

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
    }
}