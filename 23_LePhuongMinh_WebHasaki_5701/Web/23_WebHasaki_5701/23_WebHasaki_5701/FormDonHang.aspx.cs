using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _23_WebHasaki_5701
{
    public partial class FormDonHang : System.Web.UI.Page
    {
        static DataTable cart = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        static int pos = 0;//Vị  trí  chọn  KH
        protected void dgvKH_SelectedIndexChanged(object sender, EventArgs e)
        {
            pos = dgvKH.SelectedIndex;//xác  định  vị  trí  KH  được  chọn  trong  DS  tìm  thấy  (GridviewKH)
            txtMaKH.Text = txtTimKH.Text = dgvKH.Rows[pos].Cells[1].Text.Trim();//
            txtTimKH.Enabled = true;
        }
        protected void btnTim_Click(object sender, EventArgs e)
        {
            btnHuyKH.Visible = true;// cho phéo hùy tìm lại = tìm KH khác
            if (btnTim.Text.Trim() == "Tìm KH") //[1] Tìm KH
            {
                dgvKH.DataBind();
                if (dgvKH.Rows.Count < 1)
                {
                    btnTim.Text = "Thêm KH mới";

                }
                else // tìm thấy ít nhất 1 KH => chọn KH
                {
                    btnTim.Text = "Chọn KH";
                    if (dgvKH.Rows.Count > 1)
                    {
                        btnTim.Enabled = false;
                        btnTim.ToolTip = "Hãy chọn 1 KH trong ds dưới";
                    }
                    else btnTim.Enabled = true;
                }
            }
            else if (btnTim.Text == "Thêm KH mới") //[2] Nếu chưa có KH thì thêm KH mới
            {
                //2.1. Hiển thị các ô nhập thông tin KH mới
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
                txtMaKH.ToolTip = "KHÔNG  ĐỂ  TRỐNG  MÃ  KH,  KHÔNG  NHẬP  TRÙNG";
                txtTenKH.Text = "";
                txtSDT.Text = "";
                txtEmail.Text = "";
                //2.3 Đổi nhãn nút lệnh:"Lưu thông tin KH"
                btnTim.Text = "Lưu KH mới";
            }
            else if (btnTim.Text == "Lưu KH mới")//[3] Lưu thông tin KH mới
            {
                try
                {
                    // 3.1 Lưu thông tin KH mới đã nhập vào DB
                    SqlDataSource_TTKhachHang.Insert(); // Thêm thông tin KH mới
                    this.Title = "Thêm KH mới thành công"; // thông báo
                    txtTimKH.Text = txtMaKH.Text.Trim();// gám mã KH mới vào txtTimKH
                                                        // 3.2 Tải KH mới lên 
                    dgvKH.DataBind();
                }
                catch (Exception ex)
                {
                    this.Title = "Lỗi thêm KH mới = " + ex.Message;
                }
                // 3.3 ẩn các ô nhập thông tin KH mới
                lblMaKH.Visible = false;
                txtMaKH.Visible = false;
                lblTenKH.Visible = false;
                txtTenKH.Visible = false;
                lblSDT.Visible = false;
                txtSDT.Visible = false;
                lblEmail.Visible = false;
                txtEmail.Visible = false;
                //3.4 ĐÔi nhãn => chọn KH
                btnTim.Text = "Chọn KH";
            }
            else if (btnTim.Text == "Chọn KH")
            {
                //4.1 Gán mã KH đang chọn vào ô text Tim
                txtTimKH.Text = txtMaKH.Text.Trim();
                dgvKH.DataBind();
                //4.2 không chọn lại
                btnTim.Enabled = false;
                txtTimKH.Enabled = false;
                //4.3 Hiện thị thông tin "Đơn hàng"
                lblTTDH.Visible = true;
                lblTTMaDDH.Visible = true;
                lblMaDDH.Visible = true;
                DateTime t = System.DateTime.Now;
                lblMaDDH.Text = txtTimKH.Text.Trim() + t.Year.ToString().Substring(2, 2) + t.Month.ToString().Trim() + t.Day.ToString().Trim() + t.Hour.ToString().Trim() + t.Minute.ToString().Trim() + t.Second.ToString().Trim();
                lblTTNgayLap.Visible = true;
                lblNgayLap.Visible = true;
                lblNgayLap.Text = t.ToShortDateString();
                //4.3.2  Hiện  thị  thông  tin  "Giao  hàng"
                lblTTDCGiao.Visible = true;
                txtDCGiao.Visible = true;
                txtDCGiao.Text = "";
                lblNguoiNhan.Visible = true;
                txtNguoiNhan.Visible = true;
                txtNguoiNhan.Text = "";

                lblSDTNhan.Visible = true;
                txtSDTNhan.Visible = true;
                txtSDTNhan.Text = "";

                lblTTHanGiao.Visible = true;
                CalendarHanGiao.Visible = true;
                btnXacNhan.Visible = true;
                //4.3.3  Hiện  thị  thông  tin  CHI  TIẾT  "Đơn  hàng"
                lblCTDH.Visible = true;
                //B1:  LẤY  GIỎ  HÀNG  TỪ  Session  XUỐNG
                cart = Session["cart"] as DataTable;
                //B2:  GÁN  GIỎ  HÀNG  VÀO  GridViewMH  :    QUANG  TRỌNG  NHẤT
                dgvGioHang.Visible = true;
                dgvGioHang.DataSource = cart;
                //B3:  TẢI  DỮ  LIỆU  TỪ  tbl  LÊN  GridView
                dgvGioHang.DataBind();
                //B4:  TÍNH  TOÁN:  SỐ  LƯỢNG  MÓN  +  TỔNG  TIỀN
                lblSum.Visible = true;
                lblSum.Text = "GIỎ HÀNG HIỆN TẠI CỦA BẠN CÓ " + cart.Compute("Count(masp)", "").ToString() + " MÓN HÀNG " + "TỔNG TIỀN: " + cart.Compute("Sum(TT)", "").ToString() + "VND";

            }
        }

        protected void btnHuyKH_Click(object sender, EventArgs e)
        {
            // 1. Cho quay lại
            btnTim.Enabled = true;
            txtTimKH.Enabled = true;
            btnTim.Text = "Tìm KH";
            // 2. Ẩn các ô nhập thông tin KH mới 
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
            btnTim.Visible = false;
            // 6. HỦY "Đơn hàng"
            //6.1 Xóa và ẩn thông tin đơn hàng
            lblTTDH.Visible = false;
            lblTTMaDDH.Visible = false;
            lblMaDDH.Text = "";  //  Xóa  MaDDH
            lblMaDDH.Visible = false;
            lblTTNgayLap.Visible = false;
            lblNgayLap.Text = "";  //Xóa  ngày  lập
            lblNgayLap.Visible = false;
            //6.2  Xóa  và  ẩn  thông  tin  "Giao  hàng" 
            lblTTDCGiao.Visible = false;
            txtDCGiao.Visible = false;
            txtDCGiao.Text = "";
            lblNguoiNhan.Visible = false;
            txtNguoiNhan.Text = "";
            txtNguoiNhan.Visible = false;
            lblSDTNhan.Visible = false;
            txtSDTNhan.Text = "";
            txtSDTNhan.Visible = false;
            lblTTHanGiao.Visible = false;
            CalendarHanGiao.Visible = false;
            btnXacNhan.Visible = false;
            btnHuyDDH.Visible = false;
            btnThanhToan.Visible = false;
            //4.3.3  Ẩn thị  thông  tin  CHI  TIẾT  "Đơn  hàng"
            lblCTDH.Visible = false;
            dgvGioHang.Visible = false;
            dgvGioHang.DataSource = null;
            lblSum.Text = "";
            lblSum.Visible = false;
        }

        protected void btnXacNhan_Click(object sender, EventArgs e)
        {
            //1.  Khóa  các  ô  nhập  dữ  liệu  đơn  hàng  &  các  nút  lệnh  thay  đổi
            btnHuyKH.Enabled = false;  //không  hủy  tìm  ->  tìm  KH  khác  (chỉ  có  thể  Hủy  DDH)
            txtDCGiao.Enabled = false;  //khóa  các  ô  nhập  thông  tin  Đơn  hàng

            txtNguoiNhan.Enabled = false;
            txtSDTNhan.Enabled = false;

            CalendarHanGiao.Enabled = false;
            btnXacNhan.Enabled = false;  //Không  Xác  nhận  lại  Đơn  hàng  (chỉ  thực  hiện  1  lần)
            btnHuyDDH.Visible = true;  //có  thể  Hủy  DDH
            btnThanhToan.Visible = true;  //Có  thể  thực  hiện  Thanh  toán
            //2.  Lưu  DDH  vào  DB
            try
            {
                SqlDataSourceDDH.Insert(); this.Title = "THÊM đơn Đặt Hàng Thành công";

            }
            catch (System.Exception ex) { this.Title = "LỖI thêm Đơn Đặt Hàng  =  " + ex.Message; }

            //3.  LƯU  CTDDH
            cart = Session["cart"] as DataTable;//LẤY  GIỎ  HÀNG  TỪ  Session  XUỐNG
            try
            {
                foreach (DataRow r in cart.Rows)
                {
                    SqlDataSourceCTDDH.InsertParameters.Clear();//xóa  tất  cả  tham  số  của  CT  đạ  lưu  =  lưu  nhiểu  CTDDH
                    SqlDataSourceCTDDH.InsertParameters.Add("MaDH", lblMaDDH.Text.Trim());
                    SqlDataSourceCTDDH.InsertParameters.Add("MaSP", r[0].ToString().Trim());
                    SqlDataSourceCTDDH.InsertParameters.Add("SLgDat", DbType.Int64, r[4].ToString());
                    SqlDataSourceCTDDH.Insert();
                }
                this.Title = this.Title = "THÊM  DDH  &  CTDDH  OK";
            }
            catch (System.Exception ex)
            {
                this.Title = "LỖI  THÊM  CTDDH  =  " + ex.Message;
            }

        }

        protected void btnHuyDDH_Click(object sender, EventArgs e)
        {
            //1.  Mở  các  ô  nhập  dữ  liệu  đơn  hàng  &  các  nút  lệnh  thay  đổi
            btnHuyKH.Enabled = true;  //có  thể  hủy  tìm  ->  tìm  KH  khác
            txtDCGiao.Enabled = true;  //Mở  các  ô  nhập  thông  tin  Đơn  hàng

            txtNguoiNhan.Enabled = true;
            txtSDTNhan.Enabled = true;

            CalendarHanGiao.Enabled = true;
            btnXacNhan.Enabled = true;  //cho  Xác  nhận  lại  Đơn  hàng
            btnHuyDDH.Visible = false;  //Ẩn  Hủy  DDH

            btnThanhToan.Visible = false;  //Ẩn  Thanh  toán

            //2.  HỦY  CÁC  CTDDH
            cart = Session["cart"] as DataTable;//LẤY  GIỎ  HÀNG  TỪ  Session  XUỐNG
            try
            {
                foreach (DataRow r in cart.Rows)
                {
                    SqlDataSourceCTDDH.DeleteParameters.Clear();//xóa  tất  cả  tham  số  của  CT  =  xóa  nhiểu  CTDDH
                    SqlDataSourceCTDDH.DeleteParameters.Add("MaDH", lblMaDDH.Text.Trim());
                    SqlDataSourceCTDDH.DeleteParameters.Add("MaSP", r[0].ToString().Trim());
                    SqlDataSourceCTDDH.Delete();
                }
                this.Title = this.Title = "XÓA  các  CTDDH  OK";
            }
            catch (System.Exception ex) { this.Title = "LỖI  XÓA  các  CTDDH  =  " + ex.Message; }

            //3.  XÓA  DDH  /  DB
            try
            {
                SqlDataSourceDDH.Delete();
                this.Title = "XÓA  các  CTDDH  &  DDH  OK";
            }
            catch (System.Exception ex) { this.Title = "LỖI  XÓA  DDH  =  " + ex.Message; }
        }

        protected void btnThanhToan_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/FormThanhToan.aspx");
        }
    }
}