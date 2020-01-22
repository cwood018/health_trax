<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin</title>
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

        #myDIV {
            height: 40%;
            width: 100%;
            overflow: auto;
        }

        #content {
            height: 100%;
            width: 100%;
            background-color:
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SoftwareProjectConnectionString %>" DeleteCommand="DELETE FROM [User_Registration] WHERE [User_ID] = @User_ID" InsertCommand="INSERT INTO [User_Registration] ([User_Username], [User_Password], [User_Email], [User_FName], [User_LName], [User_Age], [User_Gender]) VALUES (@User_Username, @User_Password, @User_Email, @User_FName, @User_LName, @User_Age, @User_Gender)" SelectCommand="SELECT * FROM [User_Registration]" UpdateCommand="UPDATE [User_Registration] SET [User_Username] = @User_Username, [User_Password] = @User_Password, [User_Email] = @User_Email, [User_FName] = @User_FName, [User_LName] = @User_LName, [User_Age] = @User_Age, [User_Gender] = @User_Gender WHERE [User_ID] = @User_ID">
                <DeleteParameters>
                    <asp:Parameter Name="User_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="User_Username" Type="String" />
                    <asp:Parameter Name="User_Password" Type="String" />
                    <asp:Parameter Name="User_Email" Type="String" />
                    <asp:Parameter Name="User_FName" Type="String" />
                    <asp:Parameter Name="User_LName" Type="String" />
                    <asp:Parameter Name="User_Age" Type="Int32" />
                    <asp:Parameter Name="User_Gender" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="User_Username" Type="String" />
                    <asp:Parameter Name="User_Password" Type="String" />
                    <asp:Parameter Name="User_Email" Type="String" />
                    <asp:Parameter Name="User_FName" Type="String" />
                    <asp:Parameter Name="User_LName" Type="String" />
                    <asp:Parameter Name="User_Age" Type="Int32" />
                    <asp:Parameter Name="User_Gender" Type="String" />
                    <asp:Parameter Name="User_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SoftwareProjectConnectionString %>" SelectCommand="SELECT [Calorie_Username], [Calorie_Calorie], [Calorie_Protein], [Calorie_Carb], [Calorie_Fat] FROM [User_Calorie]"></asp:SqlDataSource>
            <br />
            <div id="myDIV" onscroll="myFunction()">
                <div id="content">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Style="width: 90%" overflow="auto" CellPadding="3" DataKeyNames="User_ID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" AllowPaging="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:BoundField DataField="User_ID" HeaderText="User_ID" InsertVisible="False" ReadOnly="True" SortExpression="User_ID" />
                            <asp:BoundField DataField="User_Username" HeaderText="User_Username" SortExpression="User_Username" />
                            <asp:BoundField DataField="User_Password" HeaderText="User_Password" SortExpression="User_Password" />
                            <asp:BoundField DataField="User_Email" HeaderText="User_Email" SortExpression="User_Email" />
                            <asp:BoundField DataField="User_FName" HeaderText="User_FName" SortExpression="User_FName" />
                            <asp:BoundField DataField="User_LName" HeaderText="User_LName" SortExpression="User_LName" />
                            <asp:BoundField DataField="User_Age" HeaderText="User_Age" SortExpression="User_Age" />
                            <asp:BoundField DataField="User_Gender" HeaderText="User_Gender" SortExpression="User_Gender" />
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                </div>
            </div>
            <br />
            Number Of Users In System:
            <asp:Label ID="lblNumUser" runat="server" Text="Label"></asp:Label>
            <br />
            Total Amount of Calories Consumed in the System:
            <asp:Label ID="lblCalories" runat="server" Text="Label"></asp:Label>
            <br />
            Average Amount of Protein Consumed by System:
            <asp:Label ID="lblProtein" runat="server" Text="Label"></asp:Label>
            <br />
            Average Amount of Carbohydrates Consumed by System:
            <asp:Label ID="lblCarb" runat="server" Text="Label"></asp:Label>
            <br />
            Average Amount of Fats Consumed By System:
            <asp:Label ID="lblFat" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <asp:Button ID="btnGmail" runat="server" OnClick="btnGmail_Click" Text="Error Report Email" />
            <br />
            Email: <a href="mailto:healthTraxxAdm@gmail.com">healthTraxxAdm@gmail.com</a><br />
            Password: SuperiorHealth<br />
            <br />
        </div>
    </form>
    <script>
        function myFunction() {
            var elmnt = document.getElementById("myDIV");
            var x = elmnt.scrollLeft;
            var y = elmnt.scrollTop;
            document.getElementById("demo").innerHTML = "Horizontally: " + x + "px<br>Vertically: " + y + "px";
        }
    </script>
</body>
</html>
