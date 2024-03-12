using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _23_WebHasaki_5701
{
    public partial class FormQLCTPhieuNhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnTimCTPN_Click(object sender, EventArgs e)
        {
            btnHuy.Visible = true;
            if (btnTimCTPN.Text.Trim() == "Tìm CTPN") //[1] Tìm CTPN
            {
                //dgvCTPN.DataBind();
                if (dgvCTPN.Rows.Count < 1)
                {
                    btnTimCTPN.Text = "Thêm CTPN mới";

                }
                else 
                {
                    btnTimCTPN.Text = "Chọn CTPN";
                    if (dgvCTPN.Rows.Count > 1)
                    {
                        btnTimCTPN.Enabled = false;
                        btnTimCTPN.ToolTip = "Hãy chọn 1 CTPN trong ds dưới";
                    }
                    else btnTimCTPN.Enabled = true;
                }
            }
            else if (btnTimCTPN.Text == "Thêm CTPN mới") 
            {
                //2.1. Hiển thị các ô nhập thông tin
                lblTTCTPNnew.Visible = true;
                lblMaSP.Visible= true;
                txtMaSP.Visible= true;
                lblSoPN.Visible = true;
                txtSoPN.Visible = true;
                lblSL.Visible= true;
                txtSL.Visible= true;
                lblGiaNhap.Visible = true;
                txtGiaNhap.Visible = true;
               
                // 2.2 Xóa trốn các ô textbox để chuẩn bị nhập PN mới
                //txtSoPN.Text = txtTimCTPN.Text.Trim(); // lấy thông tin nhập trong txtTimPN không tim thấy
                txtSoPN.ToolTip = "KHÔNG  ĐỂ  TRỐNG  số phiếu nhập,  KHÔNG  NHẬP  TRÙNG";
                txtMaSP.ToolTip = "KHÔNG  ĐỂ  TRỐNG  mã sản phẩm,  KHÔNG  NHẬP  TRÙNG";
                txtSL.Text = "";
                txtGiaNhap.Text = "";
                //2.3 Đổi nhãn nút lệnh:"Lưu thông tin PN"
                btnTimCTPN.Text = "Lưu CTPN mới";
            }
            else if (btnTimCTPN.Text == "Lưu CTPN mới")//[3] Lưu thông tin PN mới
            {
                try
                {
                    // 3.1 Lưu thông tin PN mới đã nhập vào DB
                    this.Title = "Thêm chi tiết số phiếu nhập mới thành công"; // thông báo
                    SqlDataSource_qlCTPN.Insert(); // Thêm thông tin CTPN mới
                   // txtTimCTPN.Text = txtSoPN.Text.Trim();
                   // 3.2 Tải PN mới lên
                    dgvCTPN.DataBind();
                }
                catch (Exception ex)
                {
                    this.Title = "Lỗi thêm chi tiết phiếu nhập mới = " + ex.Message;
                }
                // 3.3 ẩn các ô nhập thông tin PN mới
                lblTTCTPNnew.Visible = false;
                lblMaSP.Visible = false;
                txtMaSP.Visible = false;
                lblSoPN.Visible = false;
                txtSoPN.Visible = false;
                lblSL.Visible = false;
                txtSL.Visible = false;
                lblGiaNhap.Visible = false;
                txtGiaNhap.Visible = false;
                //3.4 Đôi nhãn => chọn PN
                btnTimCTPN.Text = "Chọn CTPN";
            }
            else if (btnTimCTPN.Text == "Chọn CTPN")
            {
                //4.1 Gán mã CTPN đang chọn vào ô text Tim
                txtTimCTPN.Text = txtSoPN.Text.Trim();
                dgvCTPN.DataBind();
                //4.2 không chọn lại
                btnTimCTPN.Enabled = false;
                txtTimCTPN.Enabled = false;
            }
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            // 1. Cho quay lại
            btnTimCTPN.Enabled = true;
            txtTimCTPN.Enabled = true;
            btnTimCTPN.Text = "Tìm CTPN";
            // 2. Ẩn các ô nhập thông tin PN mới 
            lblTTCTPNnew.Visible = false;
            lblMaSP.Visible = false;
            txtMaSP.Visible = false;
            lblSoPN.Visible = false;
            txtSoPN.Visible = false;
            lblSL.Visible = false;
            txtSL.Visible = false;
            lblGiaNhap.Visible = false;
            txtGiaNhap.Visible = false;
            // 3. Xóa trống textbox nhập thông tin tìm, để nhập lại 
            txtTimCTPN.Text = "";
            // 4. Tải lại
            dgvCTPN.DataBind();
            //GridViewTPN.DataBind();
            //5 Ấn chỉnh nút "Hủy tìm PN"
            btnTimCTPN.Visible = true;
        }
    }
}