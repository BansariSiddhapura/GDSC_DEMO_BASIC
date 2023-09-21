<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AddCategory.aspx.cs" Inherits="AddCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <div class="navbar" style="border-width:3px;border-color:black;height:460px">

            <table style="width:360px; height:410px; border:1px solid blue;" align="center">
                <!--Header text-->
                <tr>
                    <td colspan="2" align="center">
                        <h2>Add Category</h2>
                    </td>
                </tr>
                <!--category with req field validator-->
                <tr>
                    <td>
                    <b style="font-size:21px; font-weight:bold">Category:</b>

                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Height="44px" Width="230px" CausesValidation="True" 
                            Font-Bold="True" Font-Size="Medium"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter category name"
                             ControlToValidate="TextBox1" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </td>
                 </tr>
                <!--button-->
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="Button1" runat="server" Text="Add" Width="80px" Height="44px" Font-Bold="True" Font-Size="Medium"
                             BackColor="#00CC66" ForeColor="#990033" OnClick="Button1_Click"></asp:Button>
                    </td>

                </tr>
             
            </table>
            <br /><br />
        </div>
    </center>
</asp:Content>

