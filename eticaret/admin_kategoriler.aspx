<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_kategoriler.aspx.cs" Inherits="eticaret.admin_kategoriler" MasterPageFile="~/admin_panel_masterpage.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
	<table class="auto-style1">
		<tr>
			<td class="auto-style2">Kategori Adı:</td>
			<td>
				<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Kategori Ekle" />
			</td>
		</tr>
		<tr>
			<td class="auto-style2">&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td colspan="2">
				<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="kategori_id" DataSourceID="SqlDataSource1" OnRowDeleting="GridView1_RowDeleting">
					<Columns>
						<asp:BoundField DataField="kategori_id" HeaderText="kategori_id" InsertVisible="False" ReadOnly="True" SortExpression="kategori_id" />
						<asp:BoundField DataField="kategori_adi" HeaderText="kategori_adi" SortExpression="kategori_adi" />
					</Columns>
				</asp:GridView>
				<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:codingshop %>" SelectCommand="SELECT * FROM [kategori]"></asp:SqlDataSource>
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
			width: 278px;
		}
	</style>
</asp:Content>
