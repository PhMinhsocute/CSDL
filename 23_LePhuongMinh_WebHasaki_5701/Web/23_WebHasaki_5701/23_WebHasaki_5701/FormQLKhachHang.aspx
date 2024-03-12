<%@ Page Title="" Language="C#" MasterPageFile="~/QuanLy.Master" AutoEventWireup="true" CodeBehind="FormQLKhachHang.aspx.cs" Inherits="_23_WebHasaki_5701.FormQLKhachHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
    <tr>
        <td>
            <h3 class="auto-style6"><em>
                <asp:Label ID="Label7" runat="server" CssClass="auto-style13" style="color: #FF0066; font-weight: normal" Text="CHÀO MỪNG BẠN ĐẾN VỚI TRANG QUẢN LÝ KHÁCH HÀNG CỦA HASAKI"></asp:Label>
                </em></h3>
        </td>
    </tr>
    <tr>
        <td><strong>
            <asp:Label ID="Label8" runat="server" CssClass="auto-style16" style="color: #006600" Text="[1] THÔNG TIN KHÁCH HÀNG"></asp:Label>
            </strong></td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label9" runat="server" Text="Nhập thông tin khách hàng:"></asp:Label>
            <asp:TextBox ID="txtTimKH" runat="server"></asp:TextBox>
            <asp:Button ID="btnTimKH" runat="server" OnClick="btnTimKH_Click" Text="Tìm KH" />
            <asp:Button ID="btnHuy" runat="server" OnClick="btnHuy_Click" Text="Hủy" />
            <asp:Button ID="btnLoad" runat="server" OnClick="btnLoad_Click" Text="Load" />
        </td>
    </tr>
    <tr>
        <td>
            <div class="auto-style4">
                <asp:GridView ID="dgvKH" runat="server" AutoGenerateColumns="False" Caption="Bảng Khách Hàng" CellPadding="4" DataKeyNames="MaKH" DataSourceID="SqlDataSource_qlKH" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="MaKH" HeaderText="Mã khách hàng" ReadOnly="True" SortExpression="MaKH" />
                        <asp:BoundField DataField="TenKH" HeaderText="Tên khách hàng" SortExpression="TenKH" />
                        <asp:BoundField DataField="SDT" HeaderText="Số điện thoại" SortExpression="SDT" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
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
            </div>
            <asp:SqlDataSource ID="SqlDataSource_qlKH" runat="server" ConnectionString="<%$ ConnectionStrings:WebHasakiConnectionString %>" DeleteCommand="DELETE FROM KhachHang WHERE (MaKH = @MaKH)" InsertCommand="INSERT INTO KhachHang(MaKH, TenKH, SDT, Email) VALUES (@MaKH, @TenKH, @SDT, @Email)" SelectCommand="SELECT MaKH, TenKH, SDT, Email FROM KhachHang WHERE (([MaKH] LIKE '%' + @MaKH +'%' ) OR ([TenKH] LIKE '%' + @TenKH + '%' ) OR ([SDT] LIKE '%' + @SDT + '%' ) OR ([Email] LIKE '%' + @Email + '%' ))" UpdateCommand="UPDATE KhachHang SET MaKH = @MaKH, TenKH = @TenKH, SDT = @SDT, Email = @Email WHERE (MaKH = @MaKH)">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="dgvKH" Name="MaKH" PropertyName="SelectedValue" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtMaKH" Name="MaKH" PropertyName="Text" />
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
                <UpdateParameters>
                    <asp:ControlParameter ControlID="dgvKH" Name="MaKH" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="dgvKH" Name="TenKH" PropertyName="SelectedValue[1]" />
                    <asp:ControlParameter ControlID="dgvKH" Name="SDT" PropertyName="SelectedValue[2]" />
                    <asp:ControlParameter ControlID="dgvKH" Name="Email" PropertyName="SelectedValue[3]" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td><strong>
            <asp:Label ID="lblTTKHnew" runat="server" CssClass="auto-style16" style="color: #006600" Text="[2] NHẬP THÔNG TIN KHÁCH HÀNG MỚI " Visible="False"></asp:Label>
            </strong></td>
    </tr>
    <tr>
        <td>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style14">
                        <asp:Label ID="lblMaKH" runat="server" Text="Mã khách hàng:" Visible="False"></asp:Label>
&nbsp;
                        <asp:TextBox ID="txtMaKH" runat="server" Visible="False"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="lblTenKH" runat="server" Text="Tên khách hàng:" Visible="False"></asp:Label>
&nbsp;<asp:TextBox ID="txtTenKH" runat="server" Visible="False"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="lblSDT" runat="server" Text="Số điện thoại:" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtSDT" runat="server" Visible="False"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="lblEmail" runat="server" Text="Email:" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtEmail" runat="server" Visible="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">
                        <h3 class="auto-style6"><strong><em>
                            <asp:Label ID="Label10" runat="server" CssClass="auto-style16" style="color: #006600" Text="DANH SÁCH KHÁCH HÀNG ĐÃ MUA TẠI HASAKI"></asp:Label>
                            </em></strong></h3>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style14">
                        <div class="auto-style4">
                            <asp:GridView ID="dgv_allKH" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="MaKH" DataSourceID="SqlDataSource_allKH" GridLines="Horizontal" Width="1141px">
                                <Columns>
                                    <asp:BoundField DataField="MaKH" HeaderText="Mã khách hàng" ReadOnly="True" SortExpression="MaKH" />
                                    <asp:BoundField DataField="TenKH" HeaderText="Tên khách hàng" SortExpression="TenKH" />
                                    <asp:BoundField DataField="SDT" HeaderText="Số điện thoại" SortExpression="SDT" />
                                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                    <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" UpdateText="Cập nhật" />
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
                        </div>
                        <asp:SqlDataSource ID="SqlDataSource_allKH" runat="server" ConnectionString="<%$ ConnectionStrings:WebHasakiConnectionString %>" SelectCommand="SELECT MaKH, TenKH, SDT, Email FROM KhachHang WHERE (MaKH = @MaKH)" DeleteCommand="DELETE FROM KhachHang WHERE (MaKH = @MaKH)" UpdateCommand="UPDATE KhachHang SET  TenKH = @TenKH, SDT = @SDT, Email = @Email WHERE (MaKH = @MaKH)">
                            <DeleteParameters>
                                <asp:ControlParameter ControlID="dgv_allKH" Name="MaKH" PropertyName="SelectedValue" />
                            </DeleteParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="dgvKH" Name="MaKH" PropertyName="SelectedValue" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="dgv_allKH" Name="TenKH" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dgv_allKH" Name="SDT" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dgv_allKH" Name="Email" PropertyName="SelectedValue" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</asp:Content>
