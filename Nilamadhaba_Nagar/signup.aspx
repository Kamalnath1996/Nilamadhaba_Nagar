<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signup.aspx.cs" Inherits="signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Nilamadhaba Nagar.com</title>
   <%-- <link href="css3/Style3.css" rel="stylesheet" />--%>
      <link href="Css/Style.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
               <div class="bg-imgs">
                <div class="content">
                    <header>SignUp Form</header>
                      <div class=" field">
                            <span class="fa fa-user"></span>            
                              <asp:TextBox ID="txtname" runat="server" class="form-control" placeholder="Name" ></asp:TextBox>
                        </div>
                      <div class=" field space">
                            <span class="fa fa-user"></span>            
                              <asp:TextBox ID="txtemail" runat="server" class="form-control" placeholder="Email" ></asp:TextBox>
                        </div>
                      <div class=" field space">
                            <span class="fa fa-user"></span>            
                           <asp:TextBox ID="txtPsw" runat="server" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                        </div>
                     <div class=" field space">
                            <span class="fa fa-user"></span>            
                           <asp:TextBox ID="txtconform" runat="server" class="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                        </div>
                      <div class=" field space">
                            <span class="fa fa-user"></span>            
                              <asp:TextBox ID="txtcont" runat="server" class="form-control" placeholder="Contact" ></asp:TextBox>
                        </div>
                       <%-- <div class=" field">
                            <span class="fa fa-user"></span>            
                              <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Email address" ></asp:TextBox>
                        </div>
                        <div class=" field space">
                            <span class="fa fa-lock"></span>
                               <asp:TextBox ID="txtPsw" runat="server" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                        </div>--%>
                      <%--  <div class=" pass">
                            <a href="">Forgot Password</a>
                            <label class="right">
                                <input type="checkbox" value="remember-me" /><span class="check">Remember Me</span>
                            </label>
                        </div>--%>

                        <div class="field space">
                            <asp:Button ID="btnSignup" runat="server"  Text="Signup" OnClick="btnSignup_Click" class="btn btn-lg btn-primary btn-block"/>
                        </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
