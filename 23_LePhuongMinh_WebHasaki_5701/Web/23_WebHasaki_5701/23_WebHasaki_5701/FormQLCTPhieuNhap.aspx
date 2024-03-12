<%@ Page Title="" Language="C#" MasterPageFile="~/QuanLy.Master" AutoEventWireup="true" CodeBehind="FormQLCTPhieuNhap.aspx.cs" Inherits="_23_WebHasaki_5701.FormQLCTPhieuNhap" %>
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
            height: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td>
                <h3 class="auto-style6"><em>
                    <asp:Label ID="Label7" runat="server" CssClass="auto-style13" Text="CHÀO MỪNG BẠN ĐẾN VỚI TRANG QUẢN LÝ CHI TIẾT PHIẾU NHẬP"></asp:Label>
                    </em></h3>
            </td>
        </tr>
        <tr>
            <td class="auto-style15"><strong>
                <asp:Label ID="Label8" runat="server" CssClass="auto-style14" Text="[1] THÔNG TIN CHI TIẾT PHIẾU NHẬP"></asp:Label>
                </strong></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Text="Nhập thông tin chi tiết phiếu nhập:"></asp:Label>
                <asp:TextBox ID="txtTimCTPN" runat="server"></asp:TextBox>
                <asp:Button ID="btnTimCTPN" runat="server" OnClick="btnTimCTPN_Click" Text="Tìm CTPN" />
                <asp:Button ID="btnHuy" runat="server" Text="Hủy" OnClick="btnHuy_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="dgvCTPN" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MaSP,SoPN" DataSourceID="SqlDataSource_qlCTPN" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="MaSP" HeaderText="Mã sản phẩm" ReadOnly="True" SortExpression="MaSP" />
                        <asp:BoundField DataField="SoPN" HeaderText="Số phiếu nhập" ReadOnly="True" SortExpression="SoPN" />
                        <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" SortExpression="SoLuong" />
                        <asp:BoundField DataField="GiaNhap" DataFormatString="{0:0,000}" HeaderText="Giá nhập" SortExpression="GiaNhap" />
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
                <asp:SqlDataSource ID="SqlDataSource_qlCTPN" runat="server" ConnectionString="<%$ ConnectionStrings:WebHasakiConnectionString %>" DeleteCommand="DELETE FROM CTPhieuNhap WHERE (MaSP = @MaSP) OR (SoPN = @SoPN)" InsertCommand="INSERT INTO CTPhieuNhap(MaSP, SoPN, SoLuong, GiaNhap) VALUES (@MaSP, @SoPN, @SoLuong, @GiaNhap)" SelectCommand="SELECT MaSP, SoPN, SoLuong, GiaNhap
FROM CTPhieuNhap 
WHERE (([SoPN] LIKE '%' + @SoPN +'%') OR ([MaSP] LIKE '%' + @MaSP + '%'))
" UpdateCommand="UPDATE CTPhieuNhap SET SoLuong = @SoLuong, GiaNhap = @GiaNhap WHERE (MaSP = @MaSP) AND (SoPN = @SoPN)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="dgvCTPN" Name="MaSP" PropertyName="SelectedValue[0]" />
                        <asp:ControlParameter ControlID="dgvCTPN" Name="SoPN" PropertyName="SelectedValue[1]" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtMaSP" Name="MaSP" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtSoPN" Name="SoPN" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtSL" Name="SoLuong" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtGiaNhap" Name="GiaNhap" PropertyName="Text" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtTimCTPN" Name="MaSP" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtTimCTPN" Name="SoPN" PropertyName="Text" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="dgvCTPN" Name="SoLuong" PropertyName="SelectedValue[2]" />
                        <asp:ControlParameter ControlID="dgvCTPN" Name="GiaNhap" PropertyName="SelectedValue[3]" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td><strong>
                <asp:Label ID="lblTTCTPNnew" runat="server" CssClass="auto-style14" Text="[2] THÔNG TIN CHI TIẾT PHIẾU NHẬP MỚI" Visible="False"></asp:Label>
                </strong></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblMaSP" runat="server" Text="Mã sản phẩm:" Visible="False"></asp:Label>
                <br />
                <asp:TextBox ID="txtMaSP" runat="server" Visible="False"></asp:TextBox>
                <br />
                <asp:Label ID="lblSoPN" runat="server" Text="Số phiếu nhập:" Visible="False"></asp:Label>
                <br />
                <asp:TextBox ID="txtSoPN" runat="server" Visible="False"></asp:TextBox>
                <br />
                <asp:Label ID="lblSL" runat="server" Text="Số lượng:" Visible="False"></asp:Label>
                <br />
                <asp:TextBox ID="txtSL" runat="server" Visible="False"></asp:TextBox>
                <br />
                <asp:Label ID="lblGiaNhap" runat="server" Text="Giá nhập:" Visible="False"></asp:Label>
                <br />
                <asp:TextBox ID="txtGiaNhap" runat="server" Visible="False"></asp:TextBox>
            </td>
        </tr>
        </table>
</asp:Content>
