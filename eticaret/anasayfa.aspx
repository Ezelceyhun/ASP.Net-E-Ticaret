<%@ Page Language="c#" MasterPageFile="~/anasayfa_masterpage.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="tum_urunler_anasayfa">
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div class="tek_urun_div">
                    <div class="urun_resim">
                        <img class="urun_resim_sinir" src="urun-resim/<%# Eval("urun_resmi") %>" />
                    </div>
                    <div class="urun_aciklama">
                        <%# Eval("urun_ad") %>
                    </div>
                    <div class="urun_fiyat">
                        <%# Eval("urun_fiyat") %> ₺	
                    </div>
                    <div class="urun_buton" align="center">
                        <a href="urun_detay.aspx" class="buton2">İncele</a>
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
        <p class="float_dur"></p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:codingshop %>" SelectCommand="SELECT [urun_ad], [urun_resmi], [urun_fiyat] FROM [urunler]"></asp:SqlDataSource>
    </div>
</asp:Content>