<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewUser.aspx.cs" Inherits="NewUser" UnobtrusiveValidationMode="none" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New User</title>
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
            font-size: 24px; /* Increased text to enable scrolling */
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SoftwareProjectConnectionString %>" SelectCommand="SELECT [User_ID], [User_Username], [User_Password], [User_Email], [User_FName], [User_LName], [User_Age], [User_Gender] FROM [User_Registration]"></asp:SqlDataSource>
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Fill in the following information to create your HealthTrax account"></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Click submit to save your information"></asp:Label>
            <br />
            <br />
            <label for="uname"><b>Username</b></label>
            <asp:TextBox ID="txtUsername" runat="server" type="text" name="uname"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername" ErrorMessage="Enter Username"></asp:RequiredFieldValidator>
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblUser" runat="server" Text="Username Already Taken" Visible="False"></asp:Label>
            <br />
            <br />
            <label for="password"><b>Password</b></label>
            <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Enter Password"></asp:RequiredFieldValidator>
            <br />
            <br />
            <label for="email"><b>Email</b></label>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Enter Email"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Invalid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <br />
            <br />
            <label for="fname"><b>First Name</b></label>
            <asp:TextBox ID="txtFName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtFName" ErrorMessage="Enter First Name"></asp:RequiredFieldValidator>
            <br />
            <br />
            <label for="lname"><b>Last Name</b></label>
            <asp:TextBox ID="txtLName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtLName" ErrorMessage="Enter Last Name"></asp:RequiredFieldValidator>
            <br />
            <br />
            <label for="age"><b>Age</b></label>
            <asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtAge" ErrorMessage="Enter Age"></asp:RequiredFieldValidator>
            <br />
            <br />
            <label for="gender"><b>Gender</b></label>
            <asp:DropDownList ID="ddlGender" runat="server">
                <asp:ListItem Value="-1">Select Gender</asp:ListItem>
                <asp:ListItem Value="0">Male</asp:ListItem>
                <asp:ListItem Value="1">Female</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlGender" ErrorMessage="Select Gender" InitialValue="-1"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Button ID="btnSubmit" runat="server" class="mybutton" Text="Submit" OnClick="btnSubmit_Click" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnLogin" runat="server" class="mybutton" Text="Return to Login" OnClick="btnLogin_Click" />
            <br />
            <br />
            <asp:Label ID="lblUpdate" runat="server" Text="Label" Visible="False"></asp:Label>
        </div>
    </form>
</body>
</html>
