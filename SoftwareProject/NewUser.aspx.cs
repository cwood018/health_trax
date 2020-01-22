using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class NewUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Login.aspx");
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string user = txtUsername.Text;
        string pass = txtPassword.Text;
        string email = txtEmail.Text;
        string fname = txtFName.Text;
        string lname = txtLName.Text;
        int age = Convert.ToInt32(txtAge.Text);
        string gender = ddlGender.SelectedItem.Text;

        SqlConnection db = new SqlConnection(SqlDataSource1.ConnectionString);
        SqlCommand checkDb = new SqlCommand();
        checkDb.CommandType = System.Data.CommandType.Text;
        checkDb.CommandText = "Select * from [User_Registration] where User_Username = '" + user + "'";
        checkDb.Connection = db;

        db.Open();
        SqlDataReader dr = checkDb.ExecuteReader();
        if(dr.HasRows)
        {
            lblUser.Visible = true;
            db.Close();
        }
        else
        {
            SqlConnection enterData = new SqlConnection(SqlDataSource1.ConnectionString);
            SqlCommand data = new SqlCommand();
            data.CommandType = System.Data.CommandType.Text;
            data.CommandText = "INSERT INTO [User_Registration] (User_Username,User_Password,User_Email,User_FName,User_LName,User_Age,User_Gender) VALUES ('" +
                user + "','" + pass + "','" + email + "','" + fname + "','" + lname + "','" + age + "','" + gender + "')";

            data.Connection = enterData;
            enterData.Open();

            try
            {
                data.ExecuteNonQuery();
                lblUpdate.Text = "Successfully uploaded to Database";
                lblUpdate.Visible = true;
            }
            catch
            {
                lblUpdate.Text = "Error in Uploading to Database";
                lblUpdate.Visible = true;
            }
            finally
            {
                enterData.Close();
            }
        }


        
    }
}