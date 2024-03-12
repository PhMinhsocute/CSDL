<%@ Page Title="" Language="C#" MasterPageFile="~/QuanLy.Master" AutoEventWireup="true" CodeBehind="FormQLDonDatHang.aspx.cs" Inherits="_23_WebHasaki_5701.FormQLDonDatHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style13 {
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
            <td class="auto-style6"><em>
                <asp:Label ID="Label7" runat="server" CssClass="auto-style13" Text="CHÀO MỪNG BẠN ĐẾN VỚI TRANG QUẢN LÝ ĐƠN ĐẶT HÀNG"></asp:Label>
                </em></td>
        </tr>
        <tr>
            <td><strong>
                <asp:Label ID="Label8" runat="server" CssClass="auto-style14" Text="[1] THÔNG TIN ĐƠN HÀNG"></asp:Label>
                </strong></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Text="Nhập thông tin đơn hàng:"></asp:Label>
                <asp:TextBox ID="txtTimDDH" runat="server"></asp:TextBox>
                <asp:Button ID="btnTim" runat="server" Text="Tìm DDH" />
                <asp:Button ID="btnHuy" runat="server" OnClick="btnHuy_Click" Text="Hủy" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="dgvDDH" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MaDH" DataSourceID="SqlDataSource_DDH" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="MaDH" HeaderText="Mã đơn hàng" ReadOnly="True" SortExpression="MaDH" />
                        <asp:BoundField DataField="NgayLap" HeaderText="Ngày lập" SortExpression="NgayLap" />
                        <asp:BoundField DataField="DiaChiGiao" HeaderText="Địa chỉ giao" SortExpression="DiaChiGiao" />
                        <asp:BoundField DataField="NguoiNhan" HeaderText="Người nhận" SortExpression="NguoiNhan" />
                        <asp:BoundField DataField="SDTNhan" HeaderText="SĐT Nhận" SortExpression="SDTNhan" />
                        <asp:BoundField DataField="ThoiHan" HeaderText="Thời hạn" SortExpression="ThoiHan" />
                        <asp:CheckBoxField DataField="TinhTrang" HeaderText="Tình trạng" SortExpression="TinhTrang" />
                        <asp:BoundField DataField="MaKH" HeaderText="Mã khách hàng" SortExpression="MaKH" />
                        <asp:BoundField DataField="MaNV" HeaderText="Mã nhân viên" SortExpression="MaNV" />
                        <asp:BoundField DataField="PTTT" HeaderText="PTTT" SortExpression="PTTT" />
                        <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" />
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
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
                <asp:SqlDataSource ID="SqlDataSource_DDH" runat="server" ConnectionString="<%$ ConnectionStrings:WebHasakiConnectionString %>" DeleteCommand="DELETE FROM DonDatHang WHERE (MaDH = @MaDH)" SelectCommand="SELECT MaDH, NgayLap, DiaChiGiao, NguoiNhan, SDTNhan, ThoiHan, TinhTrang, MaKH, MaNV, PTTT FROM DonDatHang WHERE (MaDH = @MaDH) OR (DiaChiGiao = @DiaChiGiao) OR (NguoiNhan = @NguoiNhan) OR (SDTNhan = @SDTNhan) OR (MaKH = @MaKH) OR (MaNV = @MaNV)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="dgvDDH" Name="MaDH" PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtTimDDH" Name="MaDH" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtTimDDH" Name="DiaChiGiao" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtTimDDH" Name="NguoiNhan" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtTimDDH" Name="SDTNhan" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtTimDDH" Name="MaKH" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtTimDDH" Name="MaNV" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="dgvCTDH" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="MaDH" DataSourceID="SqlDataSource_CTDH" GridLines="Horizontal">
                    <Columns>
                        <asp:BoundField DataField="MaDH" HeaderText="Mã đơn hàng" ReadOnly="True" SortExpression="MaDH" />
                        <asp:BoundField DataField="MaSP" HeaderText="Mã sản phẩm" SortExpression="MaSP" />
                        <asp:BoundField DataField="SLgDat" HeaderText="Số lượng đặt" SortExpression="SLgDat" />
                        <asp:BoundField DataField="Gia" HeaderText="Giá" SortExpression="Gia" />
                        <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" />
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
                <asp:SqlDataSource ID="SqlDataSource_CTDH" runat="server" ConnectionString="<%$ ConnectionStrings:WebHasakiConnectionString %>" SelectCommand="SELECT * FROM CTDonDatHang WHERE (MaDH = @MaDH)" DeleteCommand="DELETE FROM CTDonDatHang WHERE (MaDH = @MaDH)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="dgvCTDH" Name="MaDH" PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="dgvDDH" Name="MaDH" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
