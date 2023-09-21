<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="buynow.aspx.cs" Inherits="buynow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 489px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h1 align="center">Buy this Saree</h1>
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1"
         DataKeyField="ProductId" >
        <ItemTemplate>
            <table style="width: 100%; height: 388px;">
                <tr>
                    <td colspan="3" style="text-align: center">
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Pname") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" colspan="2" rowspan="1" style="text-align: center">
                        <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("Pimage") %>' />
                    </td>
                    <td colspan="2" rowspan="1">
                        Price:<asp:Label ID="Label4" runat="server" Text='<%# Eval("Pprice") %>'></asp:Label>
                        <br />
                        quantity:<asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Eval("Pquantity") %>'>
                        </asp:DropDownList>
                        <br />
                        Description:<asp:Label ID="Label5" runat="server" Text='<%# Eval("Pdesc") %>'></asp:Label>
                        <br />
                        Category:<asp:Label ID="Label6" runat="server" Text='<%# Eval("Pcategory") %>'></asp:Label>
                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style1" colspan="3" rowspan="1" style="text-align: center">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="buy now" />
                    </td>
                    
                </tr>
            </table>
            <br />
            <br />
        </ItemTemplate>
       
    </asp:DataList>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
         ConnectionString="<%$ ConnectionStrings:mydb %>"
         SelectCommand="SELECT * FROM [Product1] WHERE ([ProductId] = @ProductId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ProductId" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>
