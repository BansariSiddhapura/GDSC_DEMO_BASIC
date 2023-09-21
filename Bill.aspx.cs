using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class Bill : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string Orderid = Session["Orderid"].ToString();
        Label1.Text = Orderid;
        findorderdate(Label2.Text);
        string Address = Session["address"].ToString();
        showgrid(Label1.Text);
    }
    private void findorderdate(String Orderid)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydb"].ConnectionString);
        SqlCommand cmd = new SqlCommand("Select * from OrderDetails where orderid='" + Label1.Text + "'");
        cmd.Connection = con;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Label2.Text = ds.Tables[0].Rows[0]["Orderdate"].ToString();
        }
        con.Close();
    }
    private void showgrid(String orderid)
    {
        DataTable dt = new DataTable();
        DataRow dr;
        dt.Columns.Add("sno");
        dt.Columns.Add("productid");
        dt.Columns.Add("productname");
        dt.Columns.Add("quantity");
        dt.Columns.Add("price");
        dt.Columns.Add("totalprice");
        SqlConnection scon = new SqlConnection(ConfigurationManager.ConnectionStrings["mydb"].ConnectionString);
        SqlCommand cmd = new SqlCommand("select * from OrderDetails where orderid='" + Label1.Text + "'");
        cmd.Connection = scon;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        int totalrows = ds.Tables[0].Rows.Count;
        int i = 0;
        int grandtotal = 0;
        while (i < totalrows)
        {
            dr = dt.NewRow();
            dr["sno"] = ds.Tables[0].Rows[i]["sno"].ToString();
            dr["productid"] = ds.Tables[0].Rows[i]["productid"].ToString();
            dr["productname"] = ds.Tables[0].Rows[i]["productname"].ToString();
            dr["quantity"] = ds.Tables[0].Rows[i]["quantity"].ToString();
            dr["price"] = ds.Tables[0].Rows[i]["price"].ToString();

            int price=Convert.ToInt32(ds.Tables[0].Rows[i]["price"].ToString());
            int quantity=Convert.ToInt32(ds.Tables[0].Rows[i]["quantity"].ToString());
            int totalprice = price * quantity;
            dr["totalprice"] = totalprice;
            grandtotal = grandtotal + totalprice;
            dt.Rows.Add(dr);
            i = i + 1;
        }
        GridView1.DataSource = dt;
        GridView1.DataBind();
        Label4.Text = grandtotal.ToString();
    }
}   