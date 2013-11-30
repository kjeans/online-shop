﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="OrderReportSummary.aspx.cs" Inherits="Reports_OrderReportSummary" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Height="458px" 
        Width="994px">
        <LocalReport ReportPath="Reports\Report6.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="orderdetailssource" Name="DataSet1" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:SqlDataSource ID="orderdetailssource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" 
        SelectCommand="SELECT UDetail.*, Products.*, OrderDetails.*, Orders.* FROM OrderDetails INNER JOIN Orders ON OrderDetails.OrderID = Orders.OrderID INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID INNER JOIN UDetail ON Orders.UserId = UDetail.ID">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
</asp:Content>

