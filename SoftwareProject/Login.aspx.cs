using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Threading;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string user = txtUser.Text;
        string pass = txtPassword.Text;

        SqlConnection db = new SqlConnection(SqlDataSource1.ConnectionString);

        SqlCommand checkDb = new SqlCommand();

        checkDb.CommandType = System.Data.CommandType.Text;

        checkDb.CommandText = "Select * from [User_Registration] where User_Username = '" + user + "' and User_Password = '" + pass + "'";

        checkDb.Connection = db;

        db.Open();

        SqlDataReader dr = checkDb.ExecuteReader();

        if(dr.HasRows)
        {
            Session["Username"] = user;
            Response.Redirect("/Home.aspx");
        }
        else if(txtUser.Text == "admin" || txtPassword.Text == "admin")
        {

            Response.Redirect("./Admin.aspx");
        }
        else
        {
            lblInvalid.Visible = true;
        }
        db.Close();
        


    }

    protected void btnNewUser_Click(object sender, EventArgs e)
    {
        Response.Redirect("/NewUser.aspx");
    }
}