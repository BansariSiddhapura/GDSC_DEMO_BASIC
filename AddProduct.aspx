<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AddProduct.aspx.cs" Inherits="AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="navbar" style="border-width:3px; border-color:#333333; height:auto">
        <table style="width:700px; height:390px; background-color:aqua;" align="center">

            <tr>
                <td align="center" width="50%" colspan="2">
                    <h1>Add Sarees</h1>
                </td>
            </tr>

            <!--category Dropdownlist-->
            <tr>
                <td align="center" width="50%">
                    <h3>Category:</h3>
                </td>
                <td width="50%">
                    <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" 
                        DataSourceID="SqlDataSource1" 
                        DataTextField="CategoryName" DataValueField="CategoryId" Height="33px" Width="165px">

                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                         ErrorMessage="Category is compalsory"
                         ControlToValidate="DropDownList1" Display="Dynamic" InitialValue="Select"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <!--product name-->
            <tr>
                <td align="center" width="50%">
                    <h3>Product Name:</h3>

                </td>
                <td width="50%">
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                         ErrorMessage="sarees name is mandatory" ControlToValidate="txtName" Display="Dynamic"
                         ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <!--Product desc-->
            <tr>
                <td align="center" width="50%">
                    <h3>Product Description:</h3>

                </td>
                <td width="50%">
                    <asp:TextBox ID="txtDesc" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                         ErrorMessage="sarees Desc is mandatory" ControlToValidate="txtDesc" Display="Dynamic"
                         ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <!-- uplod image-->
            <tr>
                <td align="center" width="50%">
                    <h3>Image:</h3>
                </td>
                <td width="50%">
                    <asp:FileUpload ID="imageUpload" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                         ErrorMessage="Image is mandatory" ControlToValidate="imageUpload" Display="Dynamic"
                         ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <!--for price-->
            <tr>
                <td align="center" width="50%">
                    <h3>Sarees Price:</h3>

                </td>
                <td width="50%">
                    <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                         ErrorMessage="Price is mandatory" ControlToValidate="txtPrice" Display="Dynamic"
                         ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                         ErrorMessage="Price is invalid" ControlToValidate="txtPrice" Display="Dynamic"
                         ValidationExpression="[0-9]*" ForeColor="Red">

                    </asp:RegularExpressionValidator>
                </td>
            </tr>
            <!--Quentity-->
            <tr>
                <td align="center" width="50%">
                    <h3>Sarees Quantity:</h3>

                </td>
                <td width="50%">
                    <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                         ErrorMessage="Quantity is mandatory" ControlToValidate="txtQuantity" Display="Dynamic"
                         ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                         ErrorMessage="Quantity is invalid" ControlToValidate="txtQuantity" Display="Dynamic"
                         ValidationExpression="[0-9]*" ForeColor="Red">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <!--button-->
            <tr>
                <td align="center" width="50%" colspan="2">
                    <asp:Button ID="btnSubmit" runat="server" Text="Add" Font-Bold="True" ForeColor="Black"
                         Width="88px" Height="36px" OnClick="btnSubmit_Click" />
                </td>
            </tr>
            <!--label-->
            <tr>
                <td align="center" width="50%" colspan="2">
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <!--validation summary-->
            <tr>
                <td colspan="2" align="center">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                         HeaderText="Fix the  follwing error" />
                </td>
            </tr>
        </table>
        <br />
    </div>
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mydb %>" 
            SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
    </div>
</asp:Content>

