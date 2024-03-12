using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _23_WebHasaki_5701
{
    public partial class FormQLHoaDon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnTimHD_Click(object sender, EventArgs e)
        {
            btnHuy.Visible = true;// cho phéo hùy tìm lại = tìm HD khác
            if (btnTimHD.Text.Trim() == "Tìm HD") //[1] Tìm HD
            {
                // dgvPN.DataBind();
                if (dgvHD.Rows.Count < 1)
                {
                    btnTimHD.Text = "Thêm HD mới";

                }
                else // tìm thấy ít nhất 1 PN => chọn PN
                {
                    btnTimHD.Text = "Chọn HD";
                    if (dgvHD.Rows.Count > 1)
                    {
                        btnTimHD.Enabled = false;
                        btnTimHD.ToolTip = "Hãy chọn 1 HD trong ds dưới";
                    }
                    else btnTimHD.Enabled = true;
                }
            }
            else if (btnTimHD.Text == "Thêm HD mới") //[2] Nếu chưa có PN thì thêm PN mới
            {
                //2.1. Hiển thị các ô nhập thông tin PN mới
                lblTTHDnew.Visible = true;
                lblMaHD.Visible = true;
                txtMaHD.Visible = true;
                lblMaNV.Visible = true;
                txtMaNV.Visible = true;
                lblMaKH.Visible = true;
                txtMaKH.Visible = true;
                lblNgayBan.Visible = true;
                Calendar1.Visible = true;
                lblGhiChu.Visible = true;
                txtGhiChu.Visible = true;
                // 2.2 Xóa trốn các ô textbox để chuẩn bị nhập PN mới
                //txtSoPN.Text = txtTimPN.Text.Trim(); // lấy thông tin nhập trong txtTimPN không tim thấy
                txtMaHD.ToolTip = "KHÔNG  ĐỂ  TRỐNG mã hóa đơn,  KHÔNG  NHẬP  TRÙNG";
                txtMaNV.Text = "";
                txtMaNV.Text = "";
                txtMaKH.Text = "";
                //2.3 Đổi nhãn nút lệnh:"Lưu thông tin HD"
                btnTimHD.Text = "Lưu HD mới";
            }
            else if (btnTimHD.Text == "Lưu HD mới")//[3] Lưu thông tin HD mới
            {
                try
                {
                    // 3.1 Lưu thông tin PN mới đã nhập vào DB
                    this.Title = "Thêm mã hóa đơn mới thành công"; // thông báo
                    SqlDataSource_qlHD.Insert(); // Thêm thông tin HD mới
                    txtTimHD.Text = txtMaHD.Text.Trim();
                    // 3.2 Tải HD mới lên
                    dgvHD.DataBind();
                }
                catch (Exception ex)
                {
                    this.Title = "Lỗi thêm hóa đơn mới = " + ex.Message;
                }
                // 3.3 ẩn các ô nhập thông tin HD mới
                lblTTHDnew.Visible = false;
                lblMaHD.Visible = false;
                txtMaHD.Visible = false;
                lblMaNV.Visible = false;
                txtMaNV.Visible = false;
                lblMaKH.Visible = false;
                txtMaKH.Visible = false;
                lblNgayBan.Visible = false;
                Calendar1.Visible = false;
                lblGhiChu.Visible = false;
                txtGhiChu.Visible = false;
                //3.4 Đôi nhãn => chọn PN
                btnTimHD.Text = "Chọn HD";
            }
            else if (btnTimHD.Text == "Chọn HD")
            {
                //4.1 Gán mã PN đang chọn vào ô text Tim
                //txtTimHD.Text = txtMaHD.Text.Trim();
                dgvHD.DataBind();
                //4.2 không chọn lại
                btnTimHD.Enabled = false;
                txtTimHD.Enabled = false;
                //4.3 Hiện CTPN
                dgvCTHD.DataBind();
                dgvCTHD.Visible = true;
            }
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            // 1. Cho quay lại
            btnTimHD.Enabled = true;
            txtTimHD.Enabled = true;
            btnTimHD.Text = "Tìm HD";
            // 2. Ẩn các ô nhập thông tin HD mới 
            lblTTHDnew.Visible = false;
            lblTTHDnew.Visible = false;
            lblMaHD.Visible = false;
            txtMaHD.Visible = false;
            lblMaNV.Visible = false;
            txtMaNV.Visible = false;
            lblMaKH.Visible = false;
            txtMaKH.Visible = false;
            lblNgayBan.Visible = false;
            Calendar1.Visible = false;
            lblGhiChu.Visible = false;
            txtGhiChu.Visible = false;
            // 3. Xóa trống textbox nhập thông tin tìm, để nhập lại 
            txtTimHD.Text = "";
            // 4. Tải lại
            dgvHD.DataBind();
            //GridViewTPN.DataBind();
            //5 Ấn chỉnh nút "Hủy tìm PN"
            btnTimHD.Visible = true;
        }
    }
}