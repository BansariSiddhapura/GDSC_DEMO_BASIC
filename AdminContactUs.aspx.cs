using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
public partial class AdminContactUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mydb"].ConnectionString);
        SqlCommand com = new SqlCommand("Select * from ContactUs",con);
        //com = "Select * from ContactUs";
        con.Open();
        com.ExecuteNonQuery();
        con.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
          
    }
}