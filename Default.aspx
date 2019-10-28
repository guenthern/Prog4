<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Prog3.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ProductID" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." style="margin-left: 13px" Width="963px" AllowPaging="True" CellPadding="4" EnablePersistedSelection="True" EnableSortingAndPagingCallbacks="True" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" PageSize="5">
        <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="ProductID" HeaderText="ProductID" ReadOnly="True" SortExpression="ProductID" >
        <ItemStyle HorizontalAlign="Center" Width="10%" />
        </asp:BoundField>
        <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" >
        <ItemStyle HorizontalAlign="Left" Width="20%" />
        </asp:BoundField>
        <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" DataFormatString="{0:c}" >
        <ItemStyle HorizontalAlign="Right" Width="10%" />
        </asp:BoundField>
        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" >
        <ItemStyle HorizontalAlign="Right" Width="10%" />
        </asp:BoundField>
    </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NextPreviousFirstLast" NextPageText="Next" PreviousPageText="Previous" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UWPCS3870ConnectionString1 %>" DeleteCommand="DELETE FROM [Product] WHERE [ProductID] = @ProductID" InsertCommand="INSERT INTO [Product] ([ProductID], [ProductName], [UnitPrice], [Description]) VALUES (@ProductID, @ProductName, @UnitPrice, @Description)" SelectCommand="SELECT * FROM [Product]" UpdateCommand="UPDATE [Product] SET [ProductName] = @ProductName, [UnitPrice] = @UnitPrice, [Description] = @Description WHERE [ProductID] = @ProductID">
    <DeleteParameters>
        <asp:Parameter Name="ProductID" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="ProductID" Type="String" />
        <asp:Parameter Name="ProductName" Type="String" />
        <asp:Parameter Name="UnitPrice" Type="Decimal" />
        <asp:Parameter Name="Description" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="ProductName" Type="String" />
        <asp:Parameter Name="UnitPrice" Type="Decimal" />
        <asp:Parameter Name="Description" Type="String" />
        <asp:Parameter Name="ProductID" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
