<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Reg.aspx.cs" Inherits="Reg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 style="text-align:center">REGISTRATION FORM</h1>
    <table style="width:500px; height:500px; background-color:Highlight" align="center">
        

        <tr>
            <td  style="width:50%; text-align:center">
                <b>UserName:</b>
            </td>
            <td style="vertical-align:top">
                <asp:TextBox ID="TextBox1" runat="server"  Height="29px" Width="166px" Font-Bold="True"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="UserName is empty"
                     ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
            </td> 
        </tr>
        

        <tr>
            <td style="width:50%; text-align:center">
                <b>Email Id:</b>
            </td>
            <td style="vertical-align:top">
                <asp:TextBox ID="TextBox3" runat="server" Height="29px" Width="166px" TextMode="Email" 
                    Font-Bold="True" TabIndex="2"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox3"
                     ErrorMessage="email id is empty"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td style="width:50%; text-align:center">
                <b>Gender:</b>
            </td>
            <td style="vertical-align:top">
                <asp:DropDownList ID="DropDownList1" runat="server" Height="31px" Width="167px" TabIndex="3"
                     Font-Bold="True">
                    <asp:ListItem Value="select gender">select gender</asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>female</asp:ListItem>
                    <asp:ListItem>other</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                     ErrorMessage="select gender" ControlToValidate="DropDownList1" InitialValue="select gender"></asp:RequiredFieldValidator>
            </td>

        </tr>

        <tr>
            <td  style="width:50%; text-align:center">
                <b>Address:</b>
            </td>
            <td style="vertical-align:top">
                <asp:TextBox ID="TextBox5" runat="server" Height="32px" Width="166px" TextMode="MultiLine" 
                    Font-Bold="True" TabIndex="4"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Address is empty"
                     ControlToValidate="TextBox5"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td style="width:50%; text-align:center">
                <b>Phone no:</b>
            </td>
            <td style="vertical-align:top">
                <asp:TextBox ID="TextBox6" runat="server" Height="29px" Width="166px" TextMode="Number" 
                    Font-Bold="True" TabIndex="5"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Phone no is empty"

                     ControlToValidate="TextBox6"></asp:RequiredFieldValidator>

                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                     ErrorMessage="invalid phone number" ControlToValidate="TextBox6" 
                    ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
            </td>
        </tr>

        <tr>
            <td  style="width:50%; text-align:center">
                <b>Password:</b>
            </td>
            <td style="vertical-align:top">
                <asp:TextBox ID="TextBox7" runat="server" Height="29px" Width="166px" TextMode="Password" 
                    Font-Bold="True" TabIndex="6"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Password is empty"
                     ControlToValidate="TextBox7"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td  style="width:50%; text-align:center">
                <b>Confirm password:</b>
            </td>
            <td style="vertical-align:top">
                <asp:TextBox ID="TextBox8" runat="server" Height="29px" Width="166px" TextMode="Password" 
                    Font-Bold="True" TabIndex="7"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Confirm password is empty"
                     ControlToValidate="TextBox8"></asp:RequiredFieldValidator>

                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password not match" 
                    ControlToCompare="TextBox7" ControlToValidate="TextBox8"></asp:CompareValidator>
            </td>
        </tr>

        <tr>
            <td colspan="2"  style="text-align:center">
                <asp:Button ID="ButtonSub" runat="server" Text="Register" Height="49px" Width="299px" TabIndex="8"
                    Font-Bold="True" Font-Underline="True" OnClick="ButtonSub_Click" />
            </td>
        </tr>

        <tr>
            <td colspan="3">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Fill all the errors" Font-Bold="True" />
            </td>
        </tr>

        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="#FF66FF" Font-Bold="True"></asp:Label>
            </td>

            <td align:"right">
                <asp:HyperLink ID="HyperLink1" runat="server" Font-Italic="True" Font-Bold="True"
                     NavigateUrl="Login.aspx" ForeColor="White">Already Registered...??click here..</asp:HyperLink>
            </td>
        </tr>
    </table>

</asp:Content>

