<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Upload_Image.aspx.cs" Inherits="Admin_Upload_Image" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Nilamadhaba nagar</title>
    <style type="text/css">
        .auto-style1 {
            width: 204px;
            height: 148px;
        }
        .auto-style2 {
            height: 60px;
            width: 88px;
        }
        </style>
   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.js"></script>
 <%--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
</head>

<body>

 <%--   class="auto-style2"--%>
     <%--Style="margin: -50px 320px 10px" --%>
    <form id="form1" runat="server">      
     <table align="center" width="100%">
        <tr>
            <td align="left" valign="baseline" class="auto-style2" >
                Plot Id&nbsp;:&nbsp;<asp:Label ID="lblplotId" runat="server"></asp:Label>
                 <%-- <label for="desg">Plot Id :</label>
                <asp:TextBox ID="txtplotId" runat="server" Width="61px"></asp:TextBox>--%>
            </td>
            <td align="left" valign="baseline" style="width: 360px;"> 
                 <label for="desg" style="float:left; margin: 12px 10px 5px 1px;">Upload Property :</label>
              <asp:FileUpload ID="fldUpImage" style="margin-top: 5px;" class="btn btn-primary" width="210px" runat="server" />
            </td>
            <td style="padding-bottom: 13px; margin-top: 7px;">
                 <asp:Button ID="btnPreview"  runat="server" class="btn btn-warning" Text="Preview" OnClick="btnPreview_Click" /><br />
                        <asp:Label ID="lblimg" runat="server" Text="lblimg"> </asp:Label>
            </td>
        </tr>
       <%-- <tr>
           <td align="left" valign="baseline" colspan="2">
                        <asp:FileUpload ID="fldUpImage" class="btn btn-primary" width="240px" runat="server" />
                        <asp:Button ID="btnPreview" runat="server" class="btn btn-warning" Text="Preview" OnClick="btnPreview_Click" />
                        <asp:Label ID="lblimg" runat="server" Text="lblimg"> </asp:Label>  
            </td>
        </tr>--%>
        <tr align="center">
            <td  valign="baseline" colspan="3">
                <br />
                   <img id="plotimg" runat="server" borderstyle="Groove" borderwidth="2px" src="../Image/plot.jpg" class="auto-style1" />
             <%--    <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click"
                    onfocus="active(this);" onblur="inactive(this);" />--%>
            </td>
        </tr>
           <tr>
            <td align="center" valign="baseline" colspan="3">
                <br />
                 <asp:Button ID="btnUpload" class="btn btn-success"  runat="server" Text="Upload" OnClick="btnUpload_Click"
                    onfocus="active(this);" onblur="inactive(this);" />
            </td>
        </tr>
    </table>

    </form>
</body>
</html>
