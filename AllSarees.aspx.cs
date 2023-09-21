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
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydb"].ConnectionString);
    SqlCommand com;
    SqlDataReader red;
    //display product based on selected category
    protected void Page_Load(object sender, EventArgs e)
    {
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
    }
    protected void ProductCategories_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strQuery = "";
        string selectedProduct = ProductCategories.SelectedItem.Text;
        if (selectedProduct == "Product Category")
        {
             
        }
        else
        {
            strQuery = "where Pcategory = '" + selectedProduct + "'";
        }
        SqlDataAdapter sda = new SqlDataAdapter("Select * from Product1 " + strQuery + "", con);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        try
        {
            if (selectedProduct == dt.Rows[0][6].ToString())
            {

            }
        }
        catch(Exception ex)
        {
            Response.Write("<script>alert('No product found')</script>");
            
        }
        DataList1.DataSourceID = null;
        DataList1.DataSource = dt;
        DataList1.DataBind();
      /*  int CategoryID = int.Parse(ProductCategories.SelectedValue);
        com = con.CreateCommand();
        com.CommandText = "select * from Product1 where Pcategory=@CategoryID";
        com.Parameters.AddWithValue("@CategoryID", CategoryID);
        con.Open();
        red = com.ExecuteReader();

        DataList1.DataBind();
        red.Close();
        con.Close();
        */
       
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
       // DropDownList list = (DropDownList)(e.Item.FindControl("DropDownList1"));
        //Response.Redirect("AddtoCart.aspx?id=" + e.CommandArgument.ToString() + "&quantity=" + list.SelectedItem.ToString());
        if (e.CommandArgument == "viewdetails")
        {
            Response.Redirect("buynow.aspx?id=" + e.CommandArgument.ToString());
        }


    }
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        /*Label productID = e.Item.FindControl("Label6") as Label;
        Label stock = e.Item.FindControl("Label5") as Label;
        Button btn = e.Item.FindControl("Button2") as Button;
        SqlDataAdapter sda = new SqlDataAdapter("Select * from Product1 where ProductId= '" + productID.Text + "'", con);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        String stockdata = "";

        if (dt.Rows.Count > 0)
        {
            stockdata = dt.Rows[0]["Pquantity"].ToString();
        }
        con.Close();
        if (stockdata == "0")
        {
            stock.Text = "out of stock";
            btn.Enabled = false;
            //btn.ImageUrl = "img/1.jpg";
        }
        else
        {
            stock.Text = stockdata;
        }*/

    }
    public void Drp_ProductCategory()
    {
        /*con.Open();
        SqlCommand cmd = new SqlCommand("select * from Category", con);
        ProductCategories.DataSource = cmd.ExecuteReader();
        ProductCategories.DataTextField = "CategoryName";
        ProductCategories.DataValueField = "CategoryId";
        ProductCategories.DataBind();
        ProductCategories.Items.Insert(0, "Product Category");
        con.Close();

        */
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
       // Response.Redirect("buynow.aspx");
        
    }
    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}