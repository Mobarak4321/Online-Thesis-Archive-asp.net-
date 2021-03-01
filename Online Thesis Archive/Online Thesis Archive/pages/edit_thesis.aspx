<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/AdminHeader.Master" AutoEventWireup="true" CodeBehind="edit_thesis.aspx.cs" Inherits="Online_Thesis_Archive.pages.edit_thesis" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Thesis Archive
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">

    <asp:Label ID="session" runat="server" Text="Label" Visible="False"></asp:Label>

    <h1 style="text-align:center;">UPDATE BOOKS</h1>
        <div class="form-group">
            <asp:TextBox ID="book_id" CssClass="form-control" runat="server" Visible="false">ID</asp:TextBox>
            <asp:TextBox ID="title" CssClass="form-control" runat="server">Thesis Title</asp:TextBox>
        </div>
    
        <div class="form-group" title="Select Batch">
            <asp:DropDownList CssClass="form-control" ID="yearLvl" runat="server">
                <asp:ListItem Selected="True">Select Year Level</asp:ListItem>
                <asp:ListItem>1st Year</asp:ListItem>
                <asp:ListItem>2nd Year</asp:ListItem>
                <asp:ListItem>3rd Year</asp:ListItem>
                <asp:ListItem>4th Year</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <asp:DropDownList CssClass="form-control" ID="batchLvl" runat="server">
                <asp:ListItem Selected="True">Select Batch</asp:ListItem>
                <asp:ListItem>Alpha</asp:ListItem>
                <asp:ListItem>Beta</asp:ListItem>
                <asp:ListItem>Charlie</asp:ListItem>
                <asp:ListItem>Delta</asp:ListItem>
                <asp:ListItem>Echo</asp:ListItem>
                <asp:ListItem>Falcon</asp:ListItem>
                <asp:ListItem>George</asp:ListItem>
                <asp:ListItem>Harold</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <asp:FileUpload ID="Filesave" CssClass="form-control-file" runat="server" />
        </div>

        <asp:Button ID="btnUodate" CssClass="btn btn-primary btn-block" runat="server" OnClick="btnUodate_Click" Text="Save" />

</asp:Content>
