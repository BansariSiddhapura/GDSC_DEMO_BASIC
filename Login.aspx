<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 49%;
        }
        .auto-style2 {
            width: 49%;
            height: 63px;
        }
        .auto-style3 {
            height: 63px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 style="text-align:center">LOGIN</h1>
    <table style="width:500px; height:157px; background-color:Highlight; padding-bottom:10px " align="center" >
        

        <tr>
            <td  style="text-align:center" class="auto-style2">
                <br />
                <b>UserName</b>
            </td>
            <td style="vertical-align:top" class="auto-style3">
                <br />
                <br />
                <asp:TextBox ID="TextBox1" runat="server"  Height="29px" Width="166px" Font-Bold="True"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="UserName is empty"
                     ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
            </td> 
        </tr>

        <tr>
            <td  style="text-align:center" class="auto-style1">
                <b>Password</b></td>
            <td style="vertical-align:top">
                <asp:TextBox ID="TextBox2" runat="server" Height="29px" Width="166px" TextMode="Password" 
                    Font-Bold="True" TabIndex="6"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Password is empty"
                     ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                <br />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center">
            <asp:Button ID="Button1" runat="server" Text="Login" Width="200px" Height="40px" OnClick="Button1_Click" />
            </td>
        </tr>

        <tr>
            <td colspan="2" style="text-align:center">
                <asp:Button ID="Button2" runat="server" Text="Cancel" Width="200px" Height="40px" OnClick="Button2_Click" />
            </td>
        </tr>
        
        <tr>
            <td colspan="2" style="text-align:center">
                <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="yellow" 
                    Font-Underline="True" OnClick="LinkButton1_Click" CausesValidation="False">Register here......!!</asp:LinkButton>
               
            </td>
        </tr>

          </table >
              <asp:Label ID="Label1" runat="server" Text="Label" Font-Size="30px"></asp:Label>
</asp:Content>

