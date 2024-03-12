<%@ Page Title="" Language="C#" MasterPageFile="~/MasterHasaki.Master" AutoEventWireup="true" CodeBehind="FormDangNhap.aspx.cs" Inherits="_23_WebHasaki_5701.FormDangNhap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style46 {
            width: 297px;
        }
        .auto-style47 {
            text-align: center;
            width: 465px;
        }
        .auto-style48 {
            font-size: x-large;
            color: #006600;
        }
        .auto-style54 {
            width: 486px;
            text-align: left;
        }
        .auto-style55 {
            font-size: medium;
        }
        .auto-style56 {
            width: 322px;
        }
        .auto-style57 {
            height: 20px;
        }
        .auto-style58 {
            width: 322px;
            height: 34px;
        }
        .auto-style59 {
            width: 486px;
            height: 34px;
            text-align: left;
        }
        .auto-style60 {
            width: 100%;
            height: 303px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style60">
        <tr>
            <td class="auto-style46">&nbsp;</td>
            <td class="auto-style47">
                <asp:Login ID="Login1" runat="server" BackColor="#F7ECDE" BorderColor="Black" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" OnAuthenticate="Login1_Authenticate" Width="525px">
                    <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                    <LayoutTemplate>
                        <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                            <tr>
                                <td>
                                    <table cellpadding="0">
                                        <tr>
                                            <td align="center" colspan="2" style="font-family: 'Courier New', Courier, monospace"><span class="auto-style48"><strong>ĐĂNG NHẬP</strong></span> </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="auto-style58" style="font-family: Arial, Helvetica, sans-serif">
                                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" CssClass="auto-style55">Tên người dùng:</asp:Label>
                                            </td>
                                            <td class="auto-style59">
                                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="auto-style56" style="font-family: Arial, Helvetica, sans-serif">
                                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" CssClass="auto-style55">Mật khẩu:</asp:Label>
                                            </td>
                                            <td class="auto-style54">
                                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:CheckBox ID="RememberMe" runat="server" CssClass="auto-style16" Text="Lưu mật khẩu cho lần sau:" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" class="auto-style57" colspan="2" style="color:Red;">
                                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" colspan="2">
                                                <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Đăng nhập" ValidationGroup="Login1" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
                    <TextBoxStyle Font-Size="0.8em" />
                    <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
                </asp:Login>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
