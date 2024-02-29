<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rol_yoneticisi.aspx.cs" Inherits="eticaret.rol_yoneticisi" MasterPageFile="~/admin_panel_masterpage.Master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="anadiv_sol">
        <br />
        <table class="auto-style1" align="center" id="tablo_ortala">
            <tr>
                <td colspan="2">ROL EKLE</td>
            </tr>
            <tr>
                <td class="auto-style2">Rol Adını Gir:</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button CssClass="kullanici_kontrol_buton" ID="Button1" runat="server" Text="Rol Ekle" OnClick="Button1_Click" />
                </td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <asp:GridView ID="GridView1" runat="server" OnRowDeleting="GridView1_RowDeleting" CssClass="datagrid_ortala">
            <Columns>
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
    </div>
    <div class="sol">
        
        <table class="auto-style3">
            <tr>
                <td class="auto-style4">Bir Kullanıcı Seçin:
                    <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td>Bir Rol Seçin: <asp:DropDownList ID="DropDownList2" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Seçilen Kullanıcının Rolleri<br />
                    <asp:GridView ID="GridView2" runat="server">
                    </asp:GridView>
                </td>
                <td>Seçilen Roldeki Kullanıcılar<br />
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView3_SelectedIndexChanged1">
                        <Columns>
                            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                            <asp:BoundField DataField="RoleName" HeaderText="RoleName" SortExpression="RoleName" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:codingshop %>" SelectCommand="SELECT aspnet_Users.UserName, aspnet_Roles.RoleName FROM aspnet_Users INNER JOIN aspnet_UsersInRoles ON aspnet_Users.UserId = aspnet_UsersInRoles.UserId INNER JOIN aspnet_Roles ON aspnet_UsersInRoles.RoleId = aspnet_Roles.RoleId"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Kullanıcı Adı Girin:</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" />
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
        </table>
        
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            width: 43%;
        }
        .auto-style2 {
            width: 138px;
        }
        .auto-style3 {
            width: 100%;
        }
        .auto-style4 {
            width: 255px;
        }
    </style>
</asp:Content>
