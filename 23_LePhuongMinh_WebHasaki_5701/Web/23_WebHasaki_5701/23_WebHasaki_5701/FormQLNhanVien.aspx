<%@ Page Title="" Language="C#" MasterPageFile="~/QuanLy.Master" AutoEventWireup="true" CodeBehind="FormQLNhanVien.aspx.cs" Inherits="_23_WebHasaki_5701.FormQLNhanVien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style13 {
            color: #FF0066;
            font-weight: normal;
        }
        .auto-style14 {
            height: 39px;
            text-align: left;
        }
        .auto-style15 {
            color: #006600;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style6">
                <h3><em>
                <asp:Label ID="Label7" runat="server" CssClass="auto-style13" Text="CHÀO MỪNG BẠN ĐẾN VỚI TRANG QUẢN LÝ NHÂN VIÊN CỦA HASAKI"></asp:Label>
                </em></h3>
            </td>
        </tr>
        <tr>
            <td><strong>
                <asp:Label ID="Label8" runat="server" CssClass="auto-style15" Text="[1] THÔNG TIN NHÂN VIÊN"></asp:Label>
                </strong></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Text="Nhập thông tin nhân viên:"></asp:Label>
                <asp:TextBox ID="txtTimNV" runat="server"></asp:TextBox>
                <asp:Button ID="btnTim" runat="server" OnClick="btnTim_Click" Text="Tìm NV" />
                <asp:Button ID="btnHuy" runat="server" OnClick="btnHuy_Click" Text="Hủy" />
                <asp:Button ID="btnLoad" runat="server" OnClick="btnLoad_Click" Text="Load" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="dgvNV" runat="server" AutoGenerateColumns="False" Caption="Bảng Nhân Viên" CellPadding="4" DataKeyNames="MaNV" DataSourceID="SqlDataSource_qlNV" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="MaNV" HeaderText="Mã nhân viên" ReadOnly="True" SortExpression="MaNV" />
                        <asp:BoundField DataField="HoTenNV" HeaderText="Họ tên nhân viên" SortExpression="HoTenNV" />
                        <asp:BoundField DataField="GioiTinh" HeaderText="Giới tính" SortExpression="GioiTinh" />
                        <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" SortExpression="DiaChi" />
                        <asp:TemplateField HeaderText="Ngày sinh" SortExpression="NgaySinh">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NgaySinh") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("NgaySinh") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="SDT" HeaderText="SĐT" SortExpression="SDT" />
                        <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                        <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" UpdateText="Cập nhật" />
                        <asp:CommandField CancelText="" DeleteText="Xóa" ShowDeleteButton="True" />
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
                <asp:SqlDataSource ID="SqlDataSource_qlNV" runat="server" ConnectionString="<%$ ConnectionStrings:WebHasakiConnectionString %>" SelectCommand="SELECT MaNV, HoTenNV, GioiTinh, DiaChi, NgaySinh, SDT FROM NhanVien WHERE (([MaNV] LIKE '%' + @MaNV + '%' ) OR ([HoTenNV] LIKE '%' + @HoTenNV + '%' ) OR ([GioiTinh] LIKE '%' + @GioiTinh + '%' ) OR ([DiaChi] LIKE '%' + @DiaChi + '%' ) OR ([SDT] LIKE '%' + @SDT + '%' ))
" DeleteCommand="DELETE FROM NhanVien WHERE (MaNV = @MaNV)" InsertCommand="INSERT INTO NhanVien(MaNV, HoTenNV, GioiTinh, DiaChi, NgaySinh, SDT) VALUES (@MaNV, @HoTenNV, @GioiTinh, @DiaChi, @NgaySinh, @SDT)" UpdateCommand="UPDATE NhanVien SET MaNV = @MaNV, HoTenNV = @HoTenNV, GioiTinh = @GioiTinh, DiaChi = @DiaChi, NgaySinh = @NgaySinh, SDT = @SDT WHERE (MaNV = @MaNV)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="dgvNV" Name="MaNV" PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtMaNV" Name="MaNV" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtTenNV" Name="HoTenNV" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtGT" Name="GioiTinh" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtDC" Name="DiaChi" PropertyName="Text" />
                        <asp:ControlParameter ControlID="CalendarNgaySinh" DbType="DateTime" Name="NgaySinh" PropertyName="SelectedDate" />
                        <asp:ControlParameter ControlID="txtSDT" Name="SDT" PropertyName="Text" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtTimNV" Name="MaNV" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtTimNV" Name="HoTenNV" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtTimNV" Name="GioiTinh" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtTimNV" Name="DiaChi" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtTimNV" Name="SDT" PropertyName="Text" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="dgvNV" Name="MaNV" PropertyName="SelectedValue[0]" />
                        <asp:ControlParameter ControlID="dgvNV" Name="HoTenNV" PropertyName="SelectedValue[1]" />
                        <asp:ControlParameter ControlID="dgvNV" Name="GioiTinh" PropertyName="SelectedValue[2]" />
                        <asp:ControlParameter ControlID="dgvNV" Name="DiaChi" PropertyName="SelectedValue[3]" />
                        <asp:ControlParameter ControlID="dgvNV" DbType="DateTime" Name="NgaySinh" PropertyName="SelectedValue[4]" />
                        <asp:ControlParameter ControlID="dgvNV" Name="SDT" PropertyName="SelectedValue[5]" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td><strong>
                <asp:Label ID="lblNVnew" runat="server" CssClass="auto-style15" Text="[2] NHẬP THÔNG TIN KHÁCH HÀNG MỚI" Visible="False"></asp:Label>
                </strong></td>
        </tr>
        <tr>
            <td class="auto-style14">
                <div class="auto-style4">
                <asp:Label ID="lblMaNV" runat="server" Text="Mã nhân viên:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtMaNV" runat="server" Visible="False"></asp:TextBox>
                <asp:Label ID="lblTenNV" runat="server" Text="Tên nhân viên:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtTenNV" runat="server" Visible="False"></asp:TextBox>
                <asp:Label ID="lblGT" runat="server" Text="Giới tính:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtGT" runat="server" Visible="False"></asp:TextBox>
                <asp:Label ID="lblSDT" runat="server" Text="SĐT:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtSDT" runat="server" Visible="False"></asp:TextBox>
                <br />
                <asp:Label ID="lblDC" runat="server" Text="Địa chỉ:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtDC" runat="server" Visible="False"></asp:TextBox>
                <asp:Label ID="lblNgaySinh" runat="server" Text="Ngày sinh:" Visible="False"></asp:Label>
                </div>
                <asp:Calendar ID="CalendarNgaySinh" runat="server" Visible="False"></asp:Calendar>
            </td>
        </tr>
        <tr>
            <td class="auto-style14">
                <h3 class="auto-style6"><em><strong>
                    <asp:Label ID="Label10" runat="server" CssClass="auto-style15" Text="DANH SÁCH CÁC NHÂN VIÊN ĐANG LÀM TẠI HASAKI"></asp:Label>
                    </strong></em></h3>
                <p class="auto-style6">
                    <asp:GridView ID="dgv_allNV" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="MaNV" DataSourceID="SqlDataSource_allNV" GridLines="Horizontal">
                        <Columns>
                            <asp:BoundField DataField="MaNV" HeaderText="Mã nhân viên" ReadOnly="True" SortExpression="MaNV" />
                            <asp:BoundField DataField="HoTenNV" HeaderText="Họ tên nhân viên" SortExpression="HoTenNV" />
                            <asp:BoundField DataField="GioiTinh" HeaderText="Giới tính" SortExpression="GioiTinh" />
                            <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" SortExpression="DiaChi" />
                            <asp:BoundField DataField="NgaySinh" HeaderText="Ngày sinh" SortExpression="NgaySinh" />
                            <asp:BoundField DataField="SDT" HeaderText="Số điện thoại" SortExpression="SDT" />
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
                    <asp:SqlDataSource ID="SqlDataSource_allNV" runat="server" ConnectionString="<%$ ConnectionStrings:WebHasakiConnectionString %>" SelectCommand="SELECT * FROM [NhanVien]"></asp:SqlDataSource>
                </p>
            </td>
        </tr>
        <tr>
            <td class="auto-style14">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
