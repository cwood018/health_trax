using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection db = new SqlConnection(SqlDataSource2.ConnectionString);
        SqlCommand checkDb = new SqlCommand();
        checkDb.CommandType = System.Data.CommandType.Text;
        checkDb.CommandText = "Select COUNT (User_Username) from [User_Registration]";
        checkDb.Connection = db;

        db.Open();
        Int32 numUsers = (Int32)checkDb.ExecuteScalar();
        db.Close();

        lblNumUser.Text = numUsers.ToString();

        SqlConnection db2 = new SqlConnection(SqlDataSource2.ConnectionString);
        SqlCommand checkDb2 = new SqlCommand();
        checkDb2.CommandType = System.Data.CommandType.Text;
        checkDb2.CommandText = "Select SUM (Calorie_Calorie) from [User_Calorie]";
        checkDb2.Connection = db2;

        db2.Open();
        Int32 sumCalories = (Int32)checkDb2.ExecuteScalar();
        db2.Close();

        lblCalories.Text = sumCalories.ToString();

        SqlConnection db3 = new SqlConnection(SqlDataSource2.ConnectionString);
        SqlCommand checkDb3 = new SqlCommand();
        checkDb3.CommandType = System.Data.CommandType.Text;
        checkDb3.CommandText = "Select AVG (Calorie_Protein) from [User_Calorie]";
        checkDb3.Connection = db3;

        db3.Open();
        Int32 avgProtein = (Int32)checkDb3.ExecuteScalar();
        db3.Close();

        lblProtein.Text = avgProtein.ToString();

        SqlConnection db4 = new SqlConnection(SqlDataSource2.ConnectionString);
        SqlCommand checkDb4 = new SqlCommand();
        checkDb4.CommandType = System.Data.CommandType.Text;
        checkDb4.CommandText = "Select AVG (Calorie_Carb) from [User_Calorie]";
        checkDb4.Connection = db4;

        db4.Open();
        Int32 avgCarb = (Int32)checkDb4.ExecuteScalar();
        db4.Close();

        lblCarb.Text = avgCarb.ToString();

        SqlConnection db5 = new SqlConnection(SqlDataSource2.ConnectionString);
        SqlCommand checkDb5 = new SqlCommand();
        checkDb5.CommandType = System.Data.CommandType.Text;
        checkDb5.CommandText = "Select AVG (Calorie_Fat) from [User_Calorie]";
        checkDb5.Connection = db5;

        db5.Open();
        Int32 avgFat = (Int32)checkDb5.ExecuteScalar();
        db5.Close();

        lblFat.Text = avgFat.ToString();
    }

    protected void btnGmail_Click(object sender, EventArgs e)
    {
        Response.Redirect("https://mail.google.com/mail/");
    }
}