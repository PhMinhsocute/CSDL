<%@ Page Title="" Language="C#" MasterPageFile="~/MasterHasaki.Master" AutoEventWireup="true" CodeBehind="FormGioHang.aspx.cs" Inherits="_23_WebHasaki_5701.FormGioHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style46 {
            margin-right: 0px;
        }
        .auto-style47 {
            font-size: medium;
            color: #FFFFFF;
            font-weight: bold;
            background-color: #006600;
        }
        .auto-style48 {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style8">
                <asp:Label ID="lblTitle" runat="server"></asp:Label>
                <br />
                <asp:Label ID="lblSum" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="dgvGioHang" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="auto-style46" OnRowCancelingEdit="dgvGioHang_RowCancelingEdit" OnRowDeleting="dgvGioHang_RowDeleting" OnRowEditing="dgvGioHang_RowEditing" OnRowUpdating="dgvGioHang_RowUpdating" Width="1226px">
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
            </td>
        </tr>
        <tr>
            <td>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style48"><strong>
                            <asp:Button ID="btnDatHang" runat="server" BackColor="#006600" CssClass="auto-style47" Height="47px" OnClick="btnDatHang_Click1" Text="Đặt Hàng" Width="182px" />
                            </strong></td>
                        <td><strong>
                            <asp:Button ID="btnHuy" runat="server" BackColor="#006600" CssClass="auto-style47" Height="47px" OnClick="btnHuy_Click" Text="Hủy Giỏ Hàng " Width="182px" />
                            </strong></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
