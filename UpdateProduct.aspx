<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="UpdateProduct.aspx.cs" Inherits="UpdateProduct" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center" class="navbar" style="height:auto">
        <!---sorting by product category-->
        Sort By:&nbsp;
       <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" AutoPostBack="True"
             DataSourceID="SqlDataSource2" DataTextField="CategoryName" DataValueField="CategoryName" Height="42px"
             Width="125px" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" >
            <asp:ListItem>Select Category</asp:ListItem>
        </asp:DropDownList>


        <!--DataSource for category dropdownlist-->
       <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:mydb %>"
             SelectCommand="SELECT [CategoryName] FROM [Category]"></asp:SqlDataSource>
        <!--<hr style="height: 8px; width: 1547px" />-->

        <!--gridview to display product-->
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
              OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing"
             OnRowUpdating="GridView1_RowUpdating"  OnPageIndexChanging="GridView1_PageIndexChanging" 
            BackColor="White" BorderColor="#339966" BorderStyle="None" BorderWidth="1px"
             CellPadding="3" EmptyDataText="no product to display" DataSourceID="SqlDataSource3"
             DataKeyNames="ProductId">
            <Columns>
                <asp:TemplateField HeaderText="Product ID">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProductId") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("Pname") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Pname") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Description">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("Pdesc") %>' TextMode="MultiLine"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Pdesc") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Image">
                    <EditItemTemplate>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server"  ImageUrl='<%# Eval("Pimage") %>' Height="100px" Width="92px"/>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Price">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("Pprice") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Pprice") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Quantity">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("Pquantity") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Pquantity") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Category">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
                           DataTextField="CategoryName" DataValueField="CategoryName"
                             SelectMethod='<%# Eval("Pcategory") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                             ConnectionString="<%$ ConnectionStrings:mydb %>" 
                            SelectCommand="SELECT [CategoryName] FROM [Category]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("Pcategory") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>


                <asp:CommandField HeaderText="Edit" ShowEditButton="True" >
                <ItemStyle HorizontalAlign="Center" />
                 </asp:CommandField>
                <asp:CommandField HeaderText="Delete" ShowDeleteButton="true" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:CommandField>
                   

            </Columns>
            <EmptyDataRowStyle Font-Bold="true" ForeColor="Yellow" />
            <FooterStyle BackColor="White" ForeColor="Window" />
            <HeaderStyle BackColor="#cc66ff" Font-Bold="true" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000099" HorizontalAlign="Left" />
            <RowStyle ForeColor="#660066" />
            <SelectedRowStyle BackColor="#ffccff" ForeColor="Black" Font-Bold="true" />
            <SortedAscendingCellStyle BackColor="#66ff33" />
            <SortedAscendingHeaderStyle BackColor="#800000" />
            <SortedDescendingCellStyle BackColor="#009900" />
            <SortedDescendingHeaderStyle BackColor="#0099cc" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:mydb %>" 
            SelectCommand="SELECT * FROM [Product1]" 
            DeleteCommand="DELETE FROM [Product1] WHERE [ProductId] = @ProductId;"
             UpdateCommand="UPDATE Product1 SET ProductId = @ProductId, Pname = @Pname, Pdesc = @Pdesc, Pimage = @Pimage, Pprice = @Pprice, Pquantity = @Pquantity, Pcategory = @Pcategory">
            <DeleteParameters>
                <asp:Parameter Name="ProductId" />
        </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="ProductId" />
                <asp:Parameter Name="Pname" />
                <asp:Parameter Name="Pdesc" />
                <asp:Parameter Name="Pimage" />
                <asp:Parameter Name="Pprice" />
                <asp:Parameter Name="Pquantity" />
                <asp:Parameter Name="Pcategory" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
    </div>
</asp:Content>

