<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/UnloginHeader.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Online_Thesis_Archive.index" %>


<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Online Thesis Archive
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
   
    <br />

    <!-- SEARCH FORM -->
    <div class="form-inline my-2 my-lg-0">
        <asp:TextBox ID="textSearch" CssClass="form-control mr-sm-1" placeholder="Search Thesis Title" runat="server"></asp:TextBox>
        <asp:Button ID="btnSearch" OnClick="btnSearch_Click" CssClass="btn btn-secondary my-2 my-sm-0" runat="server" Text="Search" />
    </div>
    <!-- END SEARCH -->
    <br/>
    
    <!-- LIST OF THESIS TITLE -->
    <asp:GridView ID="GridView1" CssClass="table table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="books_id" DataSourceID="SqlDataFill" BorderStyle="None" GridLines="None">
        <Columns>
            <asp:BoundField DataField="title" HeaderText="Thesis Title" SortExpression="title" />
            <asp:BoundField DataField="year" HeaderText="Year Level" SortExpression="year" />
            <asp:BoundField DataField="batch" HeaderText="Batch" SortExpression="batch" />
            <asp:BoundField DataField="date_added" HeaderText="Date" SortExpression="date_added" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:Button ID="btnDownload" OnClick="btnDownload_Click" CssClass="btn btn-primary" CommandName="Download" Text="DOWNLOAD" runat="server" Font-Names="Arial" />
                </ItemTemplate>
                <FooterStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>

        </Columns>
        <HeaderStyle HorizontalAlign="Center" CssClass="table table-primary" />
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataFill" runat="server" ConnectionString="<%$ ConnectionStrings:Myconnection %>" SelectCommand="SELECT [books_id], [year], [title], [batch], [date_added], [file_name] FROM [archive_list] ORDER BY [title]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSearch" runat="server" ConnectionString="<%$ ConnectionStrings:Myconnection %>" SelectCommand="SELECT [books_id], [title], [year], [batch], [date_added], [file_name] FROM [archive_list] WHERE (([title] LIKE '%' + @title + '%') OR ([batch] LIKE '%' + @batch + '%') OR ([year] LIKE '%' + @year + '%')) ORDER BY [title]">
        <SelectParameters>
            <asp:ControlParameter ControlID="textSearch" Name="title" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="textSearch" Name="batch" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="textSearch" Name="year" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <!-- END OF LIST -->

</asp:Content>
