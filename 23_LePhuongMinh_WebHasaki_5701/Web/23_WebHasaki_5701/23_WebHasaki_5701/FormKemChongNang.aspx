<%@ Page Title="" Language="C#" MasterPageFile="~/MasterHasaki.Master" AutoEventWireup="true" CodeBehind="FormKemChongNang.aspx.cs" Inherits="_23_WebHasaki_5701.FormKemChongNang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style46 {
            font-weight: normal;
        }
        .auto-style47 {
            color: #FFFFFF;
            font-size: medium;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style8">
                <h3 class="auto-style8"><em>
                    <asp:Label ID="Label12" runat="server" CssClass="auto-style46" Text="CHÀO MỪNG BẠN ĐẾN TRANG KEM CHỐNG NẮNG"></asp:Label>
                    </em></h3>
                <asp:Label ID="lblSum" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="dlst_KCN" runat="server" DataKeyField="MaSP" DataSourceID="SqlDataSource_spKCN" RepeatColumns="3" RepeatDirection="Horizontal" Width="1264px" OnItemCommand="dlst_KCN_ItemCommand">
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
&nbsp;<br />Số lượng:<asp:TextBox ID="txtSL" runat="server" Height="25px" Width="50px">0</asp:TextBox>
                        <br />
                        <br />
                        <asp:Button ID="btnMua" runat="server" BackColor="#99CC00" BorderColor="#99CC00" CommandName="Mua" CssClass="auto-style47" Height="35px" Text="Thêm giỏ hàng" Width="150px" />
<br />
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource_spKCN" runat="server" ConnectionString="<%$ ConnectionStrings:WebHasakiConnectionString %>" SelectCommand="SELECT * FROM [SanPham] WHERE ([MaLoai] = @MaLoai)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="KCN" Name="MaLoai" Type="String" />
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
