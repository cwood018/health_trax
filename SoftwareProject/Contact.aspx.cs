using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class _Default : System.Web.UI.Page
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

    protected void Button1_Click(object sender, EventArgs e)
    {
        string emailBody = messageField.Text;

        //checks if message is empty
        if (emailBody == "")
        {
            return;
        }
        MailMessage email = new MailMessage("healthTraxxAdm@gmail.com", "healthTraxxAdm@gmail.com");  //creates email sender/destination
        email.Subject = "User report";  //sets the subject of message
        email.Body = emailBody; //sets the body of the email to the report message

        SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);  //specifies gmail smtp server
        //provides credentials for email 
        smtpClient.Credentials = new System.Net.NetworkCredential()
        {
            UserName = "healthTraxxAdm@gmail.com",
            Password = "SuperiorHealth"
        };
        smtpClient.EnableSsl = true;
        smtpClient.Send(email);  //sends the email

        submitLabel.Visible = true;  //alerts user that message was submitted
        messageField.Text = "";  //returns text area to empty so that another message may be submitted
    }
}
    //send error report button functionality
 