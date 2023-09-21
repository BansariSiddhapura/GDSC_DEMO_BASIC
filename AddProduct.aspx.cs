using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class AddProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("login.aspx");
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydb"].ConnectionString.ToString());
        if (imageUpload.HasFile)
        {
            string filename = imageUpload.PostedFile.FileName;
            string filepath = "img/" + imageUpload.FileName;
            imageUpload.PostedFile.SaveAs(Server.MapPath("~/img/") + filename);
            con.Open();
            //SqlCommand cmd = new SqlCommand("Insert into Product1 values('" + txtName.Text + "','" + txtDesc.Text + "','" + filepath + "','" + txtPrice.Text + "','" + txtQuantity.Text + "','" + DropDownList1.SelectedItem.Text + "')", con);
            SqlCommand cmd = new SqlCommand("Insert into Product1" + "(Pname,Pdesc,Pimage,Pprice,Pquantity,Pcategory)values('" + txtName.Text + "','" + txtDesc.Text + "','" + filepath + "','" + txtPrice.Text + "','" + txtQuantity.Text + "','" + DropDownList1.SelectedItem.Text + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('This Poduct is inserted');</script>");
          // Response.Redirect("AdminHome.aspx");
        }
    }
}