using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class Nutrition : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtDate.Text = DateTime.Today.ToString("yyyy-MM-dd");
        string name = Session["Username"].ToString();

        SqlConnection db = new SqlConnection(SqlDataSource1.ConnectionString);

        SqlCommand checkdb = new SqlCommand();

        checkdb.CommandType = System.Data.CommandType.Text;

        checkdb.CommandText = "Select * FROM User_BMI WHERE BMI_ID = (Select MAX(BMI_ID) FROM User_BMI WHERE BMI_Username = '"+ name +"')";

        checkdb.Connection = db;
        try
        {
            db.Open();
            using (SqlDataReader read = checkdb.ExecuteReader())
            {
                while (read.Read())
                {
                    lblUser.Text = (read["BMI_Username"].ToString());
                    lblBMI.Text = (read["BMI_BMI"].ToString());
                    string height = (read["BMI_Height"].ToString());
                    string weight = (read["BMI_Weight"].ToString());
                    string sex = (read["BMI_Gender"].ToString());
                    string age = (read["BMI_Age"].ToString());

                    int calcHeight = Convert.ToInt32(height);
                    int calcWeight = Convert.ToInt32(weight);
                    int calcAge = Convert.ToInt32(age);

                    double metricHeight = calcHeight * 2.54;
                    double metricWeight = calcWeight * 0.45;

                    if(sex == "Male")
                    {
                        double MaleCount = ((metricHeight * 6.25) + (metricWeight * 9.99) - (calcAge * 4.92) + 5) * 1.38;
                        int x = (int)Math.Ceiling((double)MaleCount);
                        lblCalories.Text = x.ToString();
                    }
                    else
                    {
                        double femaleCount = ((metricHeight * 6.25) + (metricWeight * 9.99) - (calcAge * 4.92) - 161) * 1.28;
                        int y = (int)Math.Ceiling((double)femaleCount);
                        lblCalories.Text = y.ToString();
                    }
                    HttpCookie cookie = Request.Cookies["CalorieInfo"];
                    if (cookie != null)
                    {
                        lblCalories.Text = cookie["Calories"];
                        lblProtein.Text = cookie["Protein"];
                        lblCarb.Text = cookie["Carb"];
                        lblFat.Text = cookie["Fat"];
                    }
                    else
                    {




                        int percentCalories = Convert.ToInt32(lblCalories.Text);

                        double percentProtein = percentCalories * 0.35;
                        int proteinIntake = (int)Math.Ceiling((double)percentProtein);
                        lblProtein.Text = proteinIntake.ToString();

                        double percentCarbs = percentCalories * 0.50;
                        int carbIntake = (int)Math.Ceiling((double)percentCarbs);
                        lblCarb.Text = carbIntake.ToString();

                        double percentFat = percentCalories * 0.15;
                        int fatIntake = (int)Math.Ceiling((double)percentFat);
                        lblFat.Text = fatIntake.ToString();
                    }
                }
            }
        }
        finally
        {
            db.Close();
        }

    }



    protected void btnHome_Click(object sender, EventArgs e)
    {
        HttpCookie cookie = new HttpCookie("CalorieInfo");
        cookie["Calories"] = lblCalories.Text;
        cookie["Protein"] = lblProtein.Text;
        cookie["Carb"] = lblCarb.Text;
        cookie["Fat"] = lblFat.Text;
        cookie.Expires = DateTime.Now.AddDays(1d);
        Response.Cookies.Add(cookie);

        Response.Redirect("./Home.aspx");
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int calorieCount = Convert.ToInt32(txtCalories.Text);
        int proteinCount = Convert.ToInt32(txtProtein.Text);
        int carbCount = Convert.ToInt32(txtCarb.Text);
        int fatCount = Convert.ToInt32(txtFat.Text);

        SqlConnection enterData = new SqlConnection(SqlDataSource2.ConnectionString);
        SqlCommand data = new SqlCommand();
        data.CommandType = System.Data.CommandType.Text;
        data.CommandText = "INSERT INTO [User_Calorie] (Calorie_Username,Calorie_Date,Calorie_Calorie,Calorie_Protein,Calorie_Carb,Calorie_Fat,Calorie_Meal) VALUES ('" +
            lblUser.Text + "','" + txtDate.Text + "','" + calorieCount + "','" + proteinCount + "','" + carbCount + "','" + fatCount + "','" + ddlMeal.SelectedItem.Text + "')";

        data.Connection = enterData;
        enterData.Open();

        try
        {
            data.ExecuteNonQuery();
            lblStatus.Text = "Successfully uploaded to Database";
            lblStatus.Visible = true;

            int caloriesLeft = Convert.ToInt32(lblCalories.Text);
            caloriesLeft = caloriesLeft - calorieCount;
            lblCalories.Text = caloriesLeft.ToString();

            int proteinLeft = Convert.ToInt32(lblProtein.Text);
            proteinLeft = proteinLeft - proteinCount;
            lblProtein.Text = proteinLeft.ToString();

            int carbLeft = Convert.ToInt32(lblCarb.Text);
            carbLeft = carbLeft - carbCount;
            lblCarb.Text = carbLeft.ToString();

            int fatLeft = Convert.ToInt32(lblFat.Text);
            fatLeft = fatLeft - fatCount;
            lblFat.Text = fatLeft.ToString();

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

        if (lblCalories.Text == "0" & lblProtein.Text == "0" & lblCarb.Text == "0" & lblFat.Text == "0")
        {
            lblCongrats.Visible = true;
            Console.Beep();
            Console.Beep();
            Console.Beep();
        }
    }
}