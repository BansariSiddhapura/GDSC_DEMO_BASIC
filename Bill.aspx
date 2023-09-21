<%@ Page Title="" Language="C#" MasterPageFile="~/Default.master" AutoEventWireup="true" CodeFile="Bill.aspx.cs" Inherits="Bill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server">

        <table style="width: 100%;">
            <tr>
                <td style="text-align:center">
                    <h2 style="text-align:center">Bill</h2>
                </td>
            </tr>

            <tr>
                <td>Order No:
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    <br />
                    <br />
                    Order Date:
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                        
                    <table>
                        <tr>
                            <td style="width:40%">Buyer Address:
                                <br />
                                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>Seller Address:
                                <br />
                                <br />
                                Lab ma contact us me address lakhyu hoi te....

                            </td>
                        </tr>
                    </table>
                </td>    
            </tr>

            <tr
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="1000px">
                        <Columns>

                            <asp:BoundField DataField="sno" HeaderText="SNo">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="productid" HeaderText="Product Id">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="productname" HeaderText="Product Name">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="quantity" HeaderText="Quantity">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="price" HeaderText="Price">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="totalprice" HeaderText="Total Price">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
                    Grand Total:
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

