<%@ Page Title="" Language="C#" MasterPageFile="~/QuanLy.Master" AutoEventWireup="true" CodeBehind="FormQLLoaiSP.aspx.cs" Inherits="_23_WebHasaki_5701.FormQLLoaiSP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style13 {
            font-weight: normal;
            color: #FF0066;
        }
        .auto-style14 {
            color: #006600;
        }
        .auto-style15 {
            height: 31px;
        }
        .auto-style16 {
            height: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td>
                <h3 class="auto-style6"><em>
                    <asp:Label ID="Label7" runat="server" CssClass="auto-style13" Text="CHÀO MỪNG BẠN ĐẾN VỚI TRANG QUẢN LÝ LOẠI SẢN PHẨM"></asp:Label>
                    </em></h3>
            </td>
        </tr>
        <tr>
            <td><strong>
                <asp:Label ID="Label8" runat="server" CssClass="auto-style14" Text="[1] THÔNG TIN LOẠI SẢN PHẨM"></asp:Label>
                </strong></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl" runat="server" Text="Nhập thông tin sản phẩm"></asp:Label>
                <asp:TextBox ID="txtTimLoai" runat="server"></asp:TextBox>
                <asp:Button ID="btnTimLoai" runat="server" Text="Tìm LoaiSP" OnClick="btnTimLoai_Click" />
                <asp:Button ID="btnHuy" runat="server" Text="Hủy" OnClick="btnHuy_Click" />
                <asp:Button ID="btnDSLoai" runat="server" OnClick="btnDSLoai_Click" Text="Danh sách loại" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="dgvLoaiSP" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MaLoai" DataSourceID="SqlDataSource_qlLoai" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="MaLoai" HeaderText="Mã loại sản phẩm" ReadOnly="True" SortExpression="MaLoai" />
                        <asp:BoundField DataField="TenLoai" HeaderText="Tên loại sản phẩm" SortExpression="TenLoai" />
                        <asp:BoundField DataField="GhiChu" HeaderText="Ghi chú" SortExpression="GhiChu" />
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
                <asp:SqlDataSource ID="SqlDataSource_qlLoai" runat="server" ConnectionString="<%$ ConnectionStrings:WebHasakiConnectionString %>" SelectCommand="SELECT MaLoai, TenLoai, GhiChu FROM LoaiSP WHERE (([MaLoai] LIKE  '%' + @MaLoai + '%' ) OR ([TenLoai] LIKE  '%' + @TenLoai +  '%'))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtTimLoai" Name="MaLoai" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtTimLoai" Name="TenLoai" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style16"><strong>
                <asp:Label ID="lblTTLSPnew" runat="server" CssClass="auto-style14" Text="[2] THÔNG TIN LOẠI SẢN PHẨM MỚI" Visible="False"></asp:Label>
                </strong></td>
        </tr>
        <tr>
            <td class="auto-style15">
                <asp:Label ID="lblMaLoai" runat="server" Text="Mã loại sản phẩm:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtMaLoai" runat="server" Visible="False"></asp:TextBox>
                <asp:Label ID="lblTenLoai" runat="server" Text="Tên loại sản phẩm:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtTenLoai" runat="server" Visible="False"></asp:TextBox>
                <asp:Label ID="lblGhiChu" runat="server" Text="Ghi chú" Visible="False"></asp:Label>
                <asp:TextBox ID="txtGhiChu" runat="server" Visible="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="dgvCSLoai" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" Caption="CHỈNH SỬA LOẠI SẢN PHẨM" CellPadding="4" DataKeyNames="MaLoai" DataSourceID="SqlDataSource_CSLoai" GridLines="Horizontal">
                    <Columns>
                        <asp:BoundField DataField="MaLoai" HeaderText="Mã loại sản phẩm" ReadOnly="True" SortExpression="MaLoai" />
                        <asp:BoundField DataField="TenLoai" HeaderText="Tên loại sản phẩm" SortExpression="TenLoai" />
                        <asp:BoundField DataField="GhiChu" HeaderText="Ghi chú" SortExpression="GhiChu" />
                        <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" />
                        <asp:CommandField CancelText="Hủy" EditText="Sửa" ShowEditButton="True" UpdateText="Cập nhật" />
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
                <asp:SqlDataSource ID="SqlDataSource_CSLoai" runat="server" ConnectionString="<%$ ConnectionStrings:WebHasakiConnectionString %>" InsertCommand="INSERT INTO LoaiSP(MaLoai, TenLoai, GhiChu) VALUES (@MaLoai, @TenLoai, @GhiChu)" SelectCommand="SELECT MaLoai, TenLoai, GhiChu FROM LoaiSP WHERE (MaLoai = @MaLoai)" UpdateCommand="UPDATE LoaiSP SET MaLoai = @MaLoai, TenLoai = @TenLoai, GhiChu = @GhiChu WHERE (MaLoai = @MaLoai)" DeleteCommand="DELETE FROM LoaiSP WHERE (MaLoai = @MaLoai)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="dgvCSLoai" Name="MaLoai" PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtMaLoai" Name="MaLoai" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtTenLoai" Name="TenLoai" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtGhiChu" Name="GhiChu" PropertyName="Text" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="dgvLoaiSP" Name="MaLoai" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="dgvCSLoai" Name="MaLoai" PropertyName="SelectedValue[0]" />
                        <asp:ControlParameter ControlID="dgvCSLoai" Name="TenLoai" PropertyName="SelectedValue[1]" />
                        <asp:ControlParameter ControlID="dgvCSLoai" Name="GhiChu" PropertyName="SelectedValue[3]" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" Caption="DANH SÁCH LOẠI SẢN PHẨM" CellPadding="4" DataKeyNames="MaLoai" DataSourceID="SqlDataSource_dsloai" GridLines="Horizontal" Visible="False">
                    <Columns>
                        <asp:BoundField DataField="MaLoai" HeaderText="Mã loại" ReadOnly="True" SortExpression="MaLoai" />
                        <asp:BoundField DataField="TenLoai" HeaderText="Tên loại" SortExpression="TenLoai" />
                        <asp:BoundField DataField="GhiChu" HeaderText="Ghi chú" SortExpression="GhiChu" />
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
                <asp:SqlDataSource ID="SqlDataSource_dsloai" runat="server" ConnectionString="<%$ ConnectionStrings:WebHasakiConnectionString %>" SelectCommand="SELECT * FROM [LoaiSP]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
