using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydb"].ConnectionString);
        SqlCommand com;
        SqlDataReader red;
        if (!Page.IsPostBack)
        {
            com = con.CreateCommand();
            com.CommandText = "select * from Category";
            con.Open();
            red = com.ExecuteReader();
            //ProductCategories.DataSource = red;
            ProductCategories.DataTextField = "CategoryName";
            ProductCategories.DataValueField = "CategoryID";
            ProductCategories.DataBind();
            red.Close();
            con.Close();

            ListItem i = new ListItem();
            i.Text = "Product category";
            i.Value = "";
            i.Selected = true;
            ProductCategories.Items.Insert(0, i);
            ProductCategories.SelectedIndex = 0;

     
        }
        DataTable dt = new DataTable();
        dt = (DataTable)Session["buyitems"];
        if (dt != null)
        {
            Label7.Text = dt.Rows.Count.ToString();
        }
        else
        {
            Label7.Text = "0";
        }

    }
    protected void ProductCategories_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
       DropDownList dlist = (DropDownList)(e.Item.FindControl("DropDownList1"));
        Response.Redirect("AddtoCart.aspx?id=" + e.CommandArgument.ToString() + "&quantity=" + dlist.SelectedItem.ToString());

    }
}