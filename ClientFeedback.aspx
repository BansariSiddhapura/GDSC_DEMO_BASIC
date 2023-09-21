<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="ClientFeedback.aspx.cs" Inherits="ClientFeedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 300px;
        }
        .auto-style2 {
            width: 472px;
            height: 36px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 align="center">FeedBack</h1>
    <p align="center">&nbsp;</p>
    <table align="center" border="4" style="background-color:blueviolet">
        <tr>
            <td class="auto-style1" align="center">
                <asp:Label ID="lblnm" runat="server" Text="Name:"></asp:Label>
                </td>
            <td>
                <asp:TextBox ID="txtnm" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtnm" ErrorMessage="enter name"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1" align="center">
                <asp:Label ID="lbladd" runat="server" Text="Address:"></asp:Label>
                </td>
            <td>
                <asp:TextBox ID="txtadd" runat="server" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtadd" ErrorMessage="enter address"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1" align="center">
                <asp:Label ID="lblcity" runat="server" Text="City:"></asp:Label>
                </td>
            <td>
                <asp:TextBox ID="txtcity" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtcity" ErrorMessage="enter city"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1" align="center">
                <asp:Label ID="lbleid" runat="server" Text="Email_id:"></asp:Label>
                </td>
            <td>
                <asp:TextBox ID="txteid" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txteid" ErrorMessage="enter Email_id"></asp:RequiredFieldValidator>
                
            </td>
        </tr>
        <tr>
            <td class="auto-style1" align="center">
                <asp:Label ID="lblcon" runat="server" Text="Contact No:"></asp:Label>
                </td>
            <td>
                <asp:TextBox ID="txtcon" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtcon" ErrorMessage="enter phone number"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                     ErrorMessage="invalid phone number" ControlToValidate="txtcon" 
                    ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1" align="center">
                <asp:Label ID="lblcomm" runat="server" Text="Comments:"></asp:Label>
                </td>
            <td>
                <asp:TextBox ID="txtcomm" runat="server" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txtcomm" ErrorMessage="enter comments"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2"  align="center" >
                <asp:Button ID="btnsubmit" runat="server" Text="Submit" 
                    OnClick="btnsubmit_Click" Height="40px" Width="150px" BackColor="#009933"
                     Font-Bold="True" ForeColor="Black" />
            </td>
            
        </tr>
        <tr>
            <td colspan="2"  align="center">
                <asp:Button ID="btncancel" runat="server" Text="cancel" 
                    OnClick="btncancel_Click" Height="40px" Width="150px" 
                    BackColor="Red" Font-Bold="True" ForeColor="white"  />
            </td>
            
        </tr>
    </table>
    <br />
    <br />
</asp:Content>

