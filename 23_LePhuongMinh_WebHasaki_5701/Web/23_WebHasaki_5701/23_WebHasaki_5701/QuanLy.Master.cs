using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _23_WebHasaki_5701
{
    public partial class QuanLy : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void linkbtnQLNV_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/FormQLNhanVien.aspx");
        }

        protected void linkbtnQLKH_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/FormQLKhachHang.aspx");
        }

        protected void linkbtnQLNCC_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/FormQLNhaCungCap.aspx");
        }

        protected void linkbtnBaoCao_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/FormBaoCao.aspx");
        }
    }
}