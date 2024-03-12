<%@ Page Title="" Language="C#" MasterPageFile="~/QuanLy.Master" AutoEventWireup="true" CodeBehind="FormQLPhieuNhap.aspx.cs" Inherits="_23_WebHasaki_5701.FormQLPhieuNhap" %>
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
            height: 256px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td>
                <h3 class="auto-style6"><em>
                    <asp:Label ID="Label7" runat="server" CssClass="auto-style13" Text="CHÀO MỪNG BẠN ĐẾN QUẢN LÝ PHIẾU NHẬP HASAKI"></asp:Label>
                    </em></h3>
            </td>
        </tr>
        <tr>
            <td><strong>
                <asp:Label ID="Label8" runat="server" CssClass="auto-style14" Text="[1]THÔNG TIN PHIẾU NHẬP "></asp:Label>
                </strong></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Text="Nhập thông tin phiếu nhập:"></asp:Label>
                <asp:TextBox ID="txtTimPN" runat="server"></asp:TextBox>
                <asp:Button ID="btnTimPN" runat="server" OnClick="btnTimPN_Click" Text="Tìm PN" />
                <asp:Button ID="btnHuy" runat="server" OnClick="btnHuy_Click" Text="Hủy" />
                <asp:Button ID="btnLoad" runat="server" OnClick="btnLoad_Click" Text="Load" Height="35px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style15">
                <asp:GridView ID="dgvPN" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="SoPN" DataSourceID="SqlDataSource_qlPN" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="SoPN" HeaderText="Số Phiếu Nhập" ReadOnly="True" SortExpression="SoPN" />
                        <asp:BoundField DataField="MaNV" HeaderText="Mã nhân viên" SortExpression="MaNV" />
                        <asp:BoundField DataField="MaNCC" HeaderText="Mã nhà cung cấp" SortExpression="MaNCC" />
                        <asp:BoundField DataField="NgayNhap" HeaderText="Ngày nhập" SortExpression="NgayNhap" />
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
                <asp:SqlDataSource ID="SqlDataSource_qlPN" runat="server" ConnectionString="<%$ ConnectionStrings:WebHasakiConnectionString %>" DeleteCommand="DELETE FROM PhieuNhap WHERE (SoPN = @SoPN)" InsertCommand="INSERT INTO PhieuNhap(SoPN, MaNV, MaNCC, NgayNhap) VALUES (@SoPN, @MaNV, @MaNCC, @NgayNhap)" OnSelecting="SqlDataSource_qlPN_Selecting" SelectCommand="SELECT SoPN, MaNV, MaNCC, NgayNhap FROM PhieuNhap WHERE (([SoPN] LIKE '%' + @SoPN + '%' ) OR ([MaNV] LIKE '%' + @MaNV + '%' ) OR ([MaNCC] LIKE '%' + @MaNCC + '%' ))" UpdateCommand="UPDATE PhieuNhap SET SoPN = @SoPN, MaNV = @MaNV, MaNCC = @MaNCC, NgayNhap = @NgayNhap WHERE (SoPN = @SoPN)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="dgvPN" Name="SoPN" PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtSoPN" Name="SoPN" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtMaNV" Name="MaNV" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtMaNCC" Name="MaNCC" PropertyName="Text" />
                        <asp:ControlParameter ControlID="CalendarNgayNhap" DbType="DateTime" Name="NgayNhap" PropertyName="SelectedDate" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtTimPN" Name="SoPN" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtTimPN" Name="MaNV" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtTimPN" Name="MaNCC" PropertyName="Text" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="dgvPN" Name="SoPN" PropertyName="SelectedValue[0]" />
                        <asp:ControlParameter ControlID="dgvPN" Name="MaNV" PropertyName="SelectedValue[1]" />
                        <asp:ControlParameter ControlID="dgvPN" Name="MaNCC" PropertyName="SelectedValue[2]" />
                        <asp:ControlParameter ControlID="dgvPN" DbType="DateTime" Name="NgayNhap" PropertyName="SelectedValue[3]" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td><strong>
                <asp:Label ID="lblTTPNnew" runat="server" CssClass="auto-style14" Text="[2] NHẬP THÔNG TIN PHIẾU NHẬP MỚI" Visible="False"></asp:Label>
                </strong></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblSoPN" runat="server" Text="Số phiếu nhập:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtSoPN" runat="server" Visible="False"></asp:TextBox>
                <asp:Label ID="lblMaNV" runat="server" Text="Mã nhân viên:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtMaNV" runat="server" Visible="False"></asp:TextBox>
                <asp:Label ID="lblMaNCC" runat="server" Text="Mã nhà cung cấp:" Visible="False"></asp:Label>
                <asp:TextBox ID="txtMaNCC" runat="server" Visible="False"></asp:TextBox>
                <br />
                <asp:Label ID="lblNgayNhap" runat="server" Text="Ngày nhập:" Visible="False"></asp:Label>
                <asp:Calendar ID="CalendarNgayNhap" runat="server" Visible="False"></asp:Calendar>
            </td>
        </tr>
        <tr>
            <td>
                <p class="auto-style4">
                    <asp:GridView ID="GridViewTPN" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="MaSP,SoPN" DataSourceID="SqlDataSource_allPN" GridLines="Horizontal" Caption="DANH SÁCH CHI TIẾT PHIẾU NHẬP CỦA HASAKI" Font-Bold="False" Width="704px">
                        <Columns>
                            <asp:BoundField DataField="MaSP" HeaderText="Mã sản phẩm" ReadOnly="True" SortExpression="MaSP" />
                            <asp:BoundField DataField="SoPN" HeaderText="Số phiếu nhập" SortExpression="SoPN" ReadOnly="True" />
                            <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" SortExpression="SoLuong" />
                            <asp:BoundField DataField="GiaNhap" HeaderText="Giá nhập" SortExpression="GiaNhap" DataFormatString="{0:0,000}" />
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
                    <asp:SqlDataSource ID="SqlDataSource_allPN" runat="server" ConnectionString="<%$ ConnectionStrings:WebHasakiConnectionString %>" SelectCommand="SELECT * FROM [CTPhieuNhap] WHERE ([SoPN] = @SoPN)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="dgvPN" Name="SoPN" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </p>
            </td>
        </tr>
    </table>
</asp:Content>
