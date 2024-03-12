<%@ Page Title="" Language="C#" MasterPageFile="~/MasterHasaki.Master" AutoEventWireup="true" CodeBehind="FormDonHang.aspx.cs" Inherits="_23_WebHasaki_5701.FormDonHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style46 {
            height: 31px;
        }
        .auto-style47 {
            font-weight: normal;
        }
        .auto-style48 {
            color: #006600;
        }
        .auto-style49 {
            height: 213px;
        }
        .auto-style50 {
            text-decoration: underline;
        }
        .auto-style51 {
            font-size: medium;
            color: #FFFFFF;
            font-weight: bold;
            background-color: #006600;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style46">
                <h3 class="auto-style8"><em>
                    <asp:Label ID="Label12" runat="server" CssClass="auto-style47" Text="CHÀO MỪNG BẠN ĐẾN TRANG ĐƠN ĐẶT HÀNG. CẢM ƠN BẠN VÌ ĐÃ ỦNG HỘ CHÚNG TÔI!!!!"></asp:Label>
                    </em></h3>
            </td>
        </tr>
        <tr>
            <td><strong>
                <asp:Label ID="Label13" runat="server" CssClass="auto-style48" Text="[1] THÔNG TIN KHÁCH HÀNG"></asp:Label>
                </strong></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label14" runat="server" CssClass="auto-style50" Text="Nhập thông tin khách hàng:"></asp:Label>
                <asp:TextBox ID="txtTimKH" runat="server" Height="25px" Width="300px"></asp:TextBox>
                <asp:Button ID="btnTim" runat="server" OnClick="btnTim_Click" Text="Tìm KH" />
                <asp:Button ID="btnHuyKH" runat="server" OnClick="btnHuyKH_Click" Text="Hủy Tìm" Visible="False" />
            </td>
        </tr>
        <tr>
            <td class="auto-style49">
                <div>
                    <asp:GridView ID="dgvKH" runat="server" AutoGenerateColumns="False" Caption="CHỌN KHÁCH HÀNG ĐÃ CÓ DỮ LIỆU" CellPadding="4" DataKeyNames="MaKH" DataSourceID="SqlDataSource_TTKhachHang" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="dgvKH_SelectedIndexChanged" Width="812px">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                            <asp:BoundField DataField="MaKH" HeaderText="Mã khách hàng" ReadOnly="True" SortExpression="MaKH" />
                            <asp:BoundField DataField="TenKH" HeaderText="Tên khách hàng" SortExpression="TenKH" />
                            <asp:BoundField DataField="SDT" HeaderText="Số điện thoại" SortExpression="SDT" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
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
                </div>
                <asp:SqlDataSource ID="SqlDataSource_TTKhachHang" runat="server" ConnectionString="<%$ ConnectionStrings:WebHasakiConnectionString %>" InsertCommand="INSERT INTO KhachHang(MaKH, TenKH, SDT, Email) VALUES (@MaKH, @TenKH, @SDT, @Email)" SelectCommand="SELECT MaKH, TenKH, SDT, Email FROM KhachHang WHERE (MaKH = @MaKH) OR (TenKH = @TenKH) OR (SDT = @SDT) OR (Email = @Email)">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtMakH" Name="MaKH" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtTenKH" Name="TenKH" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtSDT" Name="SDT" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtEmail" Name="Email" PropertyName="Text" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtTimKH" Name="MaKH" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtTimKH" Name="TenKH" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtTimKH" Name="SDT" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtTimKH" Name="Email" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblTTKHnew" runat="server" CssClass="auto-style50" Text="Nhập thông tin khách hàng mới: " Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <table class="auto-style1">
                    <tr>
                        <td>
                            <asp:Label ID="lblMaKH" runat="server" Text="Mã KH:" Visible="False"></asp:Label>
                            <asp:TextBox ID="txtMaKH" runat="server" Visible="False"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblTenKH" runat="server" Text="Tên KH:" Visible="False"></asp:Label>
                            <asp:TextBox ID="txtTenKH" runat="server" Visible="False"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblSDT" runat="server" Text="SDT:" Visible="False"></asp:Label>
                            <asp:TextBox ID="txtSDT" runat="server" Visible="False"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblEmail" runat="server" Text="Email:" Visible="False"></asp:Label>
                            <asp:TextBox ID="txtEmail" runat="server" Visible="False"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td><strong>
                <asp:Label ID="lblTTDH" runat="server" CssClass="auto-style48" Text="[2]THÔNG TIN ĐƠN HÀNG" Visible="False"></asp:Label>
                <asp:SqlDataSource ID="SqlDataSourceDDH" runat="server" ConnectionString="<%$ ConnectionStrings:WebHasakiConnectionString %>" DeleteCommand="DELETE FROM DonDatHang WHERE (MaDH = @MaDH)" InsertCommand="INSERT INTO DonDatHang(MaDH, NgayLap, DiaChiGiao, NguoiNhan, SDTNhan, ThoiHan, TinhTrang, MaKH) VALUES (@MaDH, @NgayLap, @DiaChiGiao, @NguoiNhan, @SDTNhan, @ThoiHan, @TinhTrang, @MaKH)" SelectCommand="SELECT * FROM [DonDatHang]">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="lblMaDDH" Name="MaDH" PropertyName="Text" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="lblMaDDH" Name="MaDH" PropertyName="Text" />
                        <asp:ControlParameter ControlID="lblNgayLap" DbType="Date" Name="NgayLap" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtDCGiao" Name="DiaChiGiao" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtNguoiNhan" Name="NguoiNhan" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtSDTNhan" Name="SDTNhan" PropertyName="Text" />
                        <asp:ControlParameter ControlID="CalendarHanGiao" DbType="Date" Name="ThoiHan" PropertyName="SelectedDate" />
                        <asp:Parameter DefaultValue="0" Name="TinhTrang" />
                        <asp:ControlParameter ControlID="txtTimKH" DefaultValue="" Name="MaKH" PropertyName="Text" />
                    </InsertParameters>
                </asp:SqlDataSource>
                </strong></td>
        </tr>
        <tr>
            <td class="auto-style46">
                <asp:Label ID="lblTTMaDDH" runat="server" Text="Mã đơn hàng:" Visible="False"></asp:Label>
                <strong>
                <asp:Label ID="lblMaDDH" runat="server" ForeColor="#FF3300" Visible="False"></asp:Label>
                </strong>
                <asp:Label ID="lblTTNgayLap" runat="server" Text="Ngày lập:" Visible="False"></asp:Label>
                <strong>
                <asp:Label ID="lblNgayLap" runat="server" ForeColor="#FF3300" Visible="False"></asp:Label>
                </strong></td>
        </tr>
        <tr>
            <td class="auto-style46">
                <asp:Label ID="lblTTDCGiao" runat="server" Text="Địa chỉ giao hàng:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtDCGiao" runat="server" Visible="False"></asp:TextBox>
                <asp:Label ID="lblNguoiNhan" runat="server" Text="Người nhận:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtNguoiNhan" runat="server" Visible="False"></asp:TextBox>
                <asp:Label ID="lblSDTNhan" runat="server" Text="SDT Nhận:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtSDTNhan" runat="server" Visible="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style46">
                <asp:Label ID="lblTTHanGiao" runat="server" Text="Hạn giao:" Visible="False"></asp:Label>
                <asp:Calendar ID="CalendarHanGiao" runat="server" Visible="False"></asp:Calendar>
            </td>
        </tr>
        <tr>
            <td class="auto-style46"><strong>
                <asp:Button ID="btnXacNhan" runat="server" BackColor="#006600" CssClass="auto-style51" Height="35px" OnClick="btnXacNhan_Click" Text="Xác nhận đơn hàng" Visible="False" Width="250px" />
                <asp:Button ID="btnHuyDDH" runat="server" BackColor="#006600" CssClass="auto-style51" Height="35px" OnClick="btnHuyDDH_Click" Text="Hủy đơn đặt hàng" Visible="False" Width="250px" />
                </strong></td>
        </tr>
        <tr>
            <td><strong>
                <asp:Label ID="lblCTDH" runat="server" CssClass="auto-style48" Text="[3]THÔNG TIN GIỎ HÀNG" Visible="False"></asp:Label>
                <asp:SqlDataSource ID="SqlDataSourceCTDDH" runat="server" ConnectionString="<%$ ConnectionStrings:WebHasakiConnectionString %>" DeleteCommand="DELETE FROM CTDonDatHang WHERE (MaDH = @MaDH) AND (MaSP = @MaSP)" InsertCommand="INSERT INTO CTDonDatHang(MaDH, MaSP, SLgDat) VALUES (@MaDH, @MaSP, @SLgDat)" SelectCommand="SELECT * FROM [CTDonDatHang]"></asp:SqlDataSource>
                </strong>
                <table class="auto-style1">
                    <tr>
                        <td>
                <asp:GridView ID="dgvGioHang" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="auto-style46" Width="1226px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="MaSP" HeaderText="Mã sản phẩm" />
                        <asp:BoundField DataField="TenSP" HeaderText="Tên sản phẩm" />
                        <asp:BoundField DataField="DVT" HeaderText="Đơn vị tính" />
                        <asp:BoundField DataField="GiaBan" HeaderText="Giá bán" />
                        <asp:BoundField DataField="SL" HeaderText="Số lượng" />
                        <asp:BoundField DataField="TT" DataFormatString="{0:0,000}" HeaderText="Thành tiền" />
                        <asp:TemplateField>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("HinhAnh") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image" runat="server" ImageUrl='<%# Eval("HinhAnh") %>' Height="150px" Width="150px" />
                            </ItemTemplate>
                        </asp:TemplateField>
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
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:Label ID="lblSum" runat="server" Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>
                            <asp:Button ID="btnThanhToan" runat="server" CssClass="auto-style51" OnClick="btnThanhToan_Click" Text="Thanh Toán" Visible="False" Width="150px" />
                            </strong></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
