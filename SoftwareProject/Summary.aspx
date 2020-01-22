<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Summary.aspx.cs" Inherits="Summary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Summary</title>
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
            font-size: 28px; /* Increased text to enable scrolling */
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
                #myDIV1 {
            height: 40%;
            width: 100%;
            overflow: auto;
        }

        #content1 {
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SoftwareProjectConnectionString %>" SelectCommand="SELECT [Calorie_Username], [Calorie_Date], [Calorie_Calorie], [Calorie_Protein], [Calorie_Carb], [Calorie_Fat], [Calorie_Meal] FROM [User_Calorie] WHERE ([Calorie_Username] = @Calorie_Username)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="" Name="Calorie_Username" SessionField="Username" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SoftwareProjectConnectionString %>" SelectCommand="SELECT [Sleep_Date], [Sleep_Start], [Sleep_Finish], [Sleep_Total] FROM [User_Sleep] WHERE ([Sleep_Username] = @Sleep_Username)">
                <SelectParameters>
                    <asp:SessionParameter Name="Sleep_Username" SessionField="Username" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <div id="myDIV" onscroll="myFunction()">
                <div id="content">
                    <asp:GridView ID="GridView1" runat="server" Style="width: 90%" overflow="auto" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" GridLines="Vertical" ForeColor="Black">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:BoundField DataField="Calorie_Username" HeaderText="Calorie_Username" SortExpression="Calorie_Username" />
                            <asp:BoundField DataField="Calorie_Date" HeaderText="Calorie_Date" SortExpression="Calorie_Date" />
                            <asp:BoundField DataField="Calorie_Calorie" HeaderText="Calorie_Calorie" SortExpression="Calorie_Calorie" />
                            <asp:BoundField DataField="Calorie_Protein" HeaderText="Calorie_Protein" SortExpression="Calorie_Protein" />
                            <asp:BoundField DataField="Calorie_Carb" HeaderText="Calorie_Carb" SortExpression="Calorie_Carb" />
                            <asp:BoundField DataField="Calorie_Fat" HeaderText="Calorie_Fat" SortExpression="Calorie_Fat" />
                            <asp:BoundField DataField="Calorie_Meal" HeaderText="Calorie_Meal" SortExpression="Calorie_Meal" />
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
            <br />
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" overflow="auto" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource2" GridLines="Horizontal" Width="1067px">
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                        <Columns>
                            <asp:BoundField DataField="Sleep_Date" HeaderText="Date" SortExpression="Sleep_Date" />
                            <asp:BoundField DataField="Sleep_Start" HeaderText="Start" SortExpression="Sleep_Start" />
                            <asp:BoundField DataField="Sleep_Finish" HeaderText="Finish" SortExpression="Sleep_Finish" />
                            <asp:BoundField DataField="Sleep_Total" HeaderText="Total" SortExpression="Sleep_Total" />
                        </Columns>
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <SortedAscendingCellStyle BackColor="#F4F4FD" />
                        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                        <SortedDescendingCellStyle BackColor="#D8D8F0" />
                        <SortedDescendingHeaderStyle BackColor="#3E3277" />
                    </asp:GridView>
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
