using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _23_WebHasaki_5701
{
    public partial class FormDangNhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login_Authenticate(object sender, AuthenticateEventArgs e)
        {
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            if ((Login1.UserName == "Admin" && Login1.Password == "12345"))
            {

                e.Authenticated = true;
                // Đăng nhập thành công, tự động chuyển đến trang trong Logiql.DestinationPageURL đã gán(tức là FormQLNhanVien.aspx)
                Session["dn"] = Login1.UserName as string;
                Response.Redirect("~\\FormQLNhanVien.aspx");
                //Gửi tên Account đã đăng nhập thành công sang các trang quản lý
                // LoginNameNV.
            }
            else if (Login1.UserName == "User" && Login1.Password == "12345")
            {
                e.Authenticated = true;
                // Đăng nhập thành công, tự động chuyển đến trang trong Logiql.DestinationPageURL đã gán(tức là FormGioHang.aspx)
                Session["dn"] = Login1.UserName as string;
                Response.Redirect("~\\FormGioHang.aspx");
                //Gửi tên Account đã đăng nhập thành công sang 
            }
            else
            {
                e.Authenticated = false;// Đăng nhập ko thành công
            }
        }
    }
}