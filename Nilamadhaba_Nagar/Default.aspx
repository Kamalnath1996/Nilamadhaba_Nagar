<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Nilamadhaba Nagar.com</title>
    <link href="Css/Style.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
          <script language="javascript" type="text/javascript">
            function popUp(URL) {
                day = new Date();
                id = day.getTime();
                eval("page" + id + " = window.open(URL, '" + id + "', 'toolbar=0,scrollbars=1,location=0,statusbar=0,menubar=0,resizable=0,width=500,height=400,left = 500,top = 200');");
            }

          </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="bg-img">
                <div class="content">
                    <header>Login Form</header>
                        <div class=" field">
                            <span class="fa fa-user"></span>            
                              <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Email address" ></asp:TextBox>
                        </div>
                        <div class=" field space">
                            <span class="fa fa-lock"></span>
                               <asp:TextBox ID="txtPsw" runat="server" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class=" pass">
                        <%--    <a asp-action="ForgotPasswords.aspx" href="ForgotPasswords.aspx">Forgot Password</a>--%>
                              <%--  <a href="javascript:popUp('ForgotPasswords.aspx?">Forgot Password</a>--%>

                           <asp:Label ID="lblImage" Visible="false" runat="server" Text='<%#Eval("Email")%>'></asp:Label>
                                            <a href="javascript:popUp('ForgotPasswords.aspx?Id=<%#Eval("Id")%>')">
                                                <asp:Label ID="lblView" runat="server" Text="Forgot Password" Font-Size="15px" Font-Underline="true"></asp:Label>
                                            </a>

                            <label class="right">
                                <input type="checkbox" value="remember-me" /><span class="check" style="Font-Size:17px">Remember Me</span>
                            </label>
                        </div>

                        <div class="field ">
                           <%-- <asp:Button ID="btnSign" runat="server"  Text="Login" OnClick="btnSign_Click" class="btn btn-lg btn-primary btn-block"/>--%>
                             <asp:Button ID="btnSign" runat="server"  Text="Login" OnClick="btnSign_Click" class="btn btn-primary"/>
                        </div>

                    <div class="field space ">
                            <asp:Button ID="btnsignup" runat="server"  Text="Sign Up" OnClick="btnsignup_Click" class="btn btn-success"/>
                        </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
