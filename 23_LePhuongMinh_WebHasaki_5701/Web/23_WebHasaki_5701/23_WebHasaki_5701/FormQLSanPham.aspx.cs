using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _23_WebHasaki_5701
{
    public partial class FormQLSanPham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            //Ẩn _ Hiện các TextBox,...nhập thông tin sản phẩm mới cần thêm
            lblTTSPnew.Visible =!lblTTSPnew.Visible;
            lblMaSP.Visible = !lblMaSP.Visible;
            lblLoaiSP.Visible = !lblLoaiSP.Visible;
            lblTenSP.Visible = !lblTenSP.Visible;
            lblDVT.Visible = !lblDVT.Visible;
            lblGiaBan.Visible = !lblGiaBan.Visible;
            lblHinhAnh.Visible = !lblHinhAnh.Visible;
            DropDownListLoaiSP.Visible = !DropDownListLoaiSP.Visible;


            txtMaSP.Visible = !txtMaSP.Visible;
            txtTenSP.Visible = !txtTenSP.Visible;
            txtGiaBan.Visible = !txtGiaBan.Visible;
            txtDVT.Visible = !txtDVT.Visible;
            FileUploadHA.Visible = !FileUploadHA.Visible;

            btnHuy.Visible = !btnHuy.Visible;

            //THÊM _ LƯU
            if (btnThem.Text.Trim() == "Thêm sản phẩm mới")// Chuẩn bị thêm MH mới
            {//Xóa trống tất cả các TextBox để chuẩn bị cho nsd nhập thông tin món ăn mới
                txtMaSP.Text = "000"; txtMaSP.ToolTip = "KHÔNG ĐỂ TRỐNG MÃ SẢN PHẨM, KHÔNG NHẬP TRÙNG MÃ SẢN PHẨM ĐÃ CÓ !";
                //SV sau này phải cho mã mh này tự tăng (theo măn, quý, stt); không nên để NSD tự nhập. 
                txtTenSP.Text = "";
                txtGiaBan.Text = "0"; 
                txtGiaBan.ToolTip = "Giá phải > 0";
                txtDVT.Text = "";
    
                //Đổi nhãn btnThem : Thêm => Lưu
                btnThem.Text = "Lưu sản phẩm mới";
            }
            else  // Lưu sản phẩm vào DataBase 
            {
                try
                {
                    //1.Đinh nghĩa các tham số parameters cho Insertcommnand : tham số cho field hinh có dạng ~\\Images\\Tên file hình được upload.filename
                    SqlDataSource_qlSP.InsertParameters.Clear();
                    SqlDataSource_qlSP.InsertParameters.Add("MaSP", txtMaSP.Text.Trim());
                    SqlDataSource_qlSP.InsertParameters.Add("TenSP", txtTenSP.Text);
                    SqlDataSource_qlSP.InsertParameters.Add("MaLoai", DropDownListLoaiSP.SelectedValue.Trim());
                    SqlDataSource_qlSP.InsertParameters.Add("DVT", txtDVT.Text);
                    SqlDataSource_qlSP.InsertParameters.Add("GiaBan", System.Data.DbType.Double, txtGiaBan.Text.Trim());
                    SqlDataSource_qlSP.InsertParameters.Add("HinhAnh", "~\\HinhAnh\\" + FileUploadHA.FileName); //Add Path của file Hình vào DB

                    //2.Chạy lệnh Insert để lưu thông tin mặt hàng mới vào DB
                    SqlDataSource_qlSP.Insert();
                    //3. Lưu (copy) hình vửa được nsd Upload vào thư mục ~\\Images\\ của App
                    //OFFLINE 
                    FileUploadHA.SaveAs("D:\\HK3_2023\\23_LePhuongMinh_WebHasaki_5701\\Web\\23_WebHasaki_5701\\23_WebHasaki_5701\\HinhAnh\\" + FileUploadHA.FileName.Trim());
                //D:\HK3_2023\23_LePhuongMinh_WebHasaki_5701\Web\23_WebHasaki_5701\23_WebHasaki_5701\HinhAnh

                    //Khi App này được Copy đi nơi khác => thì Update lại path này 
                    //ONLINE (khi upload lên Host, VD: somee thì phải dùng path vật lý của somee - tuy nhiên: tùy thuộc vào bảo mật của Host có thể không SaveAs... được
                    //FileUploadHinh.SaveAs("D:\\DZHosts\\LocalUser\\gtwovxthe\\www.drunkshopG506vxthe.somee.com\\" + FileUploadHinh.FileName.Trim());
                }
                catch (System.Exception ex)
                { this.Title = "CÓ LỖI THÊM SẢN PHẨM MỚI = " + ex.Message; }

                //Tải thông tin MH mới thêm lên GridView trên Web
                dgvdssp.DataBind();
                //Đối nhãn nút "Lưu.." -> "Thêm ..."
             btnThem.Text = "Thêm sản phẩm mới";
            }//else if btnThem.Text.Trim()
        }

        protected void btnDanhSach_Click(object sender, EventArgs e)
        {
            dgvdssp.Visible = true;
            dgvdssp.DataBind();
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            lblTTSPnew.Visible = false;
            lblMaSP.Visible = false;
            lblLoaiSP.Visible = false;
            lblTenSP.Visible = false;
            lblDVT.Visible = false;
            lblGiaBan.Visible = false;
            lblHinhAnh.Visible = false;
            DropDownListLoaiSP.Visible = false;

            txtMaSP.Visible = false;
            txtTenSP.Visible = false;
            txtGiaBan.Visible = false;
            txtDVT.Visible = false;
            FileUploadHA.Visible = false;

            btnHuy.Visible = false;
            btnThem.Text = "Thêm sản phẩm mới";

            Label9.Visible = false;
            //btnDanhSach.Visible = false;
        }

        protected void btnTim_Click(object sender, EventArgs e)
        {
            if (btnTim.Text.Trim() == "Tìm")
            {
                //dgvCTPN.DataBind();
                if (GridView1.Rows.Count < 1)
                {
                    btnThem.Visible = true;
                    return;

                }
                else
                {
                    btnTim.Text = "Chọn SP";
                    if (GridView1.Rows.Count > 1)
                    {
                        btnTim.Enabled = false;
                        btnTim.ToolTip = "Hãy chọn 1 SP trong danh sách dưới";
                       
                    }
                    else btnTim.Enabled = true;
                }
            }
            
        }
    }
}