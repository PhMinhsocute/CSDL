<%@ Page Title="" Language="C#" MasterPageFile="~/QuanLy.Master" AutoEventWireup="true" CodeBehind="FormQLNhaCungCap.aspx.cs" Inherits="_23_WebHasaki_5701.FormQLNhaCungCap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style13 {
            font-weight: normal;
            color: #FF0066;
        }
        .auto-style14 {
            height: 30px;
        }
        .auto-style15 {
            color: #006600;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
    <tr>
        <td>
            <h3 class="auto-style6"><em>
                <asp:Label ID="Label7" runat="server" CssClass="auto-style13" Text="CHÀO MỪNG BẠN ĐẾN VỚI TRANG QUẢN LÝ NHÀ CUNG CẤP"></asp:Label>
                </em></h3>
        </td>
    </tr>
    <tr>
        <td class="auto-style14">
            <strong>
            <asp:Label ID="Label8" runat="server" Text="[1] THÔNG TIN NHÀ CUNG CẤP:" CssClass="auto-style15"></asp:Label>
            </strong>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label9" runat="server" Text="Nhập thông tin nhà cung cấp:"></asp:Label>
            <asp:TextBox ID="txtTimNCC" runat="server"></asp:TextBox>
            <asp:Button ID="btnTimNCC" runat="server" Text="Tìm NCC" OnClick="btnTimNCC_Click" />
            <asp:Button ID="btnHuy" runat="server" Text="Hủy" OnClick="btnHuy_Click" />
            <asp:Button ID="btnLoad" runat="server" OnClick="btnLoad_Click" Text="Load" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="dgvNCC" runat="server" AutoGenerateColumns="False" Caption="Bảng Nhà Cung Cấp" CellPadding="4" DataKeyNames="MaNCC" DataSourceID="SqlDataSource_qlNCC" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="MaNCC" HeaderText="Mã nhà cung cấp" ReadOnly="True" SortExpression="MaNCC" />
                    <asp:BoundField DataField="TenNCC" HeaderText="Tên nhà cung cấp" SortExpression="TenNCC" />
                    <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" SortExpression="DiaChi" />
                    <asp:BoundField DataField="SDT" HeaderText="SĐT" SortExpression="SDT" />
                    <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                    <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" />
                    <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" UpdateText="Cập nhật" />
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
            <asp:SqlDataSource ID="SqlDataSource_qlNCC" runat="server" ConnectionString="<%$ ConnectionStrings:WebHasakiConnectionString %>" DeleteCommand="DELETE FROM NhaCungCap WHERE (MaNCC = @MaNCC)" InsertCommand="INSERT INTO NhaCungCap(MaNCC, TenNCC, DiaChi, SDT) VALUES (@MaNCC, @TenNCC, @DiaChi, @SDT)" SelectCommand="SELECT MaNCC, TenNCC, DiaChi, SDT FROM NhaCungCap WHERE (([MaNCC] LIKE '%' + @MaNCC + '%') OR ([TenNCC] LIKE  '%' + @TenNCC +  '%') OR ([DiaChi] LIKE  '%' + @DiaChi + '%') OR ([SDT] LIKE '%' +@SDT + '%'))" UpdateCommand="UPDATE NhaCungCap SET MaNCC = @MaNCC, TenNCC = @TenNCC, DiaChi = @DiaChi, SDT = @SDT WHERE (MaNCC = @MaNCC)">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="dgvNCC" Name="MaNCC" PropertyName="SelectedValue" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtMaNCC" Name="MaNCC" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtTenNCC" Name="TenNCC" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtDiaChi" Name="DiaChi" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtSDT" Name="SDT" PropertyName="Text" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtTimNCC" Name="MaNCC" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtTimNCC" Name="TenNCC" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtTimNCC" Name="DiaChi" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtTimNCC" Name="SDT" PropertyName="Text" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="dgvNCC" Name="MaNCC" PropertyName="SelectedValue[0]" />
                    <asp:ControlParameter ControlID="dgvNCC" Name="TenNCC" PropertyName="SelectedValue[1]" />
                    <asp:ControlParameter ControlID="dgvNCC" Name="DiaChi" PropertyName="SelectedValue[2]" />
                    <asp:ControlParameter ControlID="dgvNCC" Name="SDT" PropertyName="SelectedValue[3]" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td><strong>
            <asp:Label ID="lblTTNCCnew" runat="server" CssClass="auto-style15" Text="[2] NHẬP THÔNG TIN NHÀ CUNG CẤP MỚI:" Visible="False"></asp:Label>
            </strong></td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblMaNCC" runat="server" Text="Mã nhà cung cấp:" Visible="False"></asp:Label>
            <br />
            <asp:TextBox ID="txtMaNCC" runat="server" Visible="False"></asp:TextBox>
            <br />
            <asp:Label ID="lblTenNCC" runat="server" Text="Tên nhà cung cấp:" Visible="False"></asp:Label>
            <br />
            <asp:TextBox ID="txtTenNCC" runat="server" Visible="False"></asp:TextBox>
            <br />
            <asp:Label ID="lblDiaChi" runat="server" Text="Địa chỉ: " Visible="False"></asp:Label>
            <br />
            <asp:TextBox ID="txtDiaChi" runat="server" Visible="False"></asp:TextBox>
            <br />
            <asp:Label ID="lblSDT" runat="server" Text="SĐT:" Visible="False"></asp:Label>
            <br />
            <asp:TextBox ID="txtSDT" runat="server" Visible="False"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style6">
            <h3>
                <asp:Label ID="Label10" runat="server" CssClass="auto-style15" Text="DANH SÁCH CÁC NHÀ CUNG CẤP CHO HASAKI"></asp:Label>
            </h3>
        </td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="dgv_allNCC" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="MaNCC" DataSourceID="SqlDataSource_allNCC" GridLines="Horizontal">
                <Columns>
                    <asp:BoundField DataField="MaNCC" HeaderText="Mã nhà cung cấp" ReadOnly="True" SortExpression="MaNCC" />
                    <asp:BoundField DataField="TenNCC" HeaderText="Tên nhà cung cấp" SortExpression="TenNCC" />
                    <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" SortExpression="DiaChi" />
                    <asp:BoundField DataField="SDT" HeaderText="SĐT" SortExpression="SDT" />
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
            <asp:SqlDataSource ID="SqlDataSource_allNCC" runat="server" ConnectionString="<%$ ConnectionStrings:WebHasakiConnectionString %>" SelectCommand="SELECT * FROM [NhaCungCap]"></asp:SqlDataSource>
        </td>
    </tr>
</table>
</asp:Content>
