<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AdminContactUs.aspx.cs" Inherits="AdminContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div>
        

       
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                 </ItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                </ItemTemplate>
           <ItemTemplate>
                <asp:Label ID="Label4" runat="server" Text='<%# Eval("PhoneNo") %>'></asp:Label>
           </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("Address") %>'></asp:TextBox>
                 </EditItemTemplate>
             <EditItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("Email") %>'></asp:TextBox>
                 </EditItemTemplate>
             <EditItemTemplate>
                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("PhoneNo") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:DataList>

         <asp:Button ID="Button1" runat="server" Text="Change" OnClick="Button1_Click" />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mydb %>" 
            SelectCommand="SELECT * FROM [ContactUs]" 
            DeleteCommand="DELETE FROM [ContactUs] WHERE [Id] = @Id" 
            InsertCommand="INSERT INTO [ContactUs] ([Address], [Email], [PhoneNo]) VALUES (@Address, @Email, @PhoneNo)" 
            UpdateCommand="UPDATE [ContactUs] SET [Address] = @Address, [Email] = @Email, [PhoneNo] = @PhoneNo WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="PhoneNo" Type="Int64" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="PhoneNo" Type="Int64" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

