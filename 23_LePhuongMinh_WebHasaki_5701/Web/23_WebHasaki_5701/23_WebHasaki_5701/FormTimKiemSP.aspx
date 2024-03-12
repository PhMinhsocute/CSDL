<%@ Page Title="" Language="C#" MasterPageFile="~/MasterHasaki.Master" AutoEventWireup="true" CodeBehind="FormTimKiemSP.aspx.cs" Inherits="_23_WebHasaki_5701.FormTimKiemSP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style46 {
            font-weight: bold;
            color: #FFFFFF;
            background-color: #006600;
        }
        .auto-style47 {
            font-weight: bold;
            color: #FFFFFF;
            background-color: #00CC00;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style8">
                <h2><strong><em>
                    <asp:Label ID="Label12" runat="server" Text="DANH MỤC SẢN PHẨM BẠN CẦN TÌM"></asp:Label>
                    </em></strong></h2>
            </td>
        </tr>
        <tr>
            <td class="auto-style8">
                <asp:TextBox ID="txtTim" runat="server" Width="230px"></asp:TextBox>
                <strong>
                <asp:Button ID="btnTim" runat="server" CssClass="auto-style46" Text="Tìm" />
                <asp:Button ID="btnHuy" runat="server" CssClass="auto-style46" OnClick="btnHuy_Click" Text="Hủy" />
                </strong></td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="dlstTim" runat="server" DataKeyField="MaSP" DataSourceID="SqlDataSource_Timsp" OnItemCommand="dlstTim_ItemCommand" RepeatColumns="3" RepeatDirection="Horizontal" Width="1195px">
                    <ItemTemplate>
                        <asp:Image ID="Image" runat="server" Height="150px" ImageUrl='<%# Eval("HinhAnh") %>' Width="150px" />
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
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>
                        <asp:Button ID="btnMua" runat="server" CommandName="Mua" CssClass="auto-style47" Height="33px" Text="Thêm vào giỏ hàng" Width="150px" />
                        </strong>
<br />
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource_Timsp" runat="server" ConnectionString="<%$ ConnectionStrings:WebHasakiConnectionString %>" SelectCommand="SELECT MaSP, MaLoai, TenSP, DVT, GiaBan,HinhAnh FROM SanPham WHERE ((MaSP LIKE '%' + @MaSP2 + '%') OR (MaLoai LIKE '%' + @MaLoai +'%' ) OR (TenSP LIKE '%' + @TenSP + '%' ) OR (DVT LIKE '%' + @DVT + '%' ) OR (GiaBan LIKE '%'  + @GiaBan + '%' ))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtTim" Name="MaSP2" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtTim" Name="MaLoai" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtTim" Name="TenSP" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtTim" Name="DVT" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtTim" Name="GiaBan" PropertyName="Text" />
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
