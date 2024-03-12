<%@ Page Title="" Language="C#" MasterPageFile="~/MasterHasaki.Master" AutoEventWireup="true" CodeBehind="FormKemDuongAm.aspx.cs" Inherits="_23_WebHasaki_5701.FormKemDuongAm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style46 {
            font-size: medium;
            color: #FFFFFF;
        }
        .auto-style47 {
            height: 989px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style8">
                <h3><em><strong>
                    <asp:Label ID="Label12" runat="server" Text="CHÀO MỪNG BẠN ĐẾN TRANG KEM DƯỠNG ẨM"></asp:Label>
                    </strong></em></h3>
                <p>
                    <asp:Label ID="lblSum" runat="server"></asp:Label>
                </p>
            </td>
        </tr>
        <tr>
            <td class="auto-style47">
                <asp:DataList ID="dlst_KDA" runat="server" DataKeyField="MaSP" DataSourceID="SqlDataSource_spKDA" RepeatColumns="3" RepeatDirection="Horizontal" Width="1259px" OnItemCommand="dlst_KDA_ItemCommand">
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
                        <asp:Label ID="GiaBanLabel" runat="server" Text='<%# Eval("GiaBan") %>' />
                        <br />
                        Số lượng:
                        <asp:TextBox ID="txtSL" runat="server" Height="25px" Width="50px">0</asp:TextBox>
                        <br />
                        <br />
                        <asp:Button ID="btnMua" runat="server" BackColor="#99CC00" BorderColor="#99CC00" CssClass="auto-style46" Height="35px" Text="Thêm giỏ hàng" Width="155px" CommandName="Mua" />
<br />
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource_spKDA" runat="server" ConnectionString="<%$ ConnectionStrings:WebHasakiConnectionString %>" SelectCommand="SELECT * FROM [SanPham] WHERE ([MaLoai] = @MaLoai)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="KDA" Name="MaLoai" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        </table>
</asp:Content>
