<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sepet.aspx.cs" Inherits="eticaret.sepet" MasterPageFile="~/menuler.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <link href="sepet.css" type="text/css" rel="stylesheet" />
    <br />
<div class="anasoldiv">
    <div class="anasoldiv_uruncerceve">
        <div class="urun_cerceve_img">
            <asp:Image ID="Image1" CssClass="img_sinir" runat="server" ImageUrl="~/resim/DSC_6073.png" />
        </div>
        <div class="urun_cerceve_aciklama">
          <div class="aciklama_text">
              ÜRÜN ADI
          </div>
        </div>
    </div>
</div>
    <div class="anasoldevamdiv">
        </div>
    <p class="float_dur"></p>
</asp:Content>
