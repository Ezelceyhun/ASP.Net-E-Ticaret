<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kullanici_bilgi.aspx.cs" Inherits="eticaret.kullanici_bilgi" MasterPageFile="~/admin_panel_masterpage.Master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <asp:DataList ID="DataList1" runat="server" DataSourceID="kullanicilar" RepeatColumns="5" RepeatDirection="Horizontal" BorderColor="Black" BorderWidth="1px" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" GridLines="Both">
        <ItemTemplate>
            <div class="baslik_text">Kullanıcı Adı:
            <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' /></div>
            <div class="baslik_text">E-Posta:
            <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' /></div>
            <div class="baslik_text">Hesap Açılışı:
            <asp:Label ID="CreateDateLabel" runat="server" Text='<%# Eval("CreateDate") %>' /></div>
            <div class="baslik_text">Son Giriş:
            <asp:Label ID="LastLoginDateLabel" runat="server" Text='<%# Eval("LastLoginDate") %>' /></div>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="kullanicilar" runat="server" ConnectionString="<%$ ConnectionStrings:codingshop %>" SelectCommand="SELECT [UserName], [Email], [CreateDate], [LastLoginDate] FROM [vw_aspnet_MembershipUsers]"></asp:SqlDataSource>
</asp:Content>

