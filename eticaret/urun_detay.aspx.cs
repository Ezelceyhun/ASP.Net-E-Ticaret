using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eticaret
{
    public partial class urun_detay : System.Web.UI.Page
    {
        SqlConnection baglan = new SqlConnection(WebConfigurationManager.ConnectionStrings["codingshop"].ConnectionString);
        static int mevcutStok = 0;
        static string fiyat = "0";
        static int sepetAdet = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            //ürün id'si detay.aspx sayfasının URL adresindeki Urun id
            //değerine sahip olan urunü urun tablosundan oku ve listview kontrolüne aktar
            baglan.Open();
            SqlCommand oku = new SqlCommand("select * from urunler where urun_id=@id", baglan);
            oku.Parameters.AddWithValue("@id", Request.QueryString["urunID"]);
            SqlDataReader dr = oku.ExecuteReader();
            ListView1.DataSource = dr;
            ListView1.DataBind();
            baglan.Close();
        }
        Boolean stokYeterliMi(string urun, int adet)
        {
            SqlCommand oku = new SqlCommand("select * from urunler where urun_id=@id", baglan);
            oku.Parameters.AddWithValue("@id", urun);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(oku);
            da.Fill(dt);
            mevcutStok = Convert.ToInt32(dt.Rows[0][6]);
            fiyat = dt.Rows[0][5].ToString();
            if (adet < mevcutStok)
                return true;
            else
                return false;
        }

        Boolean SepetKontrol(string urun, string kullanici)
        {
            SqlCommand oku = new SqlCommand("select * from sepet where urun_id=@u_id and uye_id=@k_id", baglan);
            oku.Parameters.AddWithValue("@u_id", urun);
            oku.Parameters.AddWithValue("@k_id", kullanici);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(oku);
            da.Fill(dt);
            //geriye değer döndü ise
            if (dt.Rows.Count > 0)
            {
                sepetAdet = Convert.ToInt32(dt.Rows[0][3]);
                return true;
            }
            else
                return false;

        }

        void SepetAdetArttir(string urun, string kullanici, int secilenadet)
        {
            SqlCommand guncelle = new SqlCommand("update sepet set adet=@adet where urun_id=@urun and uye_id=@uye", baglan);
            guncelle.Parameters.AddWithValue("@adet", sepetAdet + secilenadet);
            guncelle.Parameters.AddWithValue("@urun", urun);
            guncelle.Parameters.AddWithValue("@uye", kullanici);
            guncelle.ExecuteNonQuery();

        }

        void StokGuncelle(string urun, int secilenadet)
        {
            SqlCommand guncelle = new SqlCommand("update urunler set urun_stok=@stok where urun_id=@urun", baglan);
            guncelle.Parameters.AddWithValue("@stok", mevcutStok - secilenadet);
            guncelle.Parameters.AddWithValue("@urun", urun);
            guncelle.ExecuteNonQuery();

        }

        void Yeni_Kayit_Ekle(string urun, string kullanici, int adet, string fiyat)
        {
            SqlCommand ekle = new SqlCommand("insert into sepet values(@urun,@uye,@adet,@fiyat,@resim,@urunad)", baglan);
            SqlCommand oku = new SqlCommand("select * from urunler where urun_id=@id", baglan);
            oku.Parameters.AddWithValue("@id", urun);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(oku);
            da.Fill(dt);
            string resim = dt.Rows[0][4].ToString();
            string urunads = dt.Rows[0][1].ToString();
            ekle.Parameters.AddWithValue("@urun", urun);
            ekle.Parameters.AddWithValue("@uye", kullanici);
            ekle.Parameters.AddWithValue("@adet", adet);
            ekle.Parameters.AddWithValue("@fiyat", fiyat);
            ekle.Parameters.AddWithValue("@resim", resim);
            ekle.Parameters.AddWithValue("@urunad", urunads);
            ekle.ExecuteNonQuery();
        }
        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
        }

        protected void ListView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            string secilen_urun = Request.QueryString["urunID"].ToString();
            int secilenadet = 0;
            Button btn = (Button)sender; //button1 kontrolüne eriştik
            DropDownList adetliste = (DropDownList)btn.Parent.FindControl("DropDownList1");

            //adet seçilmişmi
            if (adetliste.SelectedIndex > 0)
            {
                secilenadet = Convert.ToInt32(adetliste.SelectedValue);
                //üye girişi yapılmış mı ?
                if (User.Identity.IsAuthenticated)
                {
                    string kullanici = Membership.GetUser().UserName;
                    //stok yeterli mi
                    baglan.Open();
                    if (stokYeterliMi(secilen_urun, secilenadet) == true)
                    {
                        if (SepetKontrol(secilen_urun, kullanici) == true)
                        {
                            SepetAdetArttir(secilen_urun, kullanici, secilenadet);
                            StokGuncelle(secilen_urun, secilenadet);

                        }
                        else
                        {
                            Yeni_Kayit_Ekle(secilen_urun, kullanici, secilenadet, fiyat);
                            StokGuncelle(secilen_urun, secilenadet);
                        }
                    }
                    else
                        Response.Write("<script>alert('Stok yetersiz!..')</script>");
                }
                else
                    Response.Redirect("Giris.aspx?returnURL=" + Request.RawUrl);
            }
            else
                Response.Write("<script>alert('Lütfen ürün adedini seçin')</script>");
        }
    }
}