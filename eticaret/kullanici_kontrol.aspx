<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kullanici_kontrol.aspx.cs" Inherits="eticaret.kullanici_kontrol" MasterPageFile="~/admin_panel_masterpage.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <table class="auto-style1">
        <tr>
            <td id="kul_kontrol_text" class="auto-style7">Kullanıcı Adını Gir:</td>
            <td class="auto-style8">
                <asp:TextBox ID="TextBox1" CssClass="text_css" runat="server" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td id="kul_kontrol_text" class="auto-style9">Kullanıcı Adı:</td>
            <td class="auto-style10">
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td id="kul_kontrol_text" class="auto-style5">E-Posta:</td>
            <td class="auto-style6">
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td id="kul_kontrol_text" class="auto-style11">Hesap Onayı:</td>
            <td class="auto-style12">
                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td id="kul_kontrol_text" class="auto-style13">Hesap Aktifliği:</td>
            <td class="auto-style14">
                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td id="kul_kontrol_text" class="auto-style9">Giriş Aktifliği:</td>
            <td class="auto-style10">
                <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td id="kul_kontrol_text" class="auto-style5">Hesap Açılış Tarihi:</td>
            <td class="auto-style6">
                <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td id="kul_kontrol_text" class="auto-style15">Son Giriş Tarihi:</td>
            <td class="auto-style16">
                <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td id="kul_kontrol_text" class="auto-style17">Parola Değiştirme Zamanı:</td>
            <td class="auto-style18">
                <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td id="kul_kontrol_text" class="auto-style15">En Son Aktivasyon Zamanı:</td>
            <td class="auto-style16">
                <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td id="kul_kontrol_text" class="auto-style3">
                <asp:Button CssClass="kullanici_kontrol_buton" ID="Button1" runat="server" Text="Hesap Kilidini Aç" OnClick="Button1_Click" />
            </td>
            <td class="auto-style4">
                <asp:Button CssClass="kullanici_kontrol_buton" ID="Button2" runat="server" Text="Kullanıcıyı Sil" OnClick="Button2_Click" />
            </td>
        </tr>
        </table>

</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            width: 236px;
            height: 80px;
        }
        .auto-style4 {
            height: 80px;
        }
        .auto-style5 {
            width: 236px;
            height: 31px;
        }
        .auto-style6 {
            height: 31px;
        }
        .auto-style7 {
            width: 236px;
            height: 72px;
        }
        .auto-style8 {
            height: 72px;
        }
        .auto-style9 {
            width: 236px;
            height: 33px;
        }
        .auto-style10 {
            height: 33px;
        }
        .auto-style11 {
            width: 236px;
            height: 32px;
        }
        .auto-style12 {
            height: 32px;
        }
        .auto-style13 {
            width: 236px;
            height: 30px;
        }
        .auto-style14 {
            height: 30px;
        }
        .auto-style15 {
            width: 236px;
            height: 26px;
        }
        .auto-style16 {
            height: 26px;
        }
        .auto-style17 {
            width: 236px;
            height: 27px;
        }
        .auto-style18 {
            height: 27px;
        }
    </style>
</asp:Content>
