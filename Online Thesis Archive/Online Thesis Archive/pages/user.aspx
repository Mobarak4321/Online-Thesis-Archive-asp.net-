<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/AdminHeader.Master" AutoEventWireup="true" CodeBehind="user.aspx.cs" Inherits="Online_Thesis_Archive.pages.user" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Users List
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">

    <asp:Label ID="session" runat="server" Text="Label" Visible="False"></asp:Label>

    <!-- BUTTON URL -->
    <asp:Button ID="addUser" OnClick="addUser_Click" CssClass="btn btn-success" runat="server" Text="Add User" />
    <!-- END BUTTON -->

    <br />
    <br />
    <!-- LIST OF THESIS TITLE -->

    <asp:GridView ID="GridView1" runat="server" CssClass="table" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataUsersList" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="users_id" HeaderText="Row ID" InsertVisible="False" ReadOnly="True" SortExpression="users_id" />
            <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
            <asp:BoundField DataField="password" HeaderText="Password" SortExpression="password" />
            <asp:BoundField DataField="access" HeaderText="Access" SortExpression="access" />
            <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:Button ID="UpdateBtn" OnClick="UpdateBtn_Click" CssClass="btn btn-primary" Text="EDIT" runat="server" CommandName="Edit" />
                    <asp:Button ID="RemoveBtn" OnClick="RemoveBtn_Click" CssClass="btn btn-primary" Text="VIEW" runat="server" CommandName="Removed" />
                </ItemTemplate>
                <FooterStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataUsersList" runat="server" ConnectionString="<%$ ConnectionStrings:Myconnection %>" SelectCommand="SELECT * FROM [users_list] ORDER BY [users_id], [username]"></asp:SqlDataSource>
</asp:Content>
