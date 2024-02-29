<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kategori.aspx.cs" Inherits="eticaret.kategori" MasterPageFile="~/menuler.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="stil.css" type="text/css" rel="stylesheet" />
	<div class="tum_urunler_anasayfa">
		
		<asp:ListView ID="ListView1" runat="server" >
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
						<a href="urun_detay.aspx?urunID=<%# Eval("urun_id") %>" class="buton2">İncele</a>
					</div>
				</div>						
		</ItemTemplate>
	</asp:ListView>
		<p class="float_dur"></p>
	</div>
</asp:Content>