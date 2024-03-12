<%@ Page Title="" Language="C#" MasterPageFile="~/MasterHasaki.Master" AutoEventWireup="true" CodeBehind="FormToner.aspx.cs" Inherits="_23_WebHasaki_5701.FormToner" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style46 {
            font-weight: normal;
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
            <td>
                <h3 class="auto-style8"><em>
                    <asp:Label ID="Label12" runat="server" CssClass="auto-style46" Text="CHÀO MỪNG BẠN ĐẾN TRANG TONER/DƯỠNG ẨM"></asp:Label>
                    </em></h3>
                <p class="auto-style8">
                    <asp:Label ID="lblSum" runat="server"></asp:Label>
                </p>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="dlst_NCC" runat="server" DataKeyField="MaSP" DataSourceID="SqlDataSource_spToner" RepeatColumns="3" RepeatDirection="Horizontal" Width="1259px" OnItemCommand="dlst_NCC_ItemCommand">
                    <ItemTemplate>
                        <asp:Image ID="Image" runat="server" Height="250px" ImageUrl='<%# Eval("HinhAnh") %>' Width="250px" />
                        <br />
                        Mã sản phẩm:
                        <asp:Label ID="MaSPLabel" runat="server" Text='<%# Eval("MaSP") %>' />
                        <br />
                        Tên sản phẩm:
                        <asp:Label ID="TenSPLabel" runat="server" Text='<%# Eval("TenSP") %>' />
                        <br />
                        Đơn vị tính
                        <asp:Label ID="DVTLabel" runat="server" Text='<%# Eval("DVT") %>' />
                        <br />
                        Giá:
                        <asp:Label ID="GiaBanLabel" runat="server" Text='<%# Eval("GiaBan", "{0:N}") %>' />
                        <br />
                        Số lượng:<asp:TextBox ID="txtSL" runat="server" Height="25px" Width="50px">0</asp:TextBox>
                        <br />
                        <br />
                        <asp:Button ID="btnMua" runat="server" BackColor="#669900" BorderColor="#669900" CssClass="auto-style47" Height="35px" Text="Thêm giỏ hàng" Width="150px" CommandName="Mua" />
<br />
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource_spToner" runat="server" ConnectionString="<%$ ConnectionStrings:WebHasakiConnectionString %>" SelectCommand="SELECT * FROM [SanPham] WHERE ([MaLoai] = @MaLoai)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="NCC" Name="MaLoai" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
