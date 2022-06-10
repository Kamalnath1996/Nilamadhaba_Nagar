<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Forgot_Password.aspx.cs" Inherits="Forgot_Password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Nilamadhaba Nagar</title>
     <link href="Css/Style.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                <div class="bgrnd-img">
                <div class="content">
                    <header id="head">Forgot Password</header>
                        <div class=" field">
                            <span class="fa fa-user"></span>            
                              <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Email address" ></asp:TextBox>
                        </div>
                        <div class="field space ">
                             <asp:Button ID="btnSign" runat="server"  Text="Submit" OnClick="btnSign_Click" class="btn btn-primary"/>
                        </div>

                  
                </div>
            </div>
        </div>
    </form>
</body>
</html>
