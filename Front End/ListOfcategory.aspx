﻿<%@ Page Title="" Language="C#" MasterPageFile="~/FrontMaster.master" AutoEventWireup="true" CodeFile="ListOfcategory.aspx.cs" Inherits="Front_End_ListOfcategory" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <div id="menu">
		<ul>
			<li class="first"><a href="Home.aspx"><b>Home</b></a>
            <li class="second"><a href="Products.aspx"><b>Products</b></a>
            <%--<li class="third"><a href=""><b>My Cart</b></a>--%>
              <li><a href="#"><span class="fourth">Accessibility<b></b></span></a>
				    <ul>
					<li><a href="Login.aspx">Login</a></li>
					<li><a href="Register.aspx">Register</a></li>
                    <li><a href="Help.aspx">Help</a></li>
					</ul>
                    </li> 
		</ul>
		<br class="clearfix" />
</div>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    </br>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" BackColor="White" 
        BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
        DataKeyNames="CategoryID" GridLines="Horizontal">
        <Columns>
            <asp:HyperLinkField 
                DataTextField="CategoryName" HeaderText="Category" NavigateUrl="~/Front End/" 
                SortExpression="CategoryName" 
                DataNavigateUrlFormatString="TrialListOfCategory.aspx?id={0}" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#487575" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#275353" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" 
        
        SelectCommand="SELECT [CategoryName], [Picture], [CategoryID] FROM [Categories]">
    </asp:SqlDataSource>
    </br>

    </asp:Content>






