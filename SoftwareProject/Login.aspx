<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" UnobtrusiveValidationMode="none" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        input[type=text], input[type=password] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
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
            }

        .imgcontainer {
            text-align: center;
            margin: 0px 0 5px 0;
        }

        img.avatar {
            width: 30%;
            border-radius: 30%;
        }

        .container {
            padding: 0px;
        }

        span.psw {
            float: right;
            padding-top: 5px;
        }
    </style>
</head>
<body>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SoftwareProjectConnectionString %>" SelectCommand="SELECT [User_Username], [User_Password] FROM [User_Registration]"></asp:SqlDataSource>
    <form id="form1" runat="server">
        <div class="imgcontainer">
            <img src="logo.png" alt="Logo" class="avatar">
        </div>
        <div class="container">
            <label for="uname"><b>Username</b></label>
            <asp:TextBox ID="txtUser" type="text" runat="server" name="uname"></asp:TextBox>

            <label for="psw"><b>Password</b></label>
            <asp:TextBox ID="txtPassword" type="password" runat="server" name="psw"></asp:TextBox>
            <asp:Button ID="btnLogin" class="mybutton" runat="server" Text="Login" OnClick="btnLogin_Click" Font-Bold="True" />
            <asp:Button ID="btnNewUser" class="mybutton" runat="server" Text="Create New Account" OnClick="btnNewUser_Click" Font-Bold="True" />
            <asp:Label ID="lblInvalid" runat="server" Text="Invalid Username and Password" Visible="False" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
</html>
