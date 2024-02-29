using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eticaret
{
    public partial class menuler : System.Web.UI.MasterPage
    {
        SqlConnection baglan = new SqlConnection(WebConfigurationManager.ConnectionStrings["codingshop"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            baglan.Open();
            SqlCommand oku = new SqlCommand("select * from kategori", baglan);
            SqlDataReader dr = oku.ExecuteReader();
            ListView1.DataSource = dr;
            ListView1.DataBind();
            baglan.Close();
        }
    }
}