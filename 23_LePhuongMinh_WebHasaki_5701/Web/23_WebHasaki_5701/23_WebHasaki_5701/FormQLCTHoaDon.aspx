<%@ Page Title="" Language="C#" MasterPageFile="~/QuanLy.Master" AutoEventWireup="true" CodeBehind="FormQLCTHoaDon.aspx.cs" Inherits="_23_WebHasaki_5701.FormQLCTHoaDon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style13 {
            font-weight: normal;
            color: #FF0066;
        }
        .auto-style14 {
            color: #006600;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td>
                <h3 class="auto-style6"><em>
                    <asp:Label ID="Label7" runat="server" CssClass="auto-style13" Text="CHÀO MỪNG BẠN ĐẾN VỚI TRANG QUẢN LÝ CHI TIẾT HÓA ĐƠN"></asp:Label>
                    </em></h3>
            </td>
        </tr>
        <tr>
            <td><strong>
                <asp:Label ID="Label8" runat="server" CssClass="auto-style14" Text="[1]THÔNG TIN CHI TIẾT HÓA ĐƠN"></asp:Label>
                </strong></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Text="Nhập thông tin CTHĐ:"></asp:Label>
                <asp:TextBox ID="txtTimCTHD" runat="server"></asp:TextBox>
                <asp:Button ID="btnTimCTHD" runat="server" OnClick="btnTimCTHD_Click" Text="Tìm CTHD" />
                <asp:Button ID="btnHuy" runat="server" Text="Hủy" OnClick="btnHuy_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="dgvCTHD" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MaHD,MaSP" DataSourceID="SqlDataSource_qlCTHD" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="MaHD" HeaderText="Mã hóa đơn" ReadOnly="True" SortExpression="MaHD" />
                        <asp:BoundField DataField="MaSP" HeaderText="Mã sản phẩm" ReadOnly="True" SortExpression="MaSP" />
                        <asp:BoundField DataField="SL" HeaderText="Số lượng" SortExpression="SL" />
                        <asp:BoundField DataField="DonGia" DataFormatString="{0:0,000}" HeaderText="Đơn giá" SortExpression="DonGia" />
                        <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" UpdateText="Cập nhật" />
                        <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource_qlCTHD" runat="server" ConnectionString="<%$ ConnectionStrings:WebHasakiConnectionString %>" DeleteCommand="DELETE FROM CTHoaDon WHERE (MaHD = @MaHD) AND (MaSP = @MaSP)" InsertCommand="INSERT INTO CTHoaDon(MaHD, MaSP, SL, DonGia) VALUES (@MaHD, @MaSP, @SL, @DonGia)" SelectCommand="SELECT MaHD, MaSP, SL, DonGia FROM CTHoaDon WHERE (([MaHD] LIKE  '%' + @MaHD +  '%') OR ([MaSP] LIKE  '%'+ @MaSP +  '%'))" UpdateCommand="UPDATE CTHoaDon SET  SL = @SL, DonGia = @DonGia WHERE (MaHD = @MaHD) AND (MaSP = @MaSP)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="dgvCTHD" Name="MaHD" PropertyName="SelectedValue[0]" />
                        <asp:ControlParameter ControlID="dgvCTHD" Name="MaSP" PropertyName="SelectedValue[1]" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtMaHD" Name="MaHD" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtMaSP" Name="MaSP" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtSL" Name="SL" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtDG" Name="DonGia" PropertyName="Text" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtTimCTHD" Name="MaHD" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtTimCTHD" Name="MaSP" PropertyName="Text" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="dgvCTHD" Name="SL" PropertyName="SelectedValue[2]" />
                        <asp:ControlParameter ControlID="dgvCTHD" Name="DonGia" PropertyName="SelectedValue[3]" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td><strong>
                <asp:Label ID="lblTTCTHDnew" runat="server" CssClass="auto-style14" Text="[2]THÔNG TIN CHI TIẾT HÓA ĐƠN MỚI" Visible="False"></asp:Label>
                </strong></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblMaHD" runat="server" Text="Mã hóa đơn:" Visible="False"></asp:Label>
                <br />
                <asp:TextBox ID="txtMaHD" runat="server" Visible="False"></asp:TextBox>
                <br />
                <asp:Label ID="lblMaSP" runat="server" Text="Mã sản phẩm:" Visible="False"></asp:Label>
                <br />
                <asp:TextBox ID="txtMaSP" runat="server" Visible="False"></asp:TextBox>
                <br />
                <asp:Label ID="lblSL" runat="server" Text="Số lượng:" Visible="False"></asp:Label>
                <br />
                <asp:TextBox ID="txtSL" runat="server" Visible="False"></asp:TextBox>
                <br />
                <asp:Label ID="lblDG" runat="server" Text="Đơn giá:" Visible="False"></asp:Label>
                <br />
                <asp:TextBox ID="txtDG" runat="server" Visible="False"></asp:TextBox>
            </td>
        </tr>
    </table>
</asp:Content>
