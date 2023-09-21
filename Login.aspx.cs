using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Visible = false;
        //check user alredy loged or not
        if (Session["username"] != null)
        {
            Response.Redirect("DefaultHome.aspx");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydb"].ConnectionString);
        SqlDataAdapter sda = new SqlDataAdapter("select * from Record where UserName='" + TextBox1.Text + "'and Password='" + TextBox2.Text + "'", con);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        Label1.Visible = true;

        if (TextBox1.Text == "admin" & TextBox2.Text == "123456")
        {
            Session["admin"] = TextBox1.Text;
            Response.Redirect("AdminHome.aspx");
        }
        else if (dt.Rows.Count == 1)
        {
            Session["username"] = TextBox1.Text;
            //Session["buyitems"] = null;
            //fillSavedCart();
            Response.Redirect("DefaultHome.aspx");
        }
        else
        {
            Label1.ForeColor = System.Drawing.Color.Red;
            Label1.Text = "login failed......";
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Reg.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
    }
}