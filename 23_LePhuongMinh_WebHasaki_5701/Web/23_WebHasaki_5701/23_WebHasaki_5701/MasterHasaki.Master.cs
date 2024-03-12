using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _23_WebHasaki_5701
{
    public partial class MasterHasaki : System.Web.UI.MasterPage
    {
        DataTable dt = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["cart"] != null)
            {
                dt = (DataTable)Session["cart"];
                lblSoLuong.Text = dt.Rows.Count.ToString();
            }
        }

        protected void linkbtnTC_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/FormTrangChu.aspx");
        }

        protected void linkbtnGT_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/FormGioiThieu.aspx");
        }

        protected void linkbtnLH_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/FormLienHe.aspx");
        }

        protected void linkbtnHTCH_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/FormHeThongCuaHang.aspx");
        }

        protected void imagebtnTC_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/FormTrangChu.aspx");
        }

        protected void imagebtnBill_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/FormDonHang.aspx");
        }

        protected void imagebtnGH_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/FormGioHang.aspx");
        }

        protected void imagebtnLogin_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/FormDangNhap.aspx");
        }

        protected void imagebtnTK_Click(object sender, ImageClickEventArgs e)
        {
            if(txtTK.Text != "")
                Response.Redirect("~/FormTimKiemSP.aspx?TenSP=" + txtTK.Text.Trim());
            else
                Response.Redirect("~/FormTrangChu.aspx");
        }

        protected void imagebtnDM_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/FormDuongMoi.aspx");
        }

        protected void imagebtnKDA_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/FormKemDuongAm.aspx");
        }

        protected void imagebtnLotion_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/FormLotionDuongThe.aspx");
        }

        protected void imagebtnSR_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/FormSerum.aspx");
        }

        protected void imagebtnMN_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/FormMatNa.aspx");
        }

        protected void imagebtnToner_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/FormToner.aspx");
        }

        protected void imagebtnKCN_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/FormKemChongNang.aspx");
        }

        protected void imagebtnSRM_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/FormSuaRuaMat.aspx");
        }

        protected void imagebtnNTT_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/FormNTT.aspx");
        }

        protected void imagebtnST_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/FormSuaTam.aspx");
        }
    }
}