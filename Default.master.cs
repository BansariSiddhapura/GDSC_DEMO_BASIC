using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Default : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        dt = (DataTable)Session["buyitems"];
        if (dt != null)
        {
            Label2.Text = dt.Rows.Count.ToString();
        }
        else
        {
            Label2.Text = "0";
        }
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("AddtoCart.aspx");
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        Rondom ran = new Rondom();
        int i = ran.Next(1, 5);
        Image2.ImageUrl = "~/img/" + i.ToString() + ".jpg";
    }
}
