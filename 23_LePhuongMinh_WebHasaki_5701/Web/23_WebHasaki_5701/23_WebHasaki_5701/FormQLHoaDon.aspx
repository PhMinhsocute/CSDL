<%@ Page Title="" Language="C#" MasterPageFile="~/QuanLy.Master" AutoEventWireup="true" CodeBehind="FormQLHoaDon.aspx.cs" Inherits="_23_WebHasaki_5701.FormQLHoaDon" %>
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
            <td class="auto-style6">
                <h3><em>
                    <asp:Label ID="Label7" runat="server" CssClass="auto-style13" Text="CHÀO MỪNG BẠN ĐẾN VỚI TRANG QUẢN LÝ HÓA ĐƠN CỦA HASAKI"></asp:Label>
                    </em></h3>
            </td>
        </tr>
        <tr>
            <td><strong>
                <asp:Label ID="Label8" runat="server" CssClass="auto-style14" Text="[1] THÔNG TIN HÓA ĐƠN"></asp:Label>
                </strong></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Text="Nhập thông tin hóa đơn: "></asp:Label>
                <asp:TextBox ID="txtTimHD" runat="server"></asp:TextBox>
                <asp:Button ID="btnTimHD" runat="server" OnClick="btnTimHD_Click" Text="Tìm HD" />
                <asp:Button ID="btnHuy" runat="server" OnClick="btnHuy_Click" Text="Hủy" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="dgvHD" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MaHD" DataSourceID="SqlDataSource_qlHD" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="MaHD" HeaderText="Mã hóa đơn" ReadOnly="True" SortExpression="MaHD" />
                        <asp:BoundField DataField="MaNV" HeaderText="Mã nhân viên" SortExpression="MaNV" />
                        <asp:BoundField DataField="MaKH" HeaderText="Mã khách hàng" SortExpression="MaKH" />
                        <asp:BoundField DataField="NgayBan" HeaderText="Ngày bán" SortExpression="NgayBan" />
                        <asp:BoundField DataField="GhiChu" HeaderText="Ghi chú" SortExpression="GhiChu" />
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
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
                <asp:SqlDataSource ID="SqlDataSource_qlHD" runat="server" ConnectionString="<%$ ConnectionStrings:WebHasakiConnectionString %>" DeleteCommand="DELETE FROM HoaDon WHERE (MaHD = @MaHD)" InsertCommand="INSERT INTO HoaDon(MaHD, MaNV, MaKH, NgayBan, GhiChu) VALUES (@MaHD, @MaNV, @MaKH, @NgayBan, @GhiChu)" SelectCommand="SELECT MaHD, MaNV, MaKH, NgayBan, GhiChu FROM HoaDon WHERE (([MaHD] LIKE  '%' + @MaHD + '%') OR ([MaNV] LIKE  '%' + @MaNV +  '%') OR ([MaKH] LIKE  '%' + @MaKH + '%') OR ([GhiChu] LIKE  '%'+ @GhiChu +  '%'))" UpdateCommand="UPDATE HoaDon SET  MaNV = @MaNV, MaKH = @MaKH, NgayBan = @NgayBan, GhiChu = @GhiChu WHERE (MaHD = @MaHD)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="dgvHD" Name="MaHD" PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtMaHD" Name="MaHD" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtMaNV" Name="MaNV" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtMaKH" Name="MaKH" PropertyName="Text" />
                        <asp:ControlParameter ControlID="Calendar1" DbType="DateTime" Name="NgayBan" PropertyName="SelectedDate" />
                        <asp:ControlParameter ControlID="txtGhiChu" Name="GhiChu" PropertyName="Text" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtTimHD" Name="MaHD" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtTimHD" Name="MaNV" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtTimHD" Name="MaKH" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtTimHD" Name="GhiChu" PropertyName="Text" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="dgvHD" Name="MaNV" PropertyName="SelectedValue[1]" />
                        <asp:ControlParameter ControlID="dgvHD" Name="MaKH" PropertyName="SelectedValue[2]" />
                        <asp:ControlParameter ControlID="Calendar1" DbType="DateTime" Name="NgayBan" PropertyName="SelectedDate" />
                        <asp:ControlParameter ControlID="dgvHD" Name="GhiChu" PropertyName="SelectedValue[4]" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td><strong>
                <asp:Label ID="lblTTHDnew" runat="server" CssClass="auto-style14" Text="[2] NHẬP THÔNG TIN HÓA ĐƠN MỚI" Visible="False"></asp:Label>
                </strong></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblMaHD" runat="server" Text="Mã hóa đơn:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtMaHD" runat="server" Visible="False"></asp:TextBox>
                <asp:Label ID="lblMaNV" runat="server" Text="Mã nhân viên:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtMaNV" runat="server" Visible="False"></asp:TextBox>
                <asp:Label ID="lblMaKH" runat="server" Text="Mã khách hàng:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtMaKH" runat="server" Visible="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblGhiChu" runat="server" Text="Ghi chú:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtGhiChu" runat="server" Visible="False"></asp:TextBox>
                <asp:Label ID="lblNgayBan" runat="server" Text="Ngày bán:" Visible="False"></asp:Label>
                <asp:Calendar ID="Calendar1" runat="server" Visible="False"></asp:Calendar>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="dgvCTHD" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" Caption="BẢNG CHI TIẾT HÓA ĐƠN" CellPadding="4" DataKeyNames="MaHD,MaSP" DataSourceID="SqlDataSource_CTHD" GridLines="Horizontal">
                    <Columns>
                        <asp:BoundField DataField="MaHD" HeaderText="Mã hóa đơn" ReadOnly="True" SortExpression="MaHD" />
                        <asp:BoundField DataField="MaSP" HeaderText="Mã sản phẩm" ReadOnly="True" SortExpression="MaSP" />
                        <asp:BoundField DataField="SL" HeaderText="Số lượng" SortExpression="SL" />
                        <asp:BoundField DataField="DonGia" DataFormatString="{0:0,000}" HeaderText="Đơn giá" SortExpression="DonGia" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#487575" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#275353" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource_CTHD" runat="server" ConnectionString="<%$ ConnectionStrings:WebHasakiConnectionString %>" SelectCommand="SELECT * FROM CTHoaDon WHERE (MaHD = @MaHD)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="dgvHD" Name="MaHD" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
