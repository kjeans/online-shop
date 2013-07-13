<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="InsertThroughFooter.aspx.cs" Inherits="EnhancedGridView_InsertThroughFooter" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>
        Add a New Record</h2>
    <p>
        <asp:GridView ID="Products" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID"
            DataSourceID="ProductsDataSource" AllowPaging="True" ShowFooter="True" OnRowCommand="Products_RowCommand"
            EnableViewState="False" OnDataBound="Products_DataBound">
            <Columns>
                <asp:TemplateField HeaderText="ProductID" InsertVisible="False" SortExpression="ProductID">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ProductID") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <FooterTemplate>
                        <asp:Button ID="AddProduct" runat="server" CommandName="Insert" Text="Add" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Product" SortExpression="ProductName">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("ProductName") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="NewProductName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NewProductName"
                            Display="Dynamic" ErrorMessage="You must enter a name for the new product." ForeColor="">*</asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <FooterStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Category" SortExpression="CategoryName">
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("CategoryName") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="NewCategoryID" runat="server" DataSourceID="CategoriesDataSource"
                            DataTextField="CategoryName" DataValueField="CategoryID">
                        </asp:DropDownList><asp:ObjectDataSource ID="CategoriesDataSource" runat="server"
                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetCategories" TypeName="CategoriesBLL">
                        </asp:ObjectDataSource>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Supplier" SortExpression="SupplierName">
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("SupplierName") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="NewSupplierID" runat="server" DataSourceID="SuppliersDataSource"
                            DataTextField="CompanyName" DataValueField="SupplierID">
                        </asp:DropDownList><asp:ObjectDataSource ID="SuppliersDataSource" runat="server"
                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetSuppliers" TypeName="SuppliersBLL">
                        </asp:ObjectDataSource>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Qty/Unit" SortExpression="QuantityPerUnit">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("QuantityPerUnit") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="NewQuantityPerUnit" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Price" SortExpression="UnitPrice">
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("UnitPrice", "{0:c}") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        $<asp:TextBox ID="NewUnitPrice" runat="server" Columns="8"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="NewUnitPrice"
                            ErrorMessage="You must enter a valid currency value greater than or equal to 0.00. Do not include the currency symbol."
                            ForeColor="" Operator="GreaterThanEqual" Type="Currency" ValueToCompare="0" Display="Dynamic">*</asp:CompareValidator>
                    </FooterTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                    <FooterStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Units In Stock" SortExpression="Units In Stock">
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("UnitsInStock") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="NewUnitsInStock" runat="server" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="NewUnitsInStock"
                            Display="Dynamic" ErrorMessage="You must enter a valid numeric value for units in stock that's greater than or equal to zero."
                            ForeColor="" Operator="GreaterThanEqual" Type="Integer" ValueToCompare="0">*</asp:CompareValidator>
                    </FooterTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                    <FooterStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Units On Order" SortExpression="UnitsOnOrder">
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("UnitsOnOrder") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="NewUnitsOnOrder" runat="server" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="NewUnitsOnOrder"
                            Display="Dynamic" ErrorMessage="You must enter a valid numeric value for units on order that's greater than or equal to zero."
                            ForeColor="" Operator="GreaterThanEqual" Type="Integer" ValueToCompare="0">*</asp:CompareValidator>
                    </FooterTemplate>
                    <ItemStyle HorizontalAlign="Right" />
                    <FooterStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Reorder Level" SortExpression="ReorderLevel">
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("ReorderLevel") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="NewReorderLevel" runat="server" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="NewReorderLevel"
                            Display="Dynamic" ErrorMessage="You must enter a valid numeric value for reorder level that's greater than or equal to zero."
                            ForeColor="" Operator="GreaterThanEqual" Type="Integer" ValueToCompare="0">*</asp:CompareValidator>
                    </FooterTemplate>
                    <FooterStyle Wrap="False" />
                    <ItemStyle HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Discontinued" SortExpression="Discontinued">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Discontinued") %>'
                            Enabled="false" />
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:CheckBox ID="NewDiscontinued" runat="server" />
                    </FooterTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                    <FooterStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        &nbsp;&nbsp;
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
            ShowSummary="False" />
        <p>
        <asp:ObjectDataSource ID="ProductsDataSource" runat="server" InsertMethod="AddProduct"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetProducts" TypeName="ProductsBLL" OnInserting="ProductsDataSource_Inserting">
            <InsertParameters>
                <asp:Parameter Name="productName" Type="String" />
                <asp:Parameter Name="supplierID" Type="Int32" />
                <asp:Parameter Name="categoryID" Type="Int32" />
                <asp:Parameter Name="quantityPerUnit" Type="String" />
                <asp:Parameter Name="unitPrice" Type="Decimal" />
                <asp:Parameter Name="unitsInStock" Type="Int16" />
                <asp:Parameter Name="unitsOnOrder" Type="Int16" />
                <asp:Parameter Name="reorderLevel" Type="Int16" />
                <asp:Parameter Name="discontinued" Type="Boolean" />
            </InsertParameters>
        </asp:ObjectDataSource>
    </p>
</asp:Content>

