<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Index.master" AutoEventWireup="true" CodeFile="Plot_Details.aspx.cs" Inherits="Admin_Plot_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        #password + .glyphicon {
            cursor: pointer;
            pointer-events: all;
        }

        /* Styles for CodePen Demo Only */
        #wrapper {
            max-width: 500px;
            margin: auto;
            padding-top: 25vh;
        }
    </style>
    <script language="javascript" type="text/javascript">
        function popUp(URL) {
            day = new Date();
            id = day.getTime();
            eval("page" + id + " = window.open(URL, '" + id + "', 'toolbar=0,scrollbars=1,location=0,statusbar=0,menubar=0,resizable=0,width=600,height=300,left = 500,top = 200');");
        }

        function View(URL) {
            day = new Date();
            id = day.getTime();
            eval("page" + id + " = window.open(URL, '" + id + "', 'toolbar=0,scrollbars=1,location=0,statusbar=0,menubar=0,resizable=0,width=800,height=400,left = 500,top = 200');");
        }

    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/hideshowpassword/2.0.8/hideShowPassword.min.js"></script>
    <script src="https://allurewebsolutions.com/allure.js"></script>

    <%--script for password eye start--%>
    <script type="text/javascript">
        function signup() {
                 <%-- var id = document.getElementById("<%=txtid.ClientID %>").value;--%>
      <%--      var Name = document.getElementById("<%=txtName.ClientID %>").value;--%>
            <%--var Address = document.getElementById("<%=txtAds.ClientID %>").value;
            var Designation = document.getElementById("<%=txtDesignation.ClientID %>").value;
            var ContactNo = document.getElementById("<%=txtContactNo.ClientID %>").value;
            var Email_address = document.getElementById("<%=txtEmail.ClientID %>").value;
            var Gender = document.getElementById("<%=drpGen.ClientID %>").value;
            var Radiobutton = document.getElementById("<%=RdoBtn.ClientID %>").value;--%>



     <%--       if (id.trim() == "") {
                alert("Please Enter  Id");
                document.getElementById("<%=txtid.ClientID %>").focus();
                return false;
            }--%>
            //if (Name.trim() == "") {
            //    alert("Please Enter  Name");
             <%--   document.getElementById("<%=txtName.ClientID %>").focus();
                return false;--%>
        }
        <%--    if (Address.trim() == "") {
                alert("Please Enter  Address");
                document.getElementById("<%=txtAds.ClientID %>").focus();
                return false;
            }


            if (Designation.trim() == "") {
                alert("Please Enter  Designation");
                document.getElementById("<%=txtDesignation.ClientID %>").focus();
                return false;
            }
            if (Gender.trim() == "") {
                alert("Please Enter  Gender");
                document.getElementById("<%=drpGen.ClientID %>").focus();
                return false;
            }
            if (ContactNo.trim() == "") {
                alert("Please Enter  ContactNo");
                document.getElementById("<%=txtContactNo.ClientID %>").focus();
                return false;
            }
            if (Radiobutton.trim() == "") {
                alert("Please choose one");
                document.getElementById("<%=RdoBtn.ClientID %>").focus();
                return false;
            }
            if (Email_address.trim() == "") {
                alert("Please Enter  Email_address");
                document.getElementById("<%=txtEmail.ClientID %>").focus();
                return false;
            }--%>

        }

        //check all validation.

        //function checkAll(myCheckbox) {
        //    var gridview = document.getElementById("grdDetails");
        //    for (var i = 1; i < gridview.rows.length; i++) {
        //        gridview.rows[i].cells[0].getElementsByTagName("INPUT")[0].checked = myCheckbox.checked;
        //    }
        //}

        function checkAll(name) {

      <%--      var grid = document.getElementById("<%= grdDetails.ClientID %>");--%>
            var cell;

            if (grid.rows.length > 0) {
                for (i = 1; i < grid.rows.length; i++) {
                    cell = grid.rows[i].cells[0];
                    for (j = 0; j < cell.childNodes.length; j++) {
                        if (cell.childNodes[j].type == "checkbox") {
                            cell.childNodes[j].checked = name.checked;
                        }
                    }
                }
            }
        }
        //check all validation end.
        function validate(p) {
            var code = p.keyCode;
            if (!(code == 8 || code == 127) && (code < 48 || code > 57)) {
                alert('please enter numeric value only!');
                return false;
            }
            else {
                return true;
            }

        }
        function validation(d) {
            var chr = d.keyCode;
            if (!(chr == 8 || chr == 127) && (chr < 48 || chr > 57)) {
                return true;
            }
            else {
                alert('please enter charecter  only!');

                return false;
            }

        }


    </script>
    <%--script for password eye end--%>

    <style type="text/css">
        #searchs {
            background: #101df5;
            color: white;
            width: 25px;
            height: 30px;
            letter-spacing: 10px;
            padding: 5px 5px 2px 4px;
            border-radius: 5px;
            align-content: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="spacer">
        <%-- <img src="../images/mask.gif" height="8" width="10" />--%>
    </div>



    <div class="row justify-content-center inp-form">
        <div class="col-lg-10">
            <fieldset class="scheduler-border">
                <legend class="scheduler-border"><i class="fa fa-user" style="color: #ffc107;"></i>Plot Details Master</legend>
                <div class="row">
                    <div class="col-lg-6 form-group">
                        <label for="plotno">Plot No:</label>
                        <asp:TextBox ID="txtplotno" runat="server" CssClass="form-control" visible="false" Placeholder="plot no" onkeypress="return validation(event);"></asp:TextBox>
                        <asp:DropDownList ID="drplotno" runat="server" Width="465px"></asp:DropDownList>

                    </div>
                    <div class="col-lg-6 form-group">
                        <label for="plotsize">Plot Size` :</label>
                        <asp:TextBox ID="txtplotsize" runat="server" CssClass="form-control" Placeholder="plot size" onkeypress="return validation(event);"></asp:TextBox>
                    </div>
                    <div class="col-lg-6 form-group">
                        <label for="areano">Area No :</label>
                        <asp:TextBox ID="txtareano" runat="server" CssClass="form-control" Placeholder="Area no" onkeypress="return validate(event);"></asp:TextBox>
                    </div>
                    <div class="col-lg-6 form-group" style="left: 0px; top: 0px">
                        <label for="areaname">Area Name:</label>
                        <asp:TextBox ID="txtareaname" runat="server" Placeholder="Area Name" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-lg-6 form-group">
                        <label for="plotlocation">Plot Location:</label>
                        <asp:TextBox ID="txtplotlocation" Visible="false" runat="server" Placeholder="Plot Location" CssClass="form-control"></asp:TextBox>
                         <asp:DropDownList ID="drplotLocn" runat="server" Width="465px"></asp:DropDownList>
                    </div>
                    <div class="col-lg-6 form-group">
                        <label for="khatianno">khatian No :</label>
                        <asp:TextBox ID="txtkhatianno" runat="server" Placeholder="khatian No" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-lg-6 form-group">
                        <div>
                            <label align="patano">Pata No:</label>
                            <asp:TextBox ID="txtpatano" runat="server" Placeholder="Pata No" CssClass="form-control"></asp:TextBox>
                        </div>

                    </div>
                    <div class="col-lg-6 form-group">
                        <div>
                            <label align="project">Project:</label>
                            <asp:TextBox ID="txtproject" runat="server" visible="false" Placeholder="Project" CssClass="form-control"></asp:TextBox>
                            <asp:DropDownList ID="drproject" runat="server" Width="465px"></asp:DropDownList>
                        </div>

                    </div>

                    <%--      <div class="col-lg-6 form-group">
                        <label for="desg">Upload Property :</label>
                        <br />
                        <asp:FileUpload ID="fldUpImage" class="btn btn-primary" Width="240px" runat="server" />
                        <asp:Button ID="btnPreview" runat="server" class="btn btn-warning" Text="Preview" OnClick="btnPreview_Click" />
                        <asp:Label ID="lblimg" runat="server" Text="lblimg"> </asp:Label>
                    </div>
                    <div class="col-lg-3 form-group">   
                        <img id="plotimg" runat="server" width="150" height="100" borderstyle="Groove" borderwidth="2px" src="../Image/plot.jpg" />
                    </div>--%>

                    <div class="col-lg-4 form-group"></div>
                    <div class="col-lg-6 form-group" style="margin-top: 30px;">
                        <asp:Button ID="btnSubmit" runat="server" class="btn btn-success" Text="Submit" OnClick="btnSubmit_Click" OnClientClick="return signup();" />&nbsp
                       <asp:Button ID="btnCancel" runat="server" class="btn btn-primary" Text="Cancel" OnClick="btnCancel_Click" />&nbsp
                        <asp:Button ID="btnDelete" runat="server" Visible="false" class="btn btn-danger" Text="Delete" OnClick="btnDelete_Click" />
                    </div>
                    <div class="col-lg-4 form-group"></div>
                    <%--     <div class="col-lg-6 form-group">
                        <i class="fa fa-search" id="searchs" style=" margin-left: 110px;"></i>
                        <asp:TextBox ID="txtsearch"  runat="server" Width="203px" OnTextChanged="txtsearch_TextChanged1" AutoPostBack="true"></asp:TextBox>
                    </div>--%>

                    <div id="divShow" runat="server" class="col-lg-12 form-group d-flex justify-content-start">
                        <div class="table-responsive tgid" style="overflow:scroll; height:300px;">
                            <asp:GridView ID="grdDetails" Width="100%" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true"
                                CssClass="mGrid tbltxt table" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                                OnRowCommand="grdDetails_RowCommand" OnDataBound="grdDetails_DataBound" TabIndex="5" OnSelectedIndexChanged="grdDetails_SelectedIndexChanged" OnRowDataBound="grdDetails_RowDataBound">
                                <Columns>

                                    <%-- <asp:TemplateField>
                                                        <HeaderTemplate>
                                                            <input name="toggleAll" onclick="checkAll(this);" type="checkbox" value="ON" />
                                                        </HeaderTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="15px" />
                                                        <HeaderStyle HorizontalAlign="Center" Width="15px" />
                                                        <ItemTemplate>
                                                            <input name="Checkb" type="checkbox" value='<%#Eval("SL_No")%>' />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="15px"></ItemStyle>
                                                    </asp:TemplateField>--%>


                                    <asp:TemplateField HeaderText="Plot No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPlot_no" runat="server" Text='<%#Eval("Plot_No")%>'></asp:Label>

                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Plot Size">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPlot_size" runat="server" Text='<%#Eval("Plot_Size")%>'></asp:Label>

                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Area_No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblArea_no" runat="server" Text='<%#Eval("Area_No")%>'></asp:Label>

                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Area Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblArea_Name" runat="server" Text='<%#Eval("Area_Name")%>'></asp:Label>

                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Plot Location">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPlot_Location" runat="server" Text='<%#Eval("Plot_Location")%>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Khatian No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblKhatian_no" runat="server" Text='<%#Eval("Khatian_No")%>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Pata No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPata_no" runat="server" Text='<%#Eval("Pata_No")%>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Project">
                                        <ItemTemplate>
                                            <asp:Label ID="lblProject" runat="server" Text='<%#Eval("Project")%>'></asp:Label>
                                            <%--<asp:Label ID="lblid" runat="server" Visible="false" Text='<%#Eval("Admissionno")%>'></asp:Label>--%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Image">
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <%--<asp:Label ID="lblImage" Visible="false" runat="server" Text='<%#Eval("image")%>'></asp:Label>--%>
                                            <a href="javascript:popUp('Upload_Image.aspx?plot_id=<%#Eval("Plot_Id")%>')">
                                                <asp:Label ID="lblView" runat="server" Text="Upload Image" Font-Underline="true"></asp:Label>
                                            </a>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                              <asp:TemplateField HeaderText="View">
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <%--<asp:Label ID="lblImage" Visible="false" runat="server" Text='<%#Eval("image")%>'></asp:Label>--%>
                                            <a href="javascript:View('View_Image.aspx?plot_id=<%#Eval("Plot_Id")%>')">
                                                <asp:Label ID="lblView" runat="server" Text="View Image" Font-Underline="true"></asp:Label>
                                            </a>
                                        </ItemTemplate>
                                    </asp:TemplateField>


       
                                    <%--         <asp:TemplateField HeaderText="Image">
                                        <ItemTemplate>
                                            <asp:Label ID="lblstate" runat="server" Text='<%#Eval("image")%>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>
                                    --%>
                                    <%--  <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:Button ID="btnUpdate" runat="server" Text="Edit" Class="btn btn-primary" CommandArgument='<%#Eval("Plot_Id")%>' CommandName="UpdateN" ToolTip="Update" />
                                            <asp:Button ID="btnDlt" runat="server" Text="Delete" Class="btn btn-danger" ToolTip="Delete" CommandArgument='<%#Eval("Plot_Id")%>' CommandName="DeleteN" />
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>--%>

                                    <asp:TemplateField HeaderText="EDIT">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkEdit" runat="server" CommandName="UpdateN" CommandArgument='<%#Eval("Plot_Id") %>' CausesValidation="false" ToolTip="Update"><i class="fa fa-2x fa-edit" style="color:blue;"></i></asp:LinkButton>
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Delete">
                                        <ItemTemplate>

                                            <asp:LinkButton ID="lnkDel" runat="server" OnClientClick="javascript:return confirm('Are You Sure want to delete this Property?')" CommandName="DeleteN" CommandArgument='<%#Eval("Plot_Id") %>' CausesValidation="false" ToolTip="DeleteN"><i class="fa fa-2x fa-trash" style="color:red;"></i></asp:LinkButton>
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>

            </fieldset>
        </div>

    </div>
</asp:Content>

