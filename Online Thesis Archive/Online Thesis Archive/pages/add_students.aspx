<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/AdminHeader.Master" AutoEventWireup="true" CodeBehind="add_students.aspx.cs" Inherits="Online_Thesis_Archive.pages.add_students" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Student Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">

    <h1 style="text-align:center;">ADD STUDENTS</h1>
    <asp:Label ID="session" runat="server" Text="Label" Visible="false"></asp:Label>
    <asp:TextBox ID="book_id" runat="server" Visible="false"></asp:TextBox>

        <div class="form-group">
            <asp:TextBox ID="name" CssClass="form-control" runat="server">Student Name</asp:TextBox>
        </div>

        <div class="form-group">
            <asp:TextBox ID="email" CssClass="form-control" runat="server">Email Address</asp:TextBox>
        </div>

    <asp:Button ID="btnAdd" CssClass="btn btn-primary btn-block"  runat="server" Text="Save" OnClick="btnAdd_Click" />


</asp:Content>
