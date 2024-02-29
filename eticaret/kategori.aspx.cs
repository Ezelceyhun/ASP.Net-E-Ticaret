using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eticaret
{
    public partial class kategori : System.Web.UI.Page
    {
        SqlConnection baglan = new SqlConnection(WebConfigurationManager.ConnectionStrings["codingshop"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            baglan.Open();
            SqlCommand oku = new SqlCommand("select * from urunler where  kategori_id=@id", baglan);
            oku.Parameters.AddWithValue("@id", Request.QueryString["kategoriID"]);
            SqlDataReader dr = oku.ExecuteReader();
            ListView1.DataSource = dr;
            ListView1.DataBind();
            baglan.Close();
        }
        void urun_kat()
        {
            baglan.Open();
            SqlCommand oku = new SqlCommand("select * from urunler where kategori_id=@id", baglan);
            oku.Parameters.AddWithValue("@id", Request.QueryString["kategoriID"]);
            SqlDataReader dr = oku.ExecuteReader();
            ListView1.DataSource = dr;
            ListView1.DataBind();
            baglan.Close();
        }
    }
}