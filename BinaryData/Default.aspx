<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="BinaryData_Default" Title="Untitled Page" %>

<%@ Register Src="../UserControls/SectionLevelTutorialListing.ascx" TagName="SectionLevelTutorialListing"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>
        Working with Binary Data Tutorials</h2>
    <p>
        <uc1:SectionLevelTutorialListing ID="SectionLevelTutorialListing1" runat="server" />
    </p>
</asp:Content>

