using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class Sleep : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtDate.Text = DateTime.Today.ToString("yyyy-MM-dd");
    }

    protected void btnSleep_Click(object sender, EventArgs e)
    {
        string name = Session["Username"].ToString();
       

        DateTime t1 = Convert.ToDateTime(txtSleep.Text);
        DateTime t2 = Convert.ToDateTime(txtWake.Text);
        DateTime date1 = DateTime.Parse(txtWake.Text);
        DateTime date2 = DateTime.Parse(txtSleep.Text);

        TimeSpan ts = t2.Subtract(t1);

        string time = Convert.ToString(ts);
        lblTime.Text = time;

        SqlConnection enterData = new SqlConnection(SqlDataSource1.ConnectionString);
        SqlCommand data = new SqlCommand();
        data.CommandType = System.Data.CommandType.Text;
        data.CommandText = "INSERT INTO [User_Sleep] (Sleep_Username,Sleep_Start,Sleep_Finish,Sleep_Total,Sleep_Date) VALUES ('" +
            name + "','" + date2 + "','" + date1 + "','" + ts + "','" + txtDate.Text + "')";

        data.Connection = enterData;
        enterData.Open();

        try
        {
            data.ExecuteNonQuery();
            lblStatus.Text = "Successfully uploaded to Database";
            lblStatus.Visible = true;
        }
        catch
        {
            lblStatus.Text = "Error in Uploading to Database";
            lblStatus.Visible = true;
        }
        finally
        {
            enterData.Close();
        }
    }

    protected void btnExit_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Home.aspx");
    }
}