<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="DefaultHome.aspx.cs" Inherits="DefaultHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
 <table style=" background-position: center bottom; width:1197px; height:450px; text-align: center;
  background-repeat: no-repeat; background-attachment: inherit;  background-color: #00FF00;">

     <tr style="background-color:#FF00FF; text-align:center; width:100%">
         <!--login and logout button-->
         <td colspan="2" style="text-align:center">
             <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="40px"></asp:Label>
             <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" NavigateUrl="Login.aspx">Click to Login
             </asp:HyperLink>
             <br />
             <asp:Button ID="Button1" runat="server" Text="logout" BackColor="#FF9999" Font-Bold="True" 
                 ForeColor="#0033CC" Height="27px" Width="105px" OnClick="Button1_Click" />

         </td>
        <!-- data to display products-->
    <!--<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        
        
     SelectCommand="SELECT * FROM [Product1]" ConnectionString="<%$ ConnectionStrings:mydb %>"   >

    </asp:SqlDataSource>-->
         </tr>
         </table>
</asp:Content>

