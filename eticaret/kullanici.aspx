<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kullanici.aspx.cs" Inherits="eticaret.kullanici" MasterPageFile="~/menuler.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="kullanici.css" type="text/css" rel="stylesheet"  media="all"/>
     <script src="menu.js"></script>  
   <h2 style="color:green"> 
       
    </h2> 
    <div id="tabsDiv"> 
        <div id="siparislerim" class="contentClass"> 
            <h3>Siparişlerim</h3> 
            SİPARİŞ TABLOSU
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="urun_ad" HeaderText="urun_ad" SortExpression="urun_ad" />
                    <asp:BoundField DataField="adet" HeaderText="adet" SortExpression="adet" />
                    <asp:BoundField DataField="fiyat" HeaderText="fiyat" SortExpression="fiyat" />
                </Columns>
            </asp:GridView> 
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:codingshop %>" SelectCommand="SELECT urunler.urun_ad, sepet.adet, sepet.fiyat FROM sepet INNER JOIN urunler ON sepet.urun_id = urunler.urun_id INNER JOIN aspnet_Users ON sepet.uye_id = aspnet_Users.UserId"></asp:SqlDataSource>
        </div> 
  
        <div id="adreslerim" class="contentClass"> 
            <h3>Adreslerim</h3> 
            ADRESLERİM
            <asp:GridView ID="GridView2" runat="server"></asp:GridView>
        </div> 
        <ul class="ulClass" style="height:300px"> 
            <li style="list-style-type:none;"> 
                <button type="button" class="linkClass" onclick="displayContent(event, 'siparislerim')"> 
                    Siparişlerim</button> 
            </li> 
              
            <li style="list-style-type:none;"> 
                <button type="button" class="linkClass" onclick="displayContent(event, 'adreslerim')"> 
                    Adreslerim 
                </button> 
            </li> 
  
            <li style="list-style-type:none;"> 
                <button type="button" class="linkClass" onclick= "displayContent(event, 'sifredegis')"> 
                    Şifre Değiştir 
                </button> 
            </li> 
  
            <li style="list-style-type:none;"> 
                <button type="button" class="linkClass" >
                    <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutPageUrl="~/kullanici_giris_uye.aspx" />
                </button> 
            </li> 
        </ul> 
    </div> 
</asp:Content>
