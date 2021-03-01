<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/AdminHeader.Master" AutoEventWireup="true" CodeBehind="add_users.aspx.cs" Inherits="Online_Thesis_Archive.pages.add_users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Users Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">


    <h1 style="text-align:center;">ADD USERS</h1>
    <asp:Label ID="session" runat="server" Text="Label" Visible="false"></asp:Label>
    


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

    <asp:Button ID="btnAdd" CssClass="btn btn-primary btn-block" OnClick="btnAdd_Click"  runat="server" Text="Save"/>
</asp:Content>
