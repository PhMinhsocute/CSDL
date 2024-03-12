<%@ Page Title="" Language="C#" MasterPageFile="~/QuanLy.Master" AutoEventWireup="true" CodeBehind="FormQLSanPham.aspx.cs" Inherits="_23_WebHasaki_5701.FormQLSanPham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style13 {
            color: #FF0066;
            font-weight: normal;
        }
        .auto-style15 {
            color: #006600;
        }
        .auto-style16 {
            height: 30px;
        }
        .auto-style17 {
            height: 74px;
            text-align: left;
        }
        .auto-style18 {
            color: #FFFFFF;
            font-weight: bold;
            background-color: #006600;
        }
        .auto-style19 {
            text-align: left;
            height: 31px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style6">
                <h3><em>
                    <asp:Label ID="Label7" runat="server" CssClass="auto-style13" Text="CHÀO MỪNG BẠN ĐẾN VỚI TRANG QUẢN LÝ SẢN PHẨM"></asp:Label>
                    </em></h3>
            </td>
        </tr>
        <tr>
            <td class="auto-style19">
                <strong>
                <asp:Label ID="Label10" runat="server" CssClass="auto-style15" Text="[1] THÔNG TIN SẢN PHẨM"></asp:Label>
                </strong>
            </td>
        </tr>
        <tr>
            <td class="auto-style19">
                <asp:Label ID="Label11" runat="server" Text="Nhập thông tin sản phẩm:"></asp:Label>
                <asp:TextBox ID="txtTim" runat="server"></asp:TextBox>
                <strong>
                <asp:Button ID="btnTim" runat="server" CssClass="auto-style18" OnClick="btnTim_Click" Text="Tìm" />
                </strong>
            </td>
        </tr>
        <tr>
            <td class="auto-style19">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MaSP" DataSourceID="SqlDataSource_TimSP" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="MaSP" HeaderText="Mã sản phẩm" ReadOnly="True" SortExpression="MaSP" />
                        <asp:BoundField DataField="MaLoai" HeaderText="Mã loại " SortExpression="MaLoai" />
                        <asp:BoundField DataField="TenSP" HeaderText="Tên sản phẩm" SortExpression="TenSP" />
                        <asp:BoundField DataField="DVT" HeaderText="Đơn vị tính" SortExpression="DVT" />
                        <asp:BoundField DataField="GiaBan" DataFormatString="{0:0,000}" HeaderText="Giá bán" SortExpression="GiaBan" />
                        <asp:TemplateField HeaderText="Hình ảnh" SortExpression="HinhAnh">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("HinhAnh") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image7" runat="server" Height="150px" ImageUrl='<%# Eval("HinhAnh") %>' Width="150px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" />
                        <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" UpdateText="Cập nhật " />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <EmptyDataTemplate>
                        <asp:Image ID="Image6" runat="server" ImageUrl='<%# Eval("HinhAnh") %>' />
                    </EmptyDataTemplate>
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
                <asp:SqlDataSource ID="SqlDataSource_TimSP" runat="server" ConnectionString="<%$ ConnectionStrings:WebHasakiConnectionString %>" DeleteCommand="DELETE FROM SanPham WHERE (MaSP = @MaSP)" SelectCommand="SELECT MaSP, MaLoai, TenSP, DVT, GiaBan, HinhAnh FROM SanPham WHERE (MaSP LIKE '%' + @MaSP + '%') OR (MaLoai LIKE '%' +@MaLoai+'%' ) OR (TenSP LIKE '%' + @TenSP+'%' ) OR (DVT LIKE '%' + @DVT + '%' ) OR (GiaBan LIKE '%' + @GiaBan + '%' )" UpdateCommand="UPDATE SanPham SET  MaLoai = @MaLoai, TenSP = @TenSP, DVT = @DVT, GiaBan = @GiaBan WHERE (MaSP = @MaSP)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="dgvdssp" Name="MaSP" PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtTim" Name="MaSP" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtTim" Name="MaLoai" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtTim" Name="TenSP" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtTim" Name="DVT" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtTim" Name="GiaBan" PropertyName="Text" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="dgvdssp" Name="MaLoai" PropertyName="SelectedValue[1]" />
                        <asp:ControlParameter ControlID="dgvdssp" Name="TenSP" PropertyName="SelectedValue[2]" />
                        <asp:ControlParameter ControlID="dgvdssp" Name="DVT" PropertyName="SelectedValue[3]" />
                        <asp:ControlParameter ControlID="dgvdssp" Name="GiaBan" PropertyName="SelectedValue[4]" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style16"><strong>
                <asp:Label ID="lblTTSPnew" runat="server" CssClass="auto-style15" Text="[2] THÔNG TIN SẢN PHẨM MỚI"></asp:Label>
                </strong></td>
        </tr>
        <tr>
            <td class="auto-style17">
                <asp:Label ID="lblMaSP" runat="server" Text="Mã sản phẩm:"></asp:Label>
                <asp:TextBox ID="txtMaSP" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="lblTenSP" runat="server" Text="Tên sản phẩm:"></asp:Label>
                <asp:TextBox ID="txtTenSP" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="lblLoaiSP" runat="server" Text="Loại sản phẩm:"></asp:Label>
                <strong style="font-family: 'times New Roman', Times, serif">
                <asp:DropDownList ID="DropDownListLoaiSP" runat="server" DataSourceID="SqlDataSourceLsanpham" DataTextField="TenLoai" DataValueField="MaLoai" BackColor="#006600" ForeColor="White">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceLsanpham" runat="server" ConnectionString="<%$ ConnectionStrings:WebHasakiConnectionString %>" SelectCommand="SELECT * FROM [LoaiSP]"></asp:SqlDataSource>
                <br />
                </strong>
                <br />
                <asp:Label ID="lblDVT" runat="server" Text="Đơn vị tính:"></asp:Label>
                <asp:TextBox ID="txtDVT" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="lblGiaBan" runat="server" Text="Giá bán:"></asp:Label>
                <asp:TextBox ID="txtGiaBan" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="lblHinhAnh" runat="server" Text="Hình ảnh:"></asp:Label>
                <asp:FileUpload ID="FileUploadHA" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="auto-style4"><strong>
                <asp:Button ID="btnThem" runat="server" CssClass="auto-style18" Text="Thêm SP" OnClick="btnThem_Click" Height="32px" />
                &nbsp;
                </strong>
                <asp:Button ID="btnHuy" runat="server" CssClass="auto-style18" Text="Hủy" Height="32px" OnClick="btnHuy_Click" Width="83px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style4"><strong>
                <asp:Label ID="Label9" runat="server" CssClass="auto-style15" Text="[3] DANH SÁCH SẢN PHẨM TẠI HASAKI"></asp:Label>
                &nbsp;&nbsp;
                <asp:Button ID="btnDanhSach" runat="server" OnClick="btnDanhSach_Click" Text="Danh sách sản phẩm" CssClass="auto-style18" Height="39px" Width="225px" />
                <br />
                </strong>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:GridView ID="dgvdssp" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MaSP" DataSourceID="SqlDataSource_qlSP" ForeColor="#333333" GridLines="None" Visible="False">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="MaSP" HeaderText="Mã sản phẩm" ReadOnly="True" SortExpression="MaSP" />
                        <asp:TemplateField HeaderText="Mã loại" SortExpression="MaLoai">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("MaLoai") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("MaLoai") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="TenSP" HeaderText="Tên sản phẩm" SortExpression="TenSP" />
                        <asp:BoundField DataField="DVT" HeaderText="Đơn vị tính" SortExpression="DVT" />
                        <asp:BoundField DataField="GiaBan" HeaderText="Giá bán" SortExpression="GiaBan" DataFormatString="{0:0,000}" />
                        <asp:TemplateField HeaderText="Hình ảnh" SortExpression="HinhAnh">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("HinhAnh") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image" runat="server" Height="150px" ImageUrl='<%# Eval("HinhAnh") %>' Width="150px" />
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
                <asp:SqlDataSource ID="SqlDataSource_qlSP" runat="server" ConnectionString="<%$ ConnectionStrings:WebHasakiConnectionString %>" SelectCommand="SELECT * FROM [SanPham]" InsertCommand="INSERT INTO SanPham(MaSP, MaLoai, TenSP, DVT, GiaBan, HinhAnh) VALUES (@MaSP, @MaLoai, @TenSP, @DVT, @GiaBan, @HinhAnh)" DeleteCommand="DELETE FROM SanPham WHERE (MaSP = @MaSP)" UpdateCommand="UPDATE SanPham SET MaSP =, MaLoai = @MaLoai, TenSP = @TenSP, DVT = @DVT, GiaBan = @GiaBan WHERE (MaSP = @MaSP)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="dgvdssp" Name="MaSP" PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="dgvdssp" Name="MaLoai" PropertyName="SelectedValue[1]" />
                        <asp:ControlParameter ControlID="dgvdssp" Name="TenSP" PropertyName="SelectedValue[2]" />
                        <asp:ControlParameter ControlID="dgvdssp" Name="DVT" PropertyName="SelectedValue[3]" />
                        <asp:ControlParameter ControlID="dgvdssp" Name="GiaBan" PropertyName="SelectedValue[4]" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
