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
    public partial class rol_yoneticisi : System.Web.UI.Page
    {
        SqlConnection baglanti = new SqlConnection(WebConfigurationManager.ConnectionStrings["codingshop"].ConnectionString);

        void kullanici_rol_listele()
        {
            string secilen_kullanici = DropDownList1.SelectedValue;
            string[] roller = Roles.GetRolesForUser(secilen_kullanici);
            GridView2.DataSource = roller;
            GridView2.DataBind();
        }
        void kullanicilari_listele()
        {
            MembershipUserCollection kullanicilar = Membership.GetAllUsers();
            DropDownList1.DataSource = kullanicilar;
            DropDownList1.DataBind();

        }
        void rolleri_listele()
        {
            string[] roller = Roles.GetAllRoles();
            GridView1.DataSource = roller;
            GridView1.DataBind();
            GridView1.HeaderRow.Cells[1].Text = "Tanımlı Roller";
            DropDownList2.DataSource = roller;
            DropDownList2.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            kullanicilari_listele();
            rolleri_listele();
            kullanici_rol_listele();
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == "")
            {
                Label1.Text = "Lütfen bir rol adı girin";
                return;

            }
            string rol_adi = TextBox1.Text;
            if (Roles.RoleExists(rol_adi) == true)
            {
                Label1.Text = "Bu rol zaten kayıtlı. Lütfen farklı bir rol adı girin";
                return;
            }

            /*TextBox kontrolüne girilen rolü veri kaynağına kayıt et*/
            Roles.CreateRole(rol_adi);
            Label1.Text = "Rol kaydı tamamlandı";
            rolleri_listele();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string silinecek_rol = e.Values[0].ToString();
            Roles.DeleteRole(silinecek_rol);
            rolleri_listele();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (TextBox2.Text == "")
            {
                Label2.Text = "Lütfen kullanıcı adını girin";
                return;
            }
            string kullanici_adi = TextBox2.Text;
            MembershipUser kullanici = Membership.GetUser(kullanici_adi);
            if (kullanici == null)
            {
                Label2.Text = "Bu kullanıcı kayıtlı değil. Lütfen sistemde kayıtlı kullanıcı adı girin";
                return;
            }
            string secilen_rol = DropDownList2.SelectedValue;
            if (Roles.IsUserInRole(kullanici_adi, secilen_rol) == true)
            {
                Label2.Text = "Bu kullanıcı seçilen role zaten eklenmiş. Lütfen farklı bir kullanıcı ya da rol seçin";
                return;
            }
            Roles.AddUserToRole(kullanici_adi, secilen_rol);
            Response.Redirect("rol_yoneticisi.aspx");
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            kullanici_rol_listele();
        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView3_SelectedIndexChanged1(object sender, EventArgs e)
        {
        }
    }
}