<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="urun_detay.aspx.cs" Inherits="eticaret.urun_detay" MasterPageFile="~/menuler.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<asp:ListView ID="ListView1" runat="server" OnSelectedIndexChanged="ListView1_SelectedIndexChanged1">
		<ItemTemplate>
	<br />
	<link href="urun_detay.css" type="text/css" rel="stylesheet" />
				<div class="anadiv">		
                <div class="urun_kutu">
                    <img class="detay_resim" src="urun-resim/<%# Eval("urun_resmi") %>" />
                </div>
				<div class="urun_ad">
					<%# Eval("urun_ad") %>
				</div>
				<div class="detay_urun_aciklama">
					<h4><%# Eval("urun_aciklama") %></h4>
				</div>
				<div class="stok_css">
                    <asp:DropDownList ID="DropDownList1" runat="server" CausesValidation="False">
                        <asp:ListItem>Stok</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
				</div>
				<div class="urun_fiyat_detay">
				<h4><%# Eval("urun_fiyat") %> ₺</h4>
				</div>
                <div class="sepete_ekle_butonu" >
					<asp:Button ID="Button1" runat="server" Text="EKLE" CssClass="sepete_ekle_butonu_a" OnClick="Button1_Click1" />
					
                </div>
				<p class="float_dur"></p>
				
			
		<div class="urun_yorumlar">
					ÜRÜN TÜM DETAYLARI VE ALIŞVERİŞLE İLGİLİ BAZI BİLGİLER

		</div>
	</div>
			</ItemTemplate>
		</asp:ListView>
    <br />
</asp:Content>