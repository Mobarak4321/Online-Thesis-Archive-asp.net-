<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/AdminHeader.Master" AutoEventWireup="true" CodeBehind="archive.aspx.cs" Inherits="Online_Thesis_Archive.pages.archive" %>


<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Online Thesis Archive
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">


    <!-- BUTTON URL -->
        <asp:Button ID="addThesis" CssClass="btn btn-success" OnClick="addThesis_Click"  runat="server" Text="Add Thesis" />
    <!-- END BUTTON -->

    <br />
    <br />
    <!-- LIST OF THESIS TITLE -->

    <asp:Label ID="session" runat="server" Text="Label" Visible="false"></asp:Label>
    <asp:Label ID="access" runat="server" Text="Label" Visible="false"></asp:Label>
    <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="books_id" DataSourceID="SqlDataSource1" GridLines="None" CellPadding="4" ForeColor="#333333" OnRowDataBound="GridView1_RowDataBound">
        <AlternatingRowStyle BackColor="White" />
        

        <Columns>
            <asp:BoundField DataField="books_id" HeaderText="Row ID" SortExpression="title" />
            <asp:BoundField DataField="title" HeaderText="Thesis Title" SortExpression="title" />
            <asp:BoundField DataField="year" HeaderText="Year Level" SortExpression="year" />
            <asp:BoundField DataField="batch" HeaderText="Batch" SortExpression="batch" />
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:Button ID="EditBtn" CssClass="btn btn-primary" OnClick="EditBtn_Click" Text="EDIT" runat="server" CommandName="Edit" />
                    <asp:Button ID="ViewBtn" CssClass="btn btn-primary" OnClick="ViewBtn_Click" Text="VIEW" runat="server" CommandName="View" />
                <asp:Button ID="DownloadBtn" CssClass="btn btn-primary" OnClick="DownloadBtn_Click" Text="DOWNLOAD" runat="server" CommandName="Download" />
                </ItemTemplate>
                <FooterStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>

        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle HorizontalAlign="Center" CssClass="table table-primary" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />

    </asp:GridView>
    <!-- END OF LIST -->

    <!-- GRID DATA SOURCE -->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Myconnection %>" SelectCommand="SELECT [books_id], [title], [year], [batch] FROM [archive_list] ORDER BY [books_id]"></asp:SqlDataSource>
    <!-- END DATA SOURCE -->
    

</asp:Content>
