<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tum_urunler.aspx.cs" Inherits="eticaret.tum_urunler" MasterPageFile="~/admin_panel_masterpage.Master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="urun_id" DataSourceID="SqlDataSource1">
		<Columns>
			<asp:BoundField DataField="urun_id" HeaderText="urun_id" InsertVisible="False" ReadOnly="True" SortExpression="urun_id" />
			<asp:BoundField DataField="urun_ad" HeaderText="urun_ad" SortExpression="urun_ad" />
			<asp:BoundField DataField="urun_aciklama" HeaderText="urun_aciklama" SortExpression="urun_aciklama" />
			<asp:BoundField DataField="urun_fiyat" HeaderText="urun_fiyat" SortExpression="urun_fiyat" />
			<asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
		</Columns>
	</asp:GridView>
	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:codingshop %>" SelectCommand="SELECT * FROM [urunler]"></asp:SqlDataSource>
</asp:Content>