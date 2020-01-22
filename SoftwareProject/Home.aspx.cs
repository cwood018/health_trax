using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblUser.Text = Session["Username"].ToString();
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Response.Redirect("./Login.aspx");
    }

    protected void btnBMI_Click(object sender, EventArgs e)
    {
        Response.Redirect("./BMI.aspx");
    }

    protected void btnNutrition_Click(object sender, EventArgs e)
    {
        Response.Redirect("./Nutrition.aspx");
    }

    protected void btnHistory_Click(object sender, EventArgs e)
    {
        Response.Redirect("./Summary.aspx");
    }

    protected void btnSleep_Click(object sender, EventArgs e)
    {
        Response.Redirect("./Sleep.aspx");
    }
}