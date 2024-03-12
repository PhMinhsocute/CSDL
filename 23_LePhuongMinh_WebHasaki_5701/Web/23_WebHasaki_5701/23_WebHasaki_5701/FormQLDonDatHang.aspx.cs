using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _23_WebHasaki_5701
{
    public partial class FormQLDonDatHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            // 1. Cho quay lại
            btnTim.Enabled = true;
            txtTimDDH.Enabled = true;
            btnTim.Text = "Tìm DDH";
           
            // 3. Xóa trống textbox nhập thông tin tìm, để nhập lại 
            txtTimDDH.Text = "";
            // 4. Tải lại
            dgvDDH.DataBind();
            //GridViewTPN.DataBind();
            //5 Ấn chỉnh nút "Hủy tìm PN"
            btnTim.Visible = true;
        }
    }
}