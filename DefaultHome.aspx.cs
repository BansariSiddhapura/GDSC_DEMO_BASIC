using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
public partial class DefaultHome : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydb"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
       // Session["addproduct"] = "false";

        //login session
        if (Session["username"] != null)
        {
            Label4.Text = "Welcome " + Session["username"].ToString() +" !!!";
            HyperLink1.Visible = false;
            Button1.Visible = true;
        }
        else
        {
            Label4.Text = "Hello u can login here";
            HyperLink1.Visible = true;
            Button1.Visible = false;
        }
        if (!IsPostBack)
        {
           // Drp_ProductCategory();
        }
    }
    //logout button
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("DefaultHome.aspx");

        Label4.Text = "You are logged out successfully...";
    }

    //display product based on selected category
   /* protected void ProductCategories_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strQuery = "";
        string selectedProduct = ProductCategories.SelectedItem.Text;
        if(selectedProduct=="Product Category")
        {
            strQuery="";
        }
        else
        {
            strQuery="where Pcategory='"+selectedProduct+"'";
        }
        SqlDataAdapter sda=new SqlDataAdapter("Select * from Product1"+strQuery+"",con);
        DataTable dt=new DataTable();
        sda.Fill(dt);
        try
        {
                if(selectedProduct == dt.Rows[0][6].ToString())
                {

                }
        }
        catch
        {
            Response.Write("<script>alert('No product found')</script>");

        }
        DataList1.DataSourceID=null;
        DataList1.DataSource=dt;
        DataList1.DataBind();
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
            DropDownList list=(DropDownList)(e.Item.FindControl("DropDownList1"));
            Response.Redirect("AddtoCart.aspx?id="+e.CommandArgument.ToString()+"&quantity="+list.SelectedItem.ToString());

        

    }
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Label productID = e.Item.FindControl("Label6") as Label;
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
        }

    }
    public void Drp_ProductCategory()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from Category", con);
        ProductCategories.DataSource = cmd.ExecuteReader();
        ProductCategories.DataTextField = "CategoryName";
        ProductCategories.DataValueField = "CategoryID";
        ProductCategories.DataBind();
        ProductCategories.Items.Insert(0, "Product Category");
        con.Close();


    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }*/
}