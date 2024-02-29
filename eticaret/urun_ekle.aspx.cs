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
    public partial class urun_ekle : System.Web.UI.Page
    {
        SqlConnection baglanti = new SqlConnection(WebConfigurationManager.ConnectionStrings["codingshop"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex > 0)
            {
                if (FileUpload1.HasFile == true)
                {
                    string secilen_dosya = FileUpload1.FileName;
                    string uzanti = System.IO.Path.GetExtension(secilen_dosya);
                    if (uzanti == ".jpg" || uzanti == ".jpeg" || uzanti == ".png" || uzanti == ".jfif")
                    {
                        FileUpload1.SaveAs(Server.MapPath("urun-resim/") + secilen_dosya);
                        baglanti.Open();
                        SqlCommand ekle = new SqlCommand("insert urunler values(@urun_ad,@urun_aciklama,@urun_kategori,@urun_resmi,@urun_fiyat,@urun_stok)", baglanti);
                        ekle.Parameters.AddWithValue("@urun_ad", TextBox1.Text);
                        ekle.Parameters.AddWithValue("@urun_aciklama", TextBox2.Text);
                        ekle.Parameters.AddWithValue("@urun_kategori", DropDownList1.SelectedValue);
                        ekle.Parameters.AddWithValue("@urun_resmi", secilen_dosya);
                        ekle.Parameters.AddWithValue("@urun_fiyat", TextBox3.Text);
                        ekle.Parameters.AddWithValue("@urun_stok", TextBox4.Text);
                        ekle.ExecuteNonQuery();
                        baglanti.Close();
                        Response.Redirect("urun_ekle.aspx");
                    }
                    else
                        Response.Write("<script>alert('Geçersiz dosya uzantisi')</script>");
                }
                else
                    Response.Write("<script>alert('Lütfen önce ürün resmini seçin')</script>");
            }
            else
                Response.Write("<script>alert('Lütfen ürün kategorisini ve ürün statüsünü seçin')</script>");
        }
    }
}