<%@ Page Title="" Language="C#" MasterPageFile="~/MasterHasaki.Master" AutoEventWireup="true" CodeBehind="FormLienHe.aspx.cs" Inherits="_23_WebHasaki_5701.FormLienHe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style28 {
            font-size: medium;
            text-align: center;
        }
        .auto-style29 {
            font-size: small;
            text-align: center;
        }
        .auto-style30 {
            font-size: medium;
            text-align: center;
            color: #006600;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style8" colspan="2" style="font-family: 'Cascadia Mono'"><strong>
                <asp:Label ID="Label9" runat="server" Text="Chúng tôi trân trọng ý kiến của quý khách "></asp:Label>
                 <hr  width="45%" size="2.5px" align="center"  color="black"/>
                </strong></td>
        
        </tr>
        <tr>
            <td colspan="2">
                <p class="auto-style28">
                    Quý khách vui lòng gửi ý kiến đóng góp hoặc gửi đóng góp qua biểu mẫu sau</p>
            </td>
        </tr>
        <tr>
            <td class="auto-style8" colspan="2">
                <asp:TextBox ID="TextBox1" runat="server" Height="200px" Width="500px"></asp:TextBox>
                <br />
                <asp:Button ID="btnGui" runat="server" Text="Gửi yêu cầu" />
            </td>
        </tr>
        <tr>
            <td>
                <p class="auto-style30">
                    <strong>HỖ TRỢ KHÁCH HÀNG</strong></p>
                <p class="auto-style29">
                    Hotline: 1800 6324 (miễn phí)</p>
                <p class="auto-style29">
                    Mỹ phẩm: 08:00 - 22:00</p>
                <p class="auto-style29">
                    Clinic &amp; Spa:09:00 - 20:00</p>
            </td>
            <td class="auto-style8">
                <asp:Image ID="Image6" runat="server" ImageUrl="~/HinhAnh/qr.png" />
                <br />
                <strong>
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="auto-style11">CH Play</asp:LinkButton>
                </strong>
                <br />
                <strong>
                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="auto-style11">App Store</asp:LinkButton>
                </strong></td>
        </tr>
    </table>
</asp:Content>
