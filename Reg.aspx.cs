using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
public partial class Reg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonSub_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydb"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("Insert into Record" + "(UserName,Email,Gender,Address,Phone,Password)values(@UserName,@Email,@Gender,@Address,@Phone,@Password)", con);
        cmd.Parameters.AddWithValue("@UserName", TextBox1.Text);
        cmd.Parameters.AddWithValue("@Email", TextBox3.Text);
        cmd.Parameters.AddWithValue("@Gender", DropDownList1.SelectedItem.Value);
        cmd.Parameters.AddWithValue("@Address", TextBox5.Text);
        cmd.Parameters.AddWithValue("@Phone", TextBox6.Text);
        cmd.Parameters.AddWithValue("@Password", TextBox7.Text);

        cmd.ExecuteNonQuery();
        con.Close();
        ClearText();
        Label1.Text = "Registered successfully";
        ClearText();
    }
    private void ClearText()
    {
        TextBox1.Text = string.Empty;
        TextBox3.Text = string.Empty;
        TextBox5.Text = string.Empty;
        TextBox6.Text = string.Empty;
        TextBox7.Text = string.Empty;
    }
}