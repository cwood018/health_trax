using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class BMI : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string name = Session["Username"].ToString();
        txtDate.Text = DateTime.Today.ToString("yyyy-MM-dd");

        SqlConnection db = new SqlConnection(SqlDataSource1.ConnectionString);

        SqlCommand checkdb = new SqlCommand();

        checkdb.CommandType = System.Data.CommandType.Text;

        checkdb.CommandText = "Select * from [User_Registration] where User_Username = '" + name+ "'";

        checkdb.Connection = db;
        try
        {
            db.Open();
            using (SqlDataReader read = checkdb.ExecuteReader())
            {
                while (read.Read())
                {
                    txtUser.Text = (read["User_Username"].ToString());
                    txtAge.Text = (read["User_Age"].ToString());
                    txtGender.Text = (read["User_Gender"].ToString());
                }
            }
        }
        finally
        {
            db.Close();
        }

    }

    protected void btnBMI_Click(object sender, EventArgs e)
    {
        int height = Convert.ToInt32(txtHeight.Text);
        int weight = Convert.ToInt32(txtWeight.Text);

        double x = weight * 703;
        double y = height * height;
        double z = (x / y);
        int CalcBMI = Convert.ToInt32(z);
       string BMI = Convert.ToString(CalcBMI);

        lblBMI.Text = BMI;
        lblBMI.Visible = true;

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        int num = Convert.ToInt32(lblBMI.Text);
        int height = Convert.ToInt32(txtHeight.Text);
        int weight = Convert.ToInt32(txtWeight.Text);
        int age = Convert.ToInt32(txtAge.Text);
        SqlConnection db = new SqlConnection(SqlDataSource2.ConnectionString);

        SqlCommand checkdb = new SqlCommand();
        checkdb.CommandType = System.Data.CommandType.Text;
        checkdb.CommandText = "INSERT INTO[User_BMI] (BMI_Username, BMI_Age, BMI_Gender, BMI_Height, BMI_Weight, BMI_Date, BMI_BMI) VALUES('" +
            txtUser.Text + "','" + age + "','" + txtGender.Text + "','" + height + "','" + weight + "','" + txtDate.Text + "','" + num + "')";

        checkdb.Connection = db;

        db.Open();
        try
        {
            checkdb.ExecuteNonQuery();
            lblDB.Text = "Upload Successful";
            lblDB.Visible = true;
        }
        catch
        {
            lblDB.Text = "Database Uplaod Failure";
            lblDB.Visible = true;
        }
        finally
        {
            db.Close();
            Response.Redirect("./Home.aspx");
        }
    }
}