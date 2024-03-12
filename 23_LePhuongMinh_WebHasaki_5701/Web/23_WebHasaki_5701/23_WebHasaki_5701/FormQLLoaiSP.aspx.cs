using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _23_WebHasaki_5701
{
    public partial class FormQLLoaiSP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnTimLoai_Click(object sender, EventArgs e)
        {
            btnHuy.Visible = true;// cho phéo hùy tìm lại = tìm PN khác
            if (btnTimLoai.Text.Trim() == "Tìm LoaiSP") //[1] Tìm PN
            {
                //dgvCTPN.DataBind();
                if (dgvLoaiSP.Rows.Count < 1)
                {
                    btnTimLoai.Text = "Thêm LoaiSP mới";

                }
                else // tìm thấy ít nhất 1 CTHD => chọn CTHD
                {
                    btnTimLoai.Text = "Chọn LoaiSP";
                    if (dgvLoaiSP.Rows.Count > 1)
                    {
                        btnTimLoai.Enabled = false;
                        btnTimLoai.ToolTip = "Hãy chọn 1 LoaiSP trong ds dưới";
                    }
                    else btnTimLoai.Enabled = true;
                }
            }
            else if (btnTimLoai.Text == "Thêm LoaiSP mới") 
            {
                
                lblTTLSPnew.Visible = true;
                lblMaLoai.Visible = true;
                txtMaLoai.Visible = true;
                lblTenLoai.Visible = true;
                txtTenLoai.Visible = true;
                lblGhiChu.Visible = true;
                txtGhiChu.Visible = true;
                
                //txtSoPN.Text = txtTimCTPN.Text.Trim(); 
                txtMaLoai.ToolTip = "KHÔNG  ĐỂ  TRỐNG  loai san pham,  KHÔNG  NHẬP  TRÙNG";
                txtTenLoai.Text = "";
                txtGhiChu.Text = "";
                
                btnTimLoai.Text = "Lưu LoaiSP mới";
            }
            else if (btnTimLoai.Text == "Lưu LoaiSP mới")//[3] Lưu thông tin 
            {
                try
                {
                    // 3.1 Lưu thông tin  mới đã nhập vào DB
                    this.Title = "Thêm LOAI SP mới thành công"; // thông báo
                    SqlDataSource_CSLoai.Insert(); 
                    txtTimLoai.Text = txtMaLoai.Text.Trim();
                    // 3.2 Tải  mới lên
                    dgvCSLoai.DataBind();
                }
                catch (Exception ex)
                {
                    this.Title = "Lỗi thêm loai san pham mới = " + ex.Message;
                }
                // 3.3 ẩn các ô nhập thông tin 
                lblTTLSPnew.Visible = false;
                lblMaLoai.Visible = false;
                txtMaLoai.Visible = false;
                lblTenLoai.Visible = false;
                txtTenLoai.Visible = false;
                lblGhiChu.Visible = false;
                txtGhiChu.Visible = false;
                //3.4 Đôi nhãn 
                btnTimLoai.Text = "Chọn LoaiSP";
            }
            else if (btnTimLoai.Text == "Chọn LoaiSP")
            {
                //4.1 Gán mã CTPN đang chọn vào ô text Tim
                txtTimLoai.Text = txtMaLoai.Text.Trim();
                dgvCSLoai.DataBind();
                //4.2 không chọn lại
                btnTimLoai.Enabled = false;
                txtTimLoai.Enabled = false;
            }
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            // 1. Cho quay lại
            btnTimLoai.Enabled = true;
            txtTimLoai.Enabled = true;
            btnTimLoai.Text = "Tìm LoaiSP";
            // 2. Ẩn các ô nhập thông tin 
            lblTTLSPnew.Visible = false;
            lblMaLoai.Visible = false;
            txtMaLoai.Visible = false;
            lblTenLoai.Visible = false;
            txtTenLoai.Visible = false;
            lblGhiChu.Visible = false;
            txtGhiChu.Visible = false;
            dgvCSLoai.Visible=false;
            // 3. Xóa trống textbox nhập thông tin tìm, để nhập lại 
            txtTimLoai.Text = "";
            // 4. Tải lại
            dgvCSLoai.DataBind();
            //GridViewTPN.DataBind();
            //5 Ấn chỉnh nút "Hủy tìm PN"
            btnTimLoai.Visible = true;
            GridView1.Visible = false;
        }

        protected void btnDSLoai_Click(object sender, EventArgs e)
        {
            GridView1.Visible=true;
        }
    }
}