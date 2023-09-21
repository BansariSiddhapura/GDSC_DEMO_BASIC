using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class AddtoCart : System.Web.UI.Page
{
    SqlConnection con=new SqlConnection(ConfigurationManager.ConnectionStrings["mydb"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            DataTable dt = new DataTable();
            DataRow dr;
            dt.Columns.Add("sno");
            dt.Columns.Add("productId");
            dt.Columns.Add("pname");
            dt.Columns.Add("pimage");
            dt.Columns.Add("pdesc");
            dt.Columns.Add("pprice");
            dt.Columns.Add("pquantity");
            dt.Columns.Add("pcategory");
            dt.Columns.Add("ptotalprice");

            if (Request.QueryString["id"] != null)
            {
                if (Session["buyitems"] == null)
                {
                    dr = dt.NewRow();
                    
                    SqlDataAdapter da = new SqlDataAdapter("Select * from Product1 where ProductId="+Request.QueryString["id"],con);
                    
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    dr["sno"]=1;
                    dr["productId"] =ds.Tables[0].Rows[0]["ProductId"].ToString();

                    dr["pname"] = ds.Tables[0].Rows[0]["Pname"].ToString();
                    dr["pimage"] = ds.Tables[0].Rows[0]["Pimage"].ToString();
                    dr["pdesc"] = ds.Tables[0].Rows[0]["Pdesc"].ToString();
                    dr["pprice"] = ds.Tables[0].Rows[0]["Pprice"].ToString();
                    dr["pquantity"] = Request.QueryString["quantity"];
                    dr["pcategory"] = ds.Tables[0].Rows[0]["Pcategory"].ToString();

                    int price = Convert.ToInt32(ds.Tables[0].Rows[0]["pprice"].ToString());
                    int quantity = Convert.ToInt32(Request.QueryString["quantity"].ToString());
                    int totalprice = price * quantity;
                    dr["ptotalprice"] = totalprice;

                    dt.Rows.Add(dr);
                    con.Open();
                    SqlCommand cmd=new SqlCommand("Insert into CartDetails values('"+dr["sno"]+"','"+dr["productId"]+"','"+dr["pname"]+"','"+dr["pimage"]+"','"+dr["pdesc"]+"','"+dr["pprice"]+"','"+dr["pquantity"]+"','"+dr["pcategory"]+"','"+Session["username"].ToString()+"')",con);
                    cmd.ExecuteNonQuery();
                    con.Close();


                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    Session["buyitems"] = dt;
                    Button1.Enabled=true;
                    GridView1.FooterRow.Cells[7].Text = "Total Price";
                    GridView1.FooterRow.Cells[8].Text = grandtotal().ToString();
                    Response.Redirect("AddtoCart.aspx");
                }
                else
                {
                    dt = (DataTable)Session["buyitems"];
                    int sr;
                    sr = dt.Rows.Count;

                    dr = dt.NewRow();
                    
                    SqlDataAdapter da = new SqlDataAdapter("Select * from Product1 where ProductId="+Request.QueryString["id"],con);
                   // da.SelectCommand = cmd;
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    dr["sno"]=sr+1;
                    dr["productId"] = ds.Tables[0].Rows[0]["ProductId"].ToString();
                    dr["pname"] = ds.Tables[0].Rows[0]["Pname"].ToString();
                    dr["pimage"] = ds.Tables[0].Rows[0]["Pimage"].ToString();
                    dr["pdesc"] = ds.Tables[0].Rows[0]["Pdesc"].ToString();
                    dr["pprice"] = ds.Tables[0].Rows[0]["Pprice"].ToString();
                    dr["pquantity"] = Request.QueryString["quantity"];
                    dr["Pcategory"] = ds.Tables[0].Rows[0]["Pcategory"].ToString();

                    int price = Convert.ToInt32(ds.Tables[0].Rows[0]["pprice"].ToString());
                    int quantity = Convert.ToInt32(Request.QueryString["quantity"].ToString());
                    int totalprice = price * quantity;
                    dr["ptotalprice"] = totalprice;

                    dt.Rows.Add(dr);
                    con.Open();
                    SqlCommand cmd=new SqlCommand("Insert into CartDetails(sno,ProductId,Pname,Pimage,Pdesc,Pprice,Pquantity,Pcategory) values('"+dr["sno"]+"','"+dr["productId"]+"','"+dr["pname"]+"','"+dr["pimage"]+"','"+dr["pdesc"]+"','"+dr["pprice"]+"','"+dr["pquantity"]+"','"+dr["pcategory"]+"','"+Session["username"].ToString()+"')",con);
                    cmd.ExecuteNonQuery();
                    con.Close();


                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    Session["buyitems"] = dt;
                    Button1.Enabled=true;
                    GridView1.FooterRow.Cells[7].Text = "Total Price";
                    GridView1.FooterRow.Cells[8].Text = grandtotal().ToString();
                    Response.Redirect("AddtoCart.aspx");
                }
            }
            else
            {
                dt = (DataTable)Session["buyitems"];
                GridView1.DataSource = dt;
                GridView1.DataBind();
                if (GridView1.Rows.Count > 0)
                {
                    GridView1.FooterRow.Cells[7].Text = "Total Amount";
                    GridView1.FooterRow.Cells[8].Text = grandtotal().ToString();
                }
            }
            Label3.Text = GridView1.Rows.Count.ToString();
        }
         
    }
    public int grandtotal()
    {
        DataTable dt = new DataTable();
        dt = (DataTable)Session["buyitems"];
        int nrow = dt.Rows.Count;
        int i = 0;
        int gtotal = 0;
        while (i < nrow)
        {
            gtotal = gtotal + Convert.ToInt32(dt.Rows[i]["ptotalprice"].ToString());
            i = i + 1;

        }
        return gtotal;
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DataTable dt = new DataTable();
        dt = (DataTable)Session["buyitems"];

        for (int i = 0; i <= dt.Rows.Count - 1; i++)
        {
            int sr;
            int sr1;
            string qdata;
            string dtdata;
            sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());
            TableCell cell = GridView1.Rows[e.RowIndex].Cells[0];
            qdata = cell.Text;
            dtdata = sr.ToString();
            sr1 = Convert.ToInt32(qdata);
            TableCell prID = GridView1.Rows[e.RowIndex].Cells[1];
            if (sr == sr1)
            {
                dt.Rows[i].Delete();
                dt.AcceptChanges();
                con.Open();
                SqlCommand cmd = new SqlCommand("Delete top (1) from CartDetails where ProductId='"+prID.Text+"'and Email='"+Session["username"]+"')",con);
                cmd.ExecuteNonQuery();
                con.Close();
                break;
            }
        }
        for (int i = 1; i <= dt.Rows.Count; i++)
        {
            dt.Rows[i - 1]["sno"] = i;
            dt.AcceptChanges();

        }
        Session["buyitems"] = dt;
        Response.Redirect("AddtoCart.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}