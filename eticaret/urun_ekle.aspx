<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="urun_ekle.aspx.cs" Inherits="eticaret.urun_ekle" MasterPageFile="~/admin_panel_masterpage.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

	<table class="auto-style1">
		<tr>
			<td class="auto-style2">Ürün Adı:</td>
			<td>
				<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style2">Ürün Açıklaması:</td>
			<td>
				<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style3">Ürün Kategori:</td>
			<td class="auto-style4">
				<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="kategori_adi" DataValueField="kategori_id">
				</asp:DropDownList>
				<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:codingshop %>" SelectCommand="SELECT * FROM [kategori]"></asp:SqlDataSource>
			</td>
		</tr>
		<tr>
			<td class="auto-style2">Ürün Resim:</td>
			<td>
				<asp:FileUpload ID="FileUpload1" runat="server" />
			</td>
		</tr>
		<tr>
			<td class="auto-style2">Ürün Fiyat</td>
			<td>
				<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td class="auto-style2">Ürün Stoğu:</td>
			<td>
				<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Ürün Ekle" />
			</td>
		</tr>
	</table>

</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
	<style type="text/css">
		.auto-style1 {
			width: 100%;
		}
		.auto-style2 {
			width: 326px;
		}
		.auto-style3 {
			width: 326px;
			height: 26px;
		}
		.auto-style4 {
			height: 26px;
		}
	</style>
</asp:Content>
