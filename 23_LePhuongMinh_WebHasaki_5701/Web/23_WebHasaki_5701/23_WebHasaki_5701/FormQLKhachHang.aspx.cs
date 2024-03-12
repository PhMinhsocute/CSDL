using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _23_WebHasaki_5701
{
    public partial class FormQLKhachHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnTimKH_Click(object sender, EventArgs e)
        {
            btnHuy.Visible = true;// cho phéo hùy tìm lại = tìm KH khác
            if (btnTimKH.Text.Trim() == "Tìm KH") //[1] Tìm KH
            {
                dgvKH.DataBind();
                if (dgvKH.Rows.Count < 1)
                {
                    btnTimKH.Text = "Thêm KH mới";

                }
                else // tìm thấy ít nhất 1 NV => chọn NV
                {
                    btnTimKH.Text = "Chọn KH";
                    if (dgvKH.Rows.Count > 1)
                    {
                        btnTimKH.Enabled = false;
                        btnTimKH.ToolTip = "Hãy chọn 1 KH trong ds dưới";
                    }
                    else btnTimKH.Enabled = true;
                }
            }
            else if (btnTimKH.Text == "Thêm KH mới") //[2] Nếu chưa có NV thì thêm NV mới
            {
                //2.1. Hiển thị các ô nhập thông tin KH mới
                lblTTKHnew.Visible = true;
                lblMaKH.Visible = true;
                txtMaKH.Visible = true;
                lblTenKH.Visible = true;
                txtTenKH.Visible = true;
                lblSDT.Visible = true;
                txtSDT.Visible = true;
                lblEmail.Visible = true;
                txtEmail.Visible = true;
                // 2.2 Xóa trốn các ô textbox để chuẩn bị nhập KH mới
                txtMaKH.Text = txtTimKH.Text.Trim(); // lấy thông tin nhập trong txtTimKH không timg thấy
                txtMaKH.ToolTip = "KHÔNG  ĐỂ  TRỐNG  mã khách hàng,  KHÔNG  NHẬP  TRÙNG";
                txtTenKH.Text = "";
                txtSDT.Text = "";
                txtEmail.Text = "";
                //2.3 Đổi nhãn nút lệnh:"Lưu thông tin KH"
                btnTimKH.Text = "Lưu KH mới";
            }
            else if (btnTimKH.Text == "Lưu KH mới")//[3] Lưu thông tin KH mới
            {
                try
                {
                    // 3.1 Lưu thông tin NV mới đã nhập vào DB
                    this.Title = "Thêm khách hàng mới thành công"; // thông báo
                    SqlDataSource_qlKH.Insert(); // Thêm thông tin KH mới
                    txtTimKH.Text = txtMaKH.Text.Trim();
                    // 3.2 Tải NV mới lên
                    dgvKH.DataBind();
                }
                catch (Exception ex)
                {
                    this.Title = "Lỗi thêm khách hàng mới = " + ex.Message;
                }
                // 3.3 ẩn các ô nhập thông tin KH mới
                lblTTKHnew.Visible = false;
                lblMaKH.Visible = false;
                txtMaKH.Visible = false;
                lblTenKH.Visible = false;
                txtTenKH.Visible = false;
                lblSDT.Visible = false;
                txtSDT.Visible = false;
                lblEmail.Visible = false;
                txtEmail.Visible = false;
                //3.4 ĐÔi nhãn => chọn KH
                btnTimKH.Text = "Chọn KH";
            }
            else if (btnTimKH.Text == "Chọn KH")
            {
                //4.1 Gán mã KH đang chọn vào ô text Tim
                txtTimKH.Text = txtMaKH.Text.Trim();
                dgvKH.DataBind();
                //4.2 không chọn lại
                btnTimKH.Enabled = false;
                txtTimKH.Enabled = false;
            }
        }

        protected void btnLoad_Click(object sender, EventArgs e)
        {
            dgv_allKH.DataBind();
            dgv_allKH.Visible = true;
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            // 1. Cho quay lại
            btnTimKH.Enabled = true;
            txtTimKH.Enabled = true;
            btnTimKH.Text = "Tìm KH";
            // 2. Ẩn các ô nhập thông tin KH mới 
            lblTTKHnew.Visible = false;
            lblMaKH.Visible = false;
            txtMaKH.Visible = false;
            lblTenKH.Visible = false;
            txtTenKH.Visible = false;
            lblSDT.Visible = false;
            txtSDT.Visible = false;
            lblEmail.Visible = false;
            txtEmail.Visible = false;
            // 3. Xóa trống textbox nhập thông tin tìm, để nhập lại 
            txtTimKH.Text = "";
            // 4. Tải lại
            dgvKH.DataBind();
            //5 Ấn chỉnh nút "Hủy tìm KH"
            btnTimKH.Visible = true;
        }
    }
}