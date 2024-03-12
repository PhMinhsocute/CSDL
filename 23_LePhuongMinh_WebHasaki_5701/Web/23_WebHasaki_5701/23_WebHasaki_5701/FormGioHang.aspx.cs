using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _23_WebHasaki_5701
{
    public partial class FormGioHang : System.Web.UI.Page
    {
        static DataTable cart = new DataTable();
        DataTable dt = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadData();
            if (Session["cart"] == null)
            {
                lblTitle.Text = "GIỎ HÀNG CỦA QUÝ KHÁCH ĐANG RỖNG, QUAY LẠI TRANG CHỦ ĐỂ CHỌN MUA CÁC SẢN PHẨM MỚI NHẤT BẠN NHA!";
                //btnHome.Text = "Chọn mua";
                lblSum.Text = "";
                dgvGioHang.DataSource = null;
                btnDatHang.Visible = false;
                btnHuy.Visible = false;
            }
            else
            {
                lblTitle.Text = "Giỏ hàng của quý khách như sau: ";
                //btnHome.Text = "Mua tiếp";
                cart = (DataTable)Session["cart"];
                dgvGioHang.DataSource = cart;
                dgvGioHang.DataBind();
                lblSum.Text = "GIỎ HÀNG HIỆN TẠI CỦA BẠN CÓ " + cart.Compute("Count(masp)", "").ToString() + " MÓN HÀNG " +
                    "TỔNG TIỀN: " + cart.Compute("Sum(TT)", "").ToString() + "VND";
                btnDatHang.Visible = true;
            }
        }
        protected void LoadData()
        {
            dt = (DataTable)Session["cart"];
            dgvGioHang.DataSource = dt;
            dgvGioHang.DataBind();
            //dgvGioHang.Columns[2].ControlStyle.Width = 80;
            ////dgvGioHang.Columns[3].ControlStyle.Width = 150;
            //dgvGioHang.Columns[4].ControlStyle.Width = 80;
            //dgvGioHang.Columns[4].ItemStyle.HorizontalAlign = HorizontalAlign.Right;
            //dgvGioHang.Columns[5].ControlStyle.Width = 80;
            //dgvGioHang.Columns[5].ItemStyle.HorizontalAlign = HorizontalAlign.Center;
            //dgvGioHang.Columns[6].ControlStyle.Width = 100;
            //dgvGioHang.Columns[6].ItemStyle.HorizontalAlign = HorizontalAlign.Right;
            if (dt != null)
            {
                double tong = TinhTongTien(dt);
                Session["tong"] = tong;     // lưu để truyền qua trang DonHang.aspx
                lblSum.Text ="Tổng tiền hiện tại của bạn là: "+ String.Format("{0:0,000}", tong);
            }
        }
            protected void dgvGioHang_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            dt = (DataTable)Session["cart"];
            GridViewRow row = dgvGioHang.Rows[e.RowIndex];
            dt.Rows[row.DataItemIndex].Delete();
            dgvGioHang.EditIndex = -1;
            Session["cart"] = dt;
            LoadData();

        }
        protected double TinhTongTien(DataTable dt)
        {
            if (dt == null)
                return 0;
            double sum = 0;
            foreach (DataRow row in dt.Rows)
                sum += Convert.ToDouble(row["TT"]);
            return sum;
        }

        protected void dgvGioHang_RowEditing(object sender, GridViewEditEventArgs e)
        {
            dgvGioHang.EditIndex = e.NewEditIndex;
            LoadData();

        }

        protected void dgvGioHang_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            dgvGioHang.EditIndex = -1;
            LoadData();

        }

        protected void dgvGioHang_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            ////dt.Columns.Add("TT", typeof(double)); // Thêm dòng này để làm cho "TT" có thể đọc/ghi
            //dt = (DataTable)Session["cart"];
            //GridViewRow row = dgvGioHang.Rows[e.RowIndex];
            //TextBox txtSL = (TextBox)(row.Cells[4].Controls[0]);
            //int Soluong = Convert.ToInt32(txtSL.Text);
            //dt.Rows[row.DataItemIndex]["SL"] = txtSL.Text;
            //dt.Rows[row.DataItemIndex]["TT"] =Convert.ToDouble(dt.Rows[row.DataItemIndex]["GiaBan"]) * Soluong;
            ////Reset the edit index.
            //dgvGioHang.EditIndex = -1;
            //Session["cart"] = dt;
            //LoadData();
            dt = (DataTable)Session["cart"];
            GridViewRow row = dgvGioHang.Rows[e.RowIndex];
            TextBox txtSL = (TextBox)(row.Cells[4].Controls[0]);
            int Soluong = Convert.ToInt32(txtSL.Text);

            // Kiểm tra xem cột "TT" có thuộc tính chỉ đọc không
            if (dt.Columns["TT"].ReadOnly)
            {
                // Nếu là chỉ đọc, tạo một cột mới với giá trị tính toán
                dt.Columns.Add("NewTT", typeof(double));
                dt.Rows[row.DataItemIndex]["NewTT"] = Convert.ToDouble(dt.Rows[row.DataItemIndex]["GiaBan"]) * Soluong;
            }
            else
            {
                // Nếu không phải là chỉ đọc, cập nhật trực tiếp giá trị cho cột "TT"
                dt.Rows[row.DataItemIndex]["TT"] = Convert.ToDouble(dt.Rows[row.DataItemIndex]["GiaBan"]) * Soluong;
            }

            // Đặt lại chỉ số chỉnh sửa.
            dgvGioHang.EditIndex = -1;

            // Lưu DataTable vào Session
            Session["cart"] = dt;

            // Tải lại dữ liệu
            LoadData();

        }
        // Hủy giỏ hàng
        protected void btnHuy_Click(object sender, EventArgs e)
        {
            
            Session["cart"] = null;
            Response.Redirect("~/FormTrangChu.aspx");
        }

        protected void btnDatHang_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/FormDonHang.aspx");
        }

        protected void btnDatHang_Click1(object sender, EventArgs e)
        {
            Response.Redirect("~/FormDonHang.aspx");
        }
    }
}