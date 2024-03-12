using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _23_WebHasaki_5701
{
    public partial class FormQLPhieuNhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnTimPN_Click(object sender, EventArgs e)
        {
            btnHuy.Visible = true;// cho phéo hùy tìm lại = tìm PN khác
            if (btnTimPN.Text.Trim() == "Tìm PN") //[1] Tìm PN
            {
               // dgvPN.DataBind();
                if (dgvPN.Rows.Count < 1)
                {
                    btnTimPN.Text = "Thêm PN mới";

                }
                else // tìm thấy ít nhất 1 PN => chọn PN
                {
                    btnTimPN.Text = "Chọn PN";
                    if (dgvPN.Rows.Count > 1)
                    {
                        btnTimPN.Enabled = false;
                        btnTimPN.ToolTip = "Hãy chọn 1 PN trong ds dưới";
                    }
                    else btnTimPN.Enabled = true;
                }
            }
            else if (btnTimPN.Text == "Thêm PN mới") //[2] Nếu chưa có PN thì thêm PN mới
            {
                //2.1. Hiển thị các ô nhập thông tin PN mới
                lblTTPNnew.Visible = true;
                lblSoPN.Visible = true;
                txtSoPN.Visible=true;
                lblMaNV.Visible = true;
                txtMaNV.Visible = true;
                lblMaNCC.Visible = true;
                txtMaNCC.Visible = true;
                lblNgayNhap.Visible = true;
                CalendarNgayNhap.Visible = true;
                // 2.2 Xóa trốn các ô textbox để chuẩn bị nhập PN mới
                txtSoPN.Text = txtTimPN.Text.Trim(); // lấy thông tin nhập trong txtTimPN không tim thấy
                txtSoPN.ToolTip = "KHÔNG  ĐỂ  TRỐNG  số phiếu nhập,  KHÔNG  NHẬP  TRÙNG";
                txtMaNV.Text = "";
                txtMaNCC.Text = "";
                //2.3 Đổi nhãn nút lệnh:"Lưu thông tin PN"
                btnTimPN.Text = "Lưu PN mới";
            }
            else if (btnTimPN.Text == "Lưu PN mới")//[3] Lưu thông tin PN mới
            {
                try
                {
                    // 3.1 Lưu thông tin PN mới đã nhập vào DB
                    this.Title = "Thêm số phiếu nhập mới thành công"; // thông báo
                    SqlDataSource_qlPN.Insert(); // Thêm thông tin PN mới
                    txtTimPN.Text = txtSoPN.Text.Trim();
                    // 3.2 Tải PN mới lên
                    dgvPN.DataBind();
                }
                catch (Exception ex)
                {
                    this.Title = "Lỗi thêm phiếu nhập mới = " + ex.Message;
                }
                // 3.3 ẩn các ô nhập thông tin PN mới
                lblTTPNnew.Visible = false;
                lblSoPN.Visible = false;
                txtSoPN.Visible = false;
                lblMaNV.Visible = false;
                txtMaNV.Visible = false;
                lblMaNCC.Visible = false;
                txtMaNCC.Visible = false;
                lblNgayNhap.Visible = false;
                CalendarNgayNhap.Visible = false;
                //3.4 Đôi nhãn => chọn PN
                btnTimPN.Text = "Chọn PN";
            }
            else if (btnTimPN.Text == "Chọn PN")
            {
                //4.1 Gán mã PN đang chọn vào ô text Tim
                txtTimPN.Text = txtSoPN.Text.Trim();
                dgvPN.DataBind();
                //4.2 không chọn lại
                btnTimPN.Enabled = false;
                txtTimPN.Enabled = false;
                //4.3 Hiện CTPN
                //lblDSCTPN.Visible= true;

            }
        }

        protected void SqlDataSource_qlPN_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            // 1. Cho quay lại
            btnTimPN.Enabled = true;
            txtTimPN.Enabled = true;
            btnTimPN.Text = "Tìm PN";
            // 2. Ẩn các ô nhập thông tin PN mới 
            lblTTPNnew.Visible = false;
            lblSoPN.Visible = false;
            txtSoPN.Visible = false;
            lblMaNV.Visible = false;
            txtMaNV.Visible = false;
            lblMaNCC.Visible = false;
            txtMaNCC.Visible = false;
            lblNgayNhap.Visible = false;
            CalendarNgayNhap.Visible= false;
            // 3. Xóa trống textbox nhập thông tin tìm, để nhập lại 
            txtTimPN.Text = "";
            // 4. Tải lại
            dgvPN.DataBind();
            GridViewTPN.DataBind();
            //5 Ấn chỉnh nút "Hủy tìm PN"
            btnTimPN.Visible = true;
        }

        protected void btnLoad_Click(object sender, EventArgs e)
        {
            dgvPN.DataBind();
            GridViewTPN.DataBind();
        }
    }
}