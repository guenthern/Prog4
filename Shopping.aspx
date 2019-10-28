<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Shopping.aspx.cs" Inherits="Prog3.Shopping" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%">
    <tr>
        <td class="auto-style1">
            <asp:Label ID="Label1" runat="server" Text="Order ID:"></asp:Label>
            <asp:TextBox ID="txtOrderID" runat="server" OnTextChanged="text_changed"></asp:TextBox>
        </td>
        <td class="auto-style1">
            <asp:Label ID="Label2" runat="server" Text="Price:"></asp:Label>
            <asp:TextBox ID="txtPrice" runat="server" ReadOnly="True"></asp:TextBox>
        </td>
        <td class="auto-style1">
            <asp:Label ID="Label3" runat="server" Text="Quantity"></asp:Label>
            <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtQuantity" ErrorMessage="Quantity is required" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtQuantity" ErrorMessage="non-negative number " Font-Size="Small" ForeColor="Red" Operator="GreaterThan" Type="Integer" ValueToCompare="-1"></asp:CompareValidator>
        </td>
        <td class="auto-style1">
            <asp:Label ID="Label4" runat="server" Text="Name:" OnDataBinding="text_changed"></asp:Label>
            <asp:TextBox ID="txtName" runat="server" ReadOnly="True"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label5" runat="server" Text="Sub Total:"></asp:Label>
            <asp:TextBox ID="txtSub" runat="server" ReadOnly="True"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="Label6" runat="server" Text="Tax:"></asp:Label>
            <asp:TextBox ID="txtTax" runat="server" ReadOnly="True"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="Label7" runat="server" Text="Grand Total:"></asp:Label>
            <asp:TextBox ID="txtGrand" runat="server" ReadOnly="True"></asp:TextBox>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Button ID="btnCompute" runat="server" OnClick="btnCompute_Click" Text="Compute" />
        </td>
        <td>&nbsp;</td>
        <td>
            <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" />
        </td>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>
