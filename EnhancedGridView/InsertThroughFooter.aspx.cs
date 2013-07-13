using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class EnhancedGridView_InsertThroughFooter : System.Web.UI.Page
{
    private bool SendUserToLastPage = false;

    protected void Products_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        // Insert data if the CommandName == "Insert" and the validation controls indicate valid data...
        if (e.CommandName == "Insert" && Page.IsValid)
        {
            // Insert new record
            ProductsDataSource.Insert();

            // Indicate that the user needs to be sent to the last page
            SendUserToLastPage = true;
        }
    }

    protected void Products_DataBound(object sender, EventArgs e)
    {
        // Send user to last page of data, if needed
        if (SendUserToLastPage)
            Products.PageIndex = Products.PageCount - 1;
    }

    protected void ProductsDataSource_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        // Programmatically reference Web controls in the inserting interface...
        TextBox NewProductName = (TextBox)Products.FooterRow.FindControl("NewProductName");
        DropDownList NewCategoryID = (DropDownList)Products.FooterRow.FindControl("NewCategoryID");
        DropDownList NewSupplierID = (DropDownList)Products.FooterRow.FindControl("NewSupplierID");
        TextBox NewQuantityPerUnit = (TextBox)Products.FooterRow.FindControl("NewQuantityPerUnit");
        TextBox NewUnitPrice = (TextBox)Products.FooterRow.FindControl("NewUnitPrice");
        TextBox NewUnitsInStock = (TextBox)Products.FooterRow.FindControl("NewUnitsInStock");
        TextBox NewUnitsOnOrder = (TextBox)Products.FooterRow.FindControl("NewUnitsOnOrder");
        TextBox NewReorderLevel = (TextBox)Products.FooterRow.FindControl("NewReorderLevel");
        CheckBox NewDiscontinued = (CheckBox)Products.FooterRow.FindControl("NewDiscontinued");

        // Set the ObjectDataSource's InsertParameters values...
        e.InputParameters["productName"] = NewProductName.Text;
        
        e.InputParameters["supplierID"] = Convert.ToInt32(NewSupplierID.SelectedValue);
        e.InputParameters["categoryID"] = Convert.ToInt32(NewCategoryID.SelectedValue);
        
        string quantityPerUnit = null;
        if (!string.IsNullOrEmpty(NewQuantityPerUnit.Text))
            quantityPerUnit = NewQuantityPerUnit.Text;
        e.InputParameters["quantityPerUnit"] = quantityPerUnit;

        decimal? unitPrice = null;
        if (!string.IsNullOrEmpty(NewUnitPrice.Text))
            unitPrice = Convert.ToDecimal(NewUnitPrice.Text);
        e.InputParameters["unitPrice"] = unitPrice;

        short? unitsInStock = null;
        if (!string.IsNullOrEmpty(NewUnitsInStock.Text))
            unitsInStock = Convert.ToInt16(NewUnitsInStock.Text);
        e.InputParameters["unitsInStock"] = unitsInStock;

        short? unitsOnOrder = null;
        if (!string.IsNullOrEmpty(NewUnitsOnOrder.Text))
            unitsOnOrder = Convert.ToInt16(NewUnitsOnOrder.Text);
        e.InputParameters["unitsOnOrder"] = unitsOnOrder;

        short? reorderLevel = null;
        if (!string.IsNullOrEmpty(NewReorderLevel.Text))
            reorderLevel = Convert.ToInt16(NewReorderLevel.Text);
        e.InputParameters["reorderLevel"] = reorderLevel;
        
        e.InputParameters["discontinued"] = NewDiscontinued.Checked;
    }
}
