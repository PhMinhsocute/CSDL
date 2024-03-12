using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _23_WebHasaki_5701
{
    public partial class FormQLNhaCungCap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnTimNCC_Click(object sender, EventArgs e)
        {
            btnHuy.Visible = true;// cho phéo hùy tìm lại = tìm KH khác
            if (btnTimNCC.Text.Trim() == "Tìm NCC") //[1] Tìm KH
            {
                dgvNCC.DataBind();
                if (dgvNCC.Rows.Count < 1)
                {
                    btnTimNCC.Text = "Thêm NCC mới";

                }
                else // tìm thấy ít nhất 1 NV => chọn NV
                {
                    btnTimNCC.Text = "Chọn NCC";
                    if (dgvNCC.Rows.Count > 1)
                    {
                        btnTimNCC.Enabled = false;
                        btnTimNCC.ToolTip = "Hãy chọn 1 NCC trong ds dưới";
                    }
                    else btnTimNCC.Enabled = true;
                }
            }
            else if (btnTimNCC.Text == "Thêm NCC mới") //[2] Nếu chưa có NV thì thêm NV mới
            {
                //2.1. Hiển thị các ô nhập thông tin NCC mới
                lblTTNCCnew.Visible = true;
                lblMaNCC.Visible = true;
                txtMaNCC.Visible = true;
                lblTenNCC.Visible = true;
                txtTenNCC.Visible = true;
                lblDiaChi.Visible = true;
                txtDiaChi.Visible = true;
                lblSDT.Visible = true;
                txtSDT.Visible = true;
                // 2.2 Xóa trốn các ô textbox để chuẩn bị nhập NCC mới
                txtMaNCC.Text = txtTimNCC.Text.Trim(); // lấy thông tin nhập trong txtTimKH không timg thấy
                txtMaNCC.ToolTip = "KHÔNG  ĐỂ  TRỐNG  mã nhà cung cấp,  KHÔNG  NHẬP  TRÙNG";
                txtTenNCC.Text = "";
                txtDiaChi.Text = "";
                txtSDT.Text = "";
                //2.3 Đổi nhãn nút lệnh:"Lưu thông tin KH"
                btnTimNCC.Text = "Lưu NCC mới";
            }
            else if (btnTimNCC.Text == "Lưu NCC mới")//[3] Lưu thông tin KH mới
            {
                try
                {
                    // 3.1 Lưu thông tin NCC mới đã nhập vào DB
                    this.Title = "Thêm nhà cung cấp mới thành công"; // thông báo
                    SqlDataSource_qlNCC.Insert(); // Thêm thông tin NCC mới
                    txtTimNCC.Text = txtMaNCC.Text.Trim();
                    // 3.2 Tải NCC mới lên
                    dgvNCC.DataBind();
                }
                catch (Exception ex)
                {
                    this.Title = "Lỗi thêm nhà cung cấp mới = " + ex.Message;
                }
                // 3.3 ẩn các ô nhập thông tin NCC mới
                lblTTNCCnew.Visible = false;
                lblMaNCC.Visible = false;
                txtMaNCC.Visible = false;
                lblTenNCC.Visible = false;
                txtTenNCC.Visible = false;
                lblDiaChi.Visible = false;
                txtDiaChi.Visible = false;
                lblSDT.Visible = false;
                txtSDT.Visible = false;
                //3.4 ĐÔi nhãn => chọn KH
                btnTimNCC.Text = "Chọn NCC";
            }
            else if (btnTimNCC.Text == "Chọn NCC")
            {
                //4.1 Gán mã KH đang chọn vào ô text Tim
                txtTimNCC.Text = txtMaNCC.Text.Trim();
                dgvNCC.DataBind();
                //4.2 không chọn lại
                btnTimNCC.Enabled = false;
                txtTimNCC.Enabled = false;
            }
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            // 1. Cho quay lại
            btnTimNCC.Enabled = true;
            txtTimNCC.Enabled = true;
            btnTimNCC.Text = "Tìm NCC";
            // 2. Ẩn các ô nhập thông tin KH mới 
            lblTTNCCnew.Visible = false;
            lblMaNCC.Visible = false;
            txtMaNCC.Visible = false;
            lblTenNCC.Visible = false;
            txtTenNCC.Visible = false;
            lblDiaChi.Visible = false;
            txtDiaChi.Visible = false;
            lblSDT.Visible = false;
            txtSDT.Visible = false;
            // 3. Xóa trống textbox nhập thông tin tìm, để nhập lại 
            txtTimNCC.Text = "";
            // 4. Tải lại
            dgvNCC.DataBind();
            //5 Ấn chỉnh nút "Hủy tìm NCC"
            btnTimNCC.Visible = true;
        }

        protected void btnLoad_Click(object sender, EventArgs e)
        {
            dgv_allNCC.DataBind();
        }
    }
}