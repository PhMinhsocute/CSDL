<%@ Page Title="" Language="C#" MasterPageFile="~/MasterHasaki.Master" AutoEventWireup="true" CodeBehind="FormTrangChu.aspx.cs" Inherits="_23_WebHasaki_5701.FormTrangChu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style46 {
            color: #000000;
        }
        .auto-style47 {
            font-size: medium;
            color: #FFFFFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td colspan="2">
                <asp:Image ID="Image6" runat="server" BorderColor="Black" Height="350px" ImageUrl="~/HinhAnh/newitem.png" Width="1232px" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="font-family: 'Cascadia Code ExtraLight'">
                <strong>
                <asp:Label ID="lblSum" runat="server"></asp:Label>
                </strong>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="font-family: 'Cascadia Code ExtraLight'">
                <h1 class="auto-style8"><strong style="font-family: 'TIMEs New Roman', Times, serif">
                    <asp:Label ID="Label12" runat="server" CssClass="auto-style46" Text="NEW ITEM"></asp:Label>
                    </strong></h1>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:DataList ID="dlst_newsp" runat="server" DataKeyField="MaSP" DataSourceID="SqlDataSource_newsp" RepeatColumns="3" RepeatDirection="Horizontal" Width="1266px" OnItemCommand="dlst_newsp_ItemCommand">
                    <ItemTemplate>
                        <asp:Image ID="Image" runat="server" Height="250px" ImageUrl='<%# Eval("HinhAnh") %>' Width="250px" />
                        <br />
                        Mã sản phẩm:
                        <asp:Label ID="MaSPLabel" runat="server" Text='<%# Eval("MaSP") %>' />
                        <br />
                        Tên sản phẩm:
                        <asp:Label ID="TenSPLabel" runat="server" Text='<%# Eval("TenSP") %>' />
                        <br />
                        Đơn vị tính:
                        <asp:Label ID="DVTLabel" runat="server" Text='<%# Eval("DVT") %>' />
                        <br />
                        Giá:
                        <asp:Label ID="GiaBanLabel" runat="server" Text='<%# Eval("GiaBan", "{0:N}") %>' />
                        <br />
                        Số lượng:<asp:TextBox ID="txtSL" runat="server" Height="25px" Width="50px">0</asp:TextBox>
                        <br />
                        <br />
                        <asp:Button ID="Button1" runat="server" BackColor="#99CC00" BorderColor="#99CC00" CommandName="Mua" CssClass="auto-style47" Height="35px" Text="Thêm giỏ hàng" Width="150px" />
<br />
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource_newsp" runat="server" ConnectionString="<%$ ConnectionStrings:WebHasakiConnectionString %>" SelectCommand="SELECT * FROM [top3_newsp]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <h1 class="auto-style8">
                    <asp:Label ID="Label13" runat="server" Text="SẢN PHẨM BÁN CHẠY "></asp:Label>
                </h1>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="dlst_banchay" runat="server" BorderColor="Black" DataKeyField="MaSP" DataSourceID="SqlDataSource_top3" RepeatColumns="3" RepeatDirection="Horizontal" Width="1259px" OnItemCommand="dlst_banchay_ItemCommand">
                    <ItemTemplate>
                        <asp:Image ID="Image" runat="server" Height="250px" ImageUrl='<%# Eval("HinhAnh") %>' Width="250px" />
                        <br />
                        Mã sản phẩm:
                        <asp:Label ID="MaSPLabel" runat="server" Text='<%# Eval("MaSP") %>' />
                        <br />
                        Tên sản phẩm:
                        <asp:Label ID="TenSPLabel" runat="server" Text='<%# Eval("TenSP") %>' />
                        <br />
                        GiaBan:
                        <asp:Label ID="GiaBanLabel" runat="server" Text='<%# Eval("GiaBan", "{0:N}") %>' />
                        <br />
                        Đơn vị tính:
                        <asp:Label ID="DVTLabel" runat="server" Text='<%# Eval("DVT") %>' />
<br />
                        Số lượng:<asp:TextBox ID="txtSL" runat="server" Height="25px" Width="50px">0</asp:TextBox>
                        <br />
                        <br />
                        <asp:Button ID="btnMua" runat="server" BackColor="#99CC00" BorderColor="#99CC00" CommandName="Mua" CssClass="auto-style47" Height="35px" Text="Thêm giỏ hàng" Width="150px" />
                        <br />
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource_top3" runat="server" ConnectionString="<%$ ConnectionStrings:WebHasakiConnectionString %>" SelectCommand="SELECT * FROM [top3_spbanchay]"></asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
