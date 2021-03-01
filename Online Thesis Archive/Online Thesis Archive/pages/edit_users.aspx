<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/AdminHeader.Master" AutoEventWireup="true" CodeBehind="edit_users.aspx.cs" Inherits="Online_Thesis_Archive.pages.edit_users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Users Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">

    <h1 style="text-align:center;">UPDATE USERS</h1>
    <asp:Label ID="session" runat="server" Text="Label" Visible="false"></asp:Label>
    <asp:TextBox ID="users_id" runat="server" Visible="false"></asp:TextBox>

        <div class="form-group">
            <asp:TextBox ID="username" CssClass="form-control" runat="server" placeholder="Username"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:TextBox ID="password" Type="password" CssClass="form-control" runat="server" placeholder="Password"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:DropDownList CssClass="form-control" ID="accessLvl" runat="server">
                <asp:ListItem Selected="True">Select Access</asp:ListItem>
                <asp:ListItem>Administrator</asp:ListItem>
                <asp:ListItem>Students</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <asp:DropDownList CssClass="form-control" ID="statusLvl" runat="server">
                <asp:ListItem Selected="True">Select Status</asp:ListItem>
                <asp:ListItem>Activate</asp:ListItem>
                <asp:ListItem>Deactivate</asp:ListItem>
            </asp:DropDownList>
        </div>

    <asp:Button ID="btnUpdate" CssClass="btn btn-primary btn-block"  runat="server" Text="Save" OnClick="btnAdd_Click"/>
</asp:Content>
