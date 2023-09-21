using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ClientFeedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mydb"].ConnectionString);
        conn.Open();
        SqlCommand cmd = new SqlCommand ("insert into feedback"+"(name,address,city,m_no,email_id,comment)values(@name,@address,@city,@m_no,@email_id,@comment)",conn);
        cmd.Parameters.AddWithValue("@name", txtnm.Text);
        cmd.Parameters.AddWithValue("@address", txtadd.Text);
        cmd.Parameters.AddWithValue("@city", txtcity.Text);
        cmd.Parameters.AddWithValue("@m_no", txtcon.Text);
        cmd.Parameters.AddWithValue("@email_id", txteid.Text);
        cmd.Parameters.AddWithValue("@comment", txtcomm.Text);
        cmd.ExecuteNonQuery();
        conn.Close();
        Response.Write("<script>alert('your feedback successfullyy');</script>");

        txtnm.Text = "";
        txtadd.Text = "";
        txtcity.Text = "";
        txtcon.Text = "";
        txteid.Text = "";
        txtcomm.Text = "";

    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        txtnm.Text = "";
        txtadd.Text = "";
        txtcity.Text = "";
        txtcon.Text = "";
        txteid.Text = "";
        txtcomm.Text = "";
    }
}