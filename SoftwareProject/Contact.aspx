<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta content="text/html; charset=iso-8859-2" http-equiv="Content-Type">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <title>Contact</title>
    <style>
        .mySlides {
            display: none;
        }

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
        }

        .navbar {
            overflow: hidden;
            background-color: black;
            //position: fixed;
            top: 0;
            width: 100%;
        }

            .navbar a {
                float: right;
                display: block;
                color: #f2f2f2;
                text-align: center;
                padding: 14px 40px;
                text-decoration: none;
                font-size: 17px;
            }

                .navbar a:hover {
                    background: #ddd;
                    color: black;
                }

        .block {
            width: 25%;
            height: 100%;
            display: block;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            padding: 8px 16px;
            padding-top: 30px;
            text-align: left;
            border: none;
            white-space: normal;
            float: none;
            outline: 0;
            color: #fff !important;
            background-color: #000 !important;
            overflow-x: hidden;
        }

        .sidenav {
            height: 100%;
            width: 160px;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            overflow-x: hidden;
            padding-top: 20px;
            color: #fff !important;
            background-color: #000 !important;
        }
        .btn-group button {
            background-color: #4CAF50; /* Green background */
            border: 1px solid green; /* Green border */
            color: white; /* White text */
            padding: 10px 24px; /* Some padding */
            cursor: pointer; /* Pointer/hand icon */
            width: 50%; /* Set a width if needed */
            display: block; /* Make the buttons appear below each other */
        }

            .btn-group button:not(:last-child) {
                border-bottom: none; /* Prevent double borders */
            }

            /* Add a background color on hover */
            .btn-group button:hover {
                background-color: #3e8e41;
            }

        .mybutton {
            background-color: black;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }

            .mybutton:hover {
                opacity: 0.8;
                background-color: darkgrey;
            }

        .imgcontainer {
            text-align: center;
            margin: 24px 0 12px 0;
        }

        img.avatar {
            width: 65%;
            border-radius: 50%;
        }

        .main {
            margin-left: 25%; /* Same as the width of the sidenav */
            font-size: 24px; /* Increased text to enable scrolling */
            padding: 20px 20px;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="/Contact.aspx">Contact</a>
        <a href="https://news.google.com/topics/CAAqIQgKIhtDQkFTRGdvSUwyMHZNR3QwTlRFU0FtVnVLQUFQAQ">Health News</a>
        <a href="/Home.aspx">Home</a>
    </div>
    <form id="form1" runat="server">
        <div class="block">
            <div>
                <h2 style="text-align: center">Welcome<br />
                    <asp:Label ID="lblUser" runat="server" Text="Label"></asp:Label></h2>
            </div>
            <div>
                <asp:Button ID="btnBMI" class="mybutton" runat="server" OnClick="btnBMI_Click" Text="Update BMI" />
            </div>
            <div>
                <asp:Button ID="btnNutrition" class="mybutton" runat="server" OnClick="btnNutrition_Click" Text="Update Nutrition" />
            </div>
            <div>
                <asp:Button ID="btnHistory" class="mybutton" runat="server" OnClick="btnHistory_Click" Text="View History" />
            </div>
            <div>
                <asp:Button ID="btnSleep" class="mybutton" runat="server" OnClick="btnSleep_Click" Text="Sleep" />
            </div>
            <div>
                <asp:Button ID="btnLogout" class="mybutton" runat="server" OnClick="btnLogout_Click" Text="Logout" />
            </div>
            <div class="imgcontainer">
                <img src="logo.png" alt="Logo" class="avatar">
            </div>

        </div>
        <div class="main">
            Have a problem? Tell us about it below.

            <br />
            <asp:TextBox ID="messageField" runat="server" Height="258px" TextMode="MultiLine" Width="100%"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" class="mybutton" Text="Send Report" OnClick="Button1_Click" />
            <br />
            <asp:Label ID="submitLabel" runat="server" Text="Submission Successful" Visible="False" ForeColor="Red"></asp:Label>

        </div>
    </form>
</body>
</html>
