<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="AddtoCart.aspx.cs" Inherits="AddtoCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <p>
        you have sarees
        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
&nbsp;in your cart&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Continue shopping</asp:HyperLink>
    </p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
         BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" 
        Height="429px" ShowFooter="True" Width="998px" OnRowDeleting="GridView1_RowDeleting" 
        >
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:BoundField DataField="sno" HeaderText="Sr.No">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>

            <asp:BoundField DataField="productId" HeaderText="Id" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>

            <asp:BoundField DataField="pname" HeaderText="Name">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>

            <asp:ImageField DataImageUrlField="pimage" HeaderText="Saree Image">
                <ControlStyle Height="300px" Width="340px" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:ImageField>

            <asp:BoundField DataField="pdesc" HeaderText="Description">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>

            <asp:BoundField DataField="pprice" HeaderText="Price">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>

            <asp:BoundField DataField="pquantity" HeaderText="Quantity">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>

            <asp:BoundField DataField="pcategory" HeaderText="Category">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>

            <asp:BoundField DataField="ptotalprice" HeaderText="Total Price">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>

            <asp:CommandField DeleteText="Remove" ShowDeleteButton="True">
            <ItemStyle HorizontalAlign="Center" />
            </asp:CommandField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#0000A9" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#000065" />
    </asp:GridView>
    <br />
    
    <asp:Button ID="Button1" runat="server" Text="Place Order" BackColor="Pink" BorderColor="White"
         BorderStyle="Ridge"
        font-bold="true" Font-Size="Large" Height="46px" Width="135px" OnClick="Button1_Click" 
        CssClass="btnPlaceOrder"  />
    <p>
        &nbsp;</p>
   
</asp:Content>

