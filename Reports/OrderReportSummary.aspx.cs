﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class Reports_OrderReportSummary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        orderdetailssource.SelectParameters["emp"].DefaultValue = Request.Cookies["FirstName"].Value;
    }
}