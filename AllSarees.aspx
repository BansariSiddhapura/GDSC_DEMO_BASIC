<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="AllSarees.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 252px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style=" background-position: center bottom; width:1197px; height:40px; text-align: center;
  background-repeat: no-repeat; background-attachment: inherit;  background-color: #00FF00;">

     <tr style="background-color:#FF00FF; text-align:center; width:100%">
     <!--Dropdown list of categories-->
    <td style="text-align:right">
             <asp:DropDownList ID="ProductCategories" runat="server" AutoPostBack="True" 
                  AppendDataBoundItems="true"
                 OnSelectedIndexChanged="ProductCategories_SelectedIndexChanged" Font-Size="Medium" 
                 Font-Bold="True" BackColor="Black" ForeColor="White" DataSourceID="SqlDataSource2">
                 
             </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:mydb %>" 
            SelectCommand="SELECT * FROM [Category]" DeleteCommand="DELETE FROM [Category] WHERE [CategoryID] = @CategoryID"
             InsertCommand="INSERT INTO [Category] ([CategoryName]) VALUES (@CategoryName)" 
            UpdateCommand="UPDATE [Category] SET [CategoryName] = @CategoryName WHERE [CategoryID] = @CategoryID">
            <DeleteParameters>
                <asp:Parameter Name="CategoryID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CategoryName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CategoryName" Type="String" />
                <asp:Parameter Name="CategoryID" Type="Int32" />
            </UpdateParameters>
             </asp:SqlDataSource>
             

         </td>
     </tr>
 </table>

    <!--Display products-->

    <asp:DataList ID="DataList1" runat="server" DataKeyField="productId"
         DataSourceID="SqlDataSource1" Height="293px"
         Width="310px" RepeatColumns="4" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand" 
        OnItemDataBound="DataList1_ItemDataBound" OnSelectedIndexChanged="DataList1_SelectedIndexChanged"  >

        <ItemTemplate>
            <table>
                <!--product name-->
                <tr>
                    <td style="text-align:center; background-color:burlywood" class="auto-style1">
                      <asp:Label ID="Label1" runat="server" Text='<%# Eval("Pname") %>' Font-Bold="True" 
                            ForeColor="White"></asp:Label>
                    </td>
                </tr>
                <caption>
                    <br />
                    <!-- product img and stoke of product-->
                    <tr>
                        <td class="auto-style1" style="text-align:center">
                            <asp:Image ID="Image1" runat="server" BorderColor="#CC00CC" BorderWidth="1px"
                                 Height="200px" ImageUrl='<%# Eval("Pimage") %>' Width="300px" />
                            <div class="all">
                                &nbsp;Stock:&nbsp;
                                <asp:Label ID="Label5" runat="server" BackColor='<%# (int)Eval("Pquantity")<=10? System.Drawing.Color.Red : System.Drawing.Color.Green %>' CssClass="txtStock" Text='<%# Eval("Pquantity") %>'>

                           </asp:Label>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </div>
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("ProductId") %>' Visible="false"></asp:Label>
                        </td>
                    </tr>
                    <!-- product price -->
                    <tr>
                        <td class="auto-style1" style="text-align:center; background-color:#5f98f3">
                            <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="White" Style="text-align:center" Text="Price: "></asp:Label>
                            <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="White" Style="text-align:center" Text='<%# Eval("Pprice") %>'></asp:Label>
                        </td>
                    </tr>
                    <!-- Product Quantity-->
                    <tr>
                        <td align:"center"="" class="auto-style1">Quantity
                            <asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <!-- view detail button-->
                   
                    <tr>
                        <td style="text-align:center">
                            <asp:Button ID="Button1" runat="server" Height="40px"
                                 OnClick="Button1_Click" Text="View Detail" Width="80%" 
                                CommandName="viewdetails" 
                                 CommandArgument='<%# Eval("ProductId") %>' />
                        </td>
                    </tr>
                </caption>
            </table>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 

         ConnectionString="<%$ ConnectionStrings:mydb %>"
         SelectCommand="SELECT [ProductId], [Pname], [Pimage], [Pprice], [Pquantity] FROM [Product1]"  
         ProviderName="System.Data.SqlClient">

    </asp:SqlDataSource>

    
</asp:Content>

