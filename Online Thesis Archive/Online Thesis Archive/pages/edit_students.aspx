<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/AdminHeader.Master" AutoEventWireup="true" CodeBehind="edit_students.aspx.cs" Inherits="Online_Thesis_Archive.pages.edit_students" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Student Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">

        <h1 style="text-align:center;">UPDATE STUDENTS</h1>
    <asp:Label ID="id" runat="server" Text="Label" Visible="false"></asp:Label>
    <asp:TextBox ID="session" runat="server" Visible="false"></asp:TextBox>

        <div class="form-group">
            <asp:TextBox ID="name" CssClass="form-control" runat="server">Student Name</asp:TextBox>
        </div>

        <div class="form-group">
            <asp:TextBox ID="email" CssClass="form-control" runat="server">Email Address</asp:TextBox>
        </div>

    <asp:Button ID="btnUpdate" CssClass="btn btn-primary btn-block" runat="server" Text="Button" OnClick="btnUpdate_Click" />
</asp:Content>
