<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/AdminHeader.Master" AutoEventWireup="true" CodeBehind="view_thesis.aspx.cs" Inherits="Online_Thesis_Archive.pages.view_thesis" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Authors
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">


    <!-- BUTTON URL -->
    <asp:Button ID="RedirectBtn" OnClick="RedirectBtn_Click" CssClass="btn btn-primary" Text="Add Students" runat="server" CommandName="Remove" />
    <!-- END BUTTON -->
    <br/><br/>
    <asp:Label ID="session" runat="server" Text="Label" Visible="false"></asp:Label>
<asp:TextBox ID="books_id" runat="server" Visible="false"></asp:TextBox>
<ul class="list-group list-group-flush">
    <li class="list-group-item"><h5>THESIS TITLE : <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h5></li>
    <li class="list-group-item"><h5>YEAR LEVEL : <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></h5></li>
    <li class="list-group-item"><h5>BATCH : <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></h5></li>
    <li class="list-group-item"><h5>DATE : <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></h5></li>
</ul>

<br/>
    <asp:GridView ID="GridView1" runat="server" CssClass="table" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="Row ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="name" HeaderText="Student Name" SortExpression="name" />
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />

            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:Button ID="editBtn" CssClass="btn btn-primary" OnClick="editBtn_Click" Text="Edit" runat="server" CommandName="Edit" />
                    <asp:Button ID="deleteBtn" CssClass="btn btn-primary" Text="Remove" runat="server" CommandName="Remove" />
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
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" CssClass="table" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Myconnection %>" SelectCommand="SELECT [id], [name], [email] FROM [students_list] WHERE ([books_id] = @books_id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="books_id" Name="books_id" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    </asp:Content>
