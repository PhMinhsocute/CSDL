using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _23_WebHasaki_5701
{
    public partial class FormQLCTHoaDon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnTimCTHD_Click(object sender, EventArgs e)
        {
            btnHuy.Visible = true;
            if (btnTimCTHD.Text.Trim() == "Tìm CTHD") 
            {
                //dgvCTPN.DataBind();
                if (dgvCTHD.Rows.Count < 1)
                {
                    btnTimCTHD.Text = "Thêm CTHD mới";

                }
                else 
                {
                    btnTimCTHD.Text = "Chọn CTHD";
                    if (dgvCTHD.Rows.Count > 1)
                    {
                        btnTimCTHD.Enabled = false;
                        btnTimCTHD.ToolTip = "Hãy chọn 1 CTHD trong ds dưới";
                    }
                    else btnTimCTHD.Enabled = true;
                }
            }
            else if (btnTimCTHD.Text == "Thêm CTHD mới") 
            {
              
                lblTTCTHDnew.Visible = true;
                lblMaHD.Visible = true;
                txtMaHD.Visible = true;
                lblMaSP.Visible = true;
                txtMaSP.Visible = true;
                lblSL.Visible = true;
                txtSL.Visible = true;
                lblDG.Visible = true;
                txtDG.Visible = true;
                // 2.2 Xóa trốn các ô textbox để chuẩn bị nhập
              
                txtMaHD.ToolTip = "KHÔNG  ĐỂ  TRỐNG  mã hóa đơn,  KHÔNG  NHẬP  TRÙNG";
                txtMaSP.ToolTip = "KHÔNG  ĐỂ  TRỐNG  mã sản phẩm,  KHÔNG  NHẬP  TRÙNG";
                txtSL.Text = "";
                txtDG.Text = "";

                //2.3 Đổi nhãn nút lệnh:"Lưu thông tin CTHD"
                btnTimCTHD.Text = "Lưu CTHD mới";
            }
            else if (btnTimCTHD.Text == "Lưu CTHD mới")//[3] Lưu thông tin CTHD mới
            {
                try
                {
                    // 3.1 Lưu thông tin
                    this.Title = "Thêm chi tiết hóa đơn nhập mới thành công"; // thông báo
                    SqlDataSource_qlCTHD.Insert(); // Thêm thông tin CTPN mới
                    txtTimCTHD.Text = txtMaHD.Text.Trim();
                                                   
                    dgvCTHD.DataBind();
                }
                catch (Exception ex)
                {
                    this.Title = "Lỗi thêm chi tiết hóa đơn mới = " + ex.Message;
                }
                // 3.3 ẩn các ô nhập thông tin CTHD mới
                lblTTCTHDnew.Visible = false;
                lblMaHD.Visible = false;
                txtMaHD.Visible = false;
                lblMaSP.Visible = false;
                txtMaSP.Visible = false;
                lblSL.Visible = false;
                txtSL.Visible = false;
                lblDG.Visible = false;
                txtDG.Visible = false;
                //3.4 Đôi nhãn => chọn CTHD
                btnTimCTHD.Text = "Chọn CTHD";
            }
            else if (btnTimCTHD.Text == "Chọn CTHD")
            {
                //4.1 Gán mã CTPN đang chọn vào ô text Tim
                txtTimCTHD.Text = txtMaHD.Text.Trim();
                dgvCTHD.DataBind();
                //4.2 không chọn lại
                btnTimCTHD.Enabled = false;
                txtTimCTHD.Enabled = false;
            }
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            // 1. Cho quay lại
            btnTimCTHD.Enabled = true;
            txtTimCTHD.Enabled = true;
            btnTimCTHD.Text = "Tìm CTHD";
            // 2. Ẩn các ô nhập thông tin PN mới 
            lblTTCTHDnew.Visible = false;
            lblMaHD.Visible = false;
            txtMaHD.Visible = false;
            lblMaSP.Visible = false;
            txtMaSP.Visible = false;
            lblSL.Visible = false;
            txtSL.Visible = false;
            lblDG.Visible = false;
            txtDG.Visible = false;
            // 3. Xóa trống textbox nhập thông tin tìm, để nhập lại 
            txtTimCTHD.Text = "";
            // 4. Tải lại
            dgvCTHD.DataBind();
            //GridViewTPN.DataBind();
            //5 Ấn chỉnh nút "Hủy tìm PN"
            btnTimCTHD.Visible = true;
        }
    }
}