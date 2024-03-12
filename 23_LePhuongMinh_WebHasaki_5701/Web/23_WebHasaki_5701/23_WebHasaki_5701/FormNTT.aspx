<%@ Page Title="" Language="C#" MasterPageFile="~/MasterHasaki.Master" AutoEventWireup="true" CodeBehind="FormNTT.aspx.cs" Inherits="_23_WebHasaki_5701.FormNTT" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style46 {
        font-size: large;
        font-weight: normal;
    }
    .auto-style47 {
        height: 31px;
    }
    .auto-style48 {
        font-size: medium;
        color: #FFFFFF;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
    <tr>
        <td class="auto-style8">
            <h3 class="auto-style8"><em>
                <asp:Label ID="Label12" runat="server" CssClass="auto-style46" Text="CHÀO MỪNG BẠN ĐẾN TRANG NƯỚC TẨY TRANG"></asp:Label>
                </em></h3>
            <asp:Label ID="lblSum" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style47">
            <asp:DataList ID="dlst_NTT" runat="server" DataKeyField="MaSP" DataSourceID="SqlDataSource_spNTT" RepeatColumns="3" RepeatDirection="Horizontal" Width="1262px" OnItemCommand="dlst_NTT_ItemCommand">
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
                    <asp:Button ID="btnMua" runat="server" BackColor="#99CC00" BorderColor="#99CC00" CommandName="Mua" CssClass="auto-style48" Height="35px" Text="Thêm giỏ hàng" Width="150px" />
<br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource_spNTT" runat="server" ConnectionString="<%$ ConnectionStrings:WebHasakiConnectionString %>" SelectCommand="SELECT * FROM [SanPham] WHERE ([MaLoai] = @MaLoai)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="NTT" Name="MaLoai" Type="String" />
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
