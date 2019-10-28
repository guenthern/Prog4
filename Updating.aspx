<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Updating.aspx.cs" Inherits="Prog3.Updating" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%">
    <tr>
        <td>
            <asp:Label ID="Label1" runat="server" Text="ID:"></asp:Label>
            <asp:TextBox ID="txtID" runat="server" Width="137px"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="Label3" runat="server" Text="Price"></asp:Label>
            <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="Label4" runat="server" Text="Description"></asp:Label>
            <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Button ID="btnFirst" runat="server" Text="First" OnClick="btnFirst_Click" />
        </td>
        <td>
            <asp:Button ID="btnPrevious" runat="server" Text="Previous" OnClick="BtnPrevious_Click" />
        </td>
        <td>
            <asp:Button ID="btnNext" runat="server" Text="Next" OnClick="BtnNext_Click" />
        </td>
        <td>
            <asp:Button ID="btnLast" runat="server" Text="Last" OnClick="btnLast_Click" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
        </td>
        <td>
            <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
        </td>
        <td>
            <asp:Button ID="btnNew" runat="server" Text="New" OnClick="btnNew_Click" />
        </td>
        <td>
            <asp:TextBox ID="txtMessage" runat="server"></asp:TextBox>
        </td>
    </tr>
</table>
</asp:Content>
