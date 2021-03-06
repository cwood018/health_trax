<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sleep.aspx.cs" Inherits="Sleep" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Nutrition</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta content="text/html; charset=iso-8859-2" http-equiv="Content-Type">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>
        .mySlides {
            display: none;
        }

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
        }

        .navbar {
            overflow: hidden;
            background-color: black;
            position: fixed;
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
            font-size: 28px; /* Increased text to enable scrolling */
            padding: 40px 20px;
        }

        input[type=text], input[type=password] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
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
            <div class="imgcontainer">
                <img src="logo.png" alt="Logo" class="avatar">
            </div>
        </div>
        <div class="main">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SoftwareProjectConnectionString %>" SelectCommand="SELECT [Sleep_Username], [Sleep_Start], [Sleep_Finish], [Sleep_Total], [Sleep_Date] FROM [User_Sleep]"></asp:SqlDataSource>
            <br />
            Enter Time as HH:MM:SS in a 24 Hour Format<br />
            <br />
            <label for="date"><b>Date</b></label>
            <asp:TextBox ID="txtDate" runat="server" ReadOnly="True"></asp:TextBox>
            <br />
            <br />
            <label for="bedtime"><b>Bed Time</b></label>
            <asp:TextBox ID="txtSleep" runat="server"></asp:TextBox>
            <br />
            <br />
            <label for="wake"><b>Wakeup Time</b></label>
            <asp:TextBox ID="txtWake" runat="server"></asp:TextBox>
            <br />
            <br />
            <label for="totalsleep"><b>Total Sleep</b></label>
            <asp:Label ID="lblTime" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <asp:Button ID="btnSleep" runat="server" class="mybutton" OnClick="btnSleep_Click" Text="Submit" />
            &nbsp;<asp:Button ID="btnExit" runat="server" class="mybutton" Text="Return to Home" OnClick="btnExit_Click" />
            <br />
            <asp:Label ID="lblStatus" runat="server" Text="Database Status" Visible="False"></asp:Label>
        </div>
    </form>
</body>
</html>
