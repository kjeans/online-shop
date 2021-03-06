﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.Security;
using System.Data;
using System.Windows.Forms;
using System.Drawing;
using System.Text;


public partial class Front_End_views_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["logged_in_info"] != null)
        {
            Response.Redirect("home.aspx");
        }
        else if (Session["flash_message"] != null)
        {
            alertLabel.Text = Session["flash_message"].ToString();
            Session["flash_message"] = null;
        }

    }
    protected void submitButton_Click(object sender, EventArgs e)
    {
        int flag = 0;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["NORTHWNDConnectionString"].ConnectionString);
        string s = "select * from UDetail";
        SqlCommand com = new SqlCommand(s, con);
        con.Open();
        if (con.State == ConnectionState.Open)
        {
            SqlDataReader dtr;
            dtr = com.ExecuteReader();
            while (dtr.Read())
            {
                if (dtr[2].ToString().Equals(username.Text) && dtr[3].ToString().Equals(password.Text))
                {


                    Response.Cookies["UserId"].Value = username.Text;
                    //Response.Cookies["Pwd"].Value = password.Text;
                    //Response.Cookies["role"].Value = dtr[2].ToString();
                    //FormsAuthentication.RedirectFromLoginPage(username.Text, false);

                    Response.Cookies["UserId"].Value = dtr[7].ToString();
                    Response.Cookies["FirstName"].Value = dtr[0].ToString();
                    Session["logged_in_info"] = username.Text;                    
                    Response.Redirect("home.aspx");
                }
                else
                {
                    alertLabel.Text = "Your credential are incorrect!";
                }


            }
        }
    }
}