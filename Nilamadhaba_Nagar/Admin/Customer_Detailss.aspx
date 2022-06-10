 <%@ Page Title="" Language="C#" MasterPageFile="~/Master/Index.master" AutoEventWireup="true" CodeFile="Customer_Detailss.aspx.cs" Inherits="Admin_Customer_Detailss" %>

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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/hideshowpassword/2.0.8/hideShowPassword.min.js"></script>
    <script src="https://allurewebsolutions.com/allure.js"></script>

    <%--script for password eye start--%>
    <script type="text/javascript">
        function signup() {
                 <%-- var id = document.getElementById("<%=txtid.ClientID %>").value;--%>
            var Name = document.getElementById("<%=txtName.ClientID %>").value;
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
            if (Name.trim() == "") {
                alert("Please Enter  Name");
                document.getElementById("<%=txtName.ClientID %>").focus();
                return false;
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
                <legend class="scheduler-border"><i class="fa fa-user" style="color: #ffc107;"></i>Customer Details Master</legend>
                <div class="row">
                    <div class="col-lg-6 form-group">
                        <label for="name">Customer Name:</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Placeholder="customer name" onkeypress="return validation(event);"></asp:TextBox>
                    </div>
                    <div class="col-lg-6 form-group">
                        <label for="email">Email_Id :</label>
                        <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" Placeholder="email" onkeypress="return validation(event);"></asp:TextBox>
                    </div>
                    <div class="col-lg-6 form-group">
                        <label for="contact">Contact No :</label>
                        <asp:TextBox ID="txtContactNo" runat="server" CssClass="form-control" Placeholder="contact no" onkeypress="return validate(event);"></asp:TextBox>
                    </div>
                    <div class="col-lg-6 form-group">
                        <label for="ads">Current Address:</label>
                        <asp:TextBox ID="txtcurntads" runat="server" Placeholder="current address" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-lg-6 form-group">
                        <label for="permanentads">Permanent Address:</label>
                        <asp:TextBox ID="txtprmntads" runat="server" Placeholder="Permanent address" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-lg-6 form-group">
                        <label for="fathernm">Fathers Name :</label>
                        <asp:TextBox ID="txtfathernm" runat="server" Placeholder="Father name" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-lg-6 form-group">
                        <div>
                            <label align="mothernm">Mother Name:</label>
                            <asp:TextBox ID="txtmothernm" runat="server" Placeholder="Mother name" CssClass="form-control"></asp:TextBox>
                        </div>

                    </div>
                    <div class="col-lg-6 form-group">
                        <div>
                            <label align="center">Land Area:</label>
                            <asp:TextBox ID="txtlandarea" runat="server" Placeholder="Land Area" CssClass="form-control"></asp:TextBox>
                        </div>

                    </div>

                    <div class="col-lg-4 form-group"></div>
                    <div class="col-lg-6 form-group">
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
                        <div class="table-responsive tgid">
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

                                    <asp:TemplateField HeaderText="Customer Name">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkDesign" CausesValidation="false" Text='<%#Eval("Customer_Name")%>'
                                                CommandName="show" CommandArgument='<%#Eval("SL_No")%>' runat="server"></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Email Id">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmail_address" runat="server" Text='<%#Eval("Email_Id")%>'></asp:Label>

                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Contact No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDesignation" runat="server" Text='<%#Eval("Contact_No")%>'></asp:Label>

                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Current Address">
                                        <ItemTemplate>
                                            <asp:Label ID="lblContact_no" runat="server" Text='<%#Eval("Current_Address")%>'></asp:Label>

                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Permanent Address">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgen" runat="server" Text='<%#Eval("Permanent_Address")%>'></asp:Label>
                                            <%--<asp:Label ID="lblid" runat="server" Visible="false" Text='<%#Eval("Admissionno")%>'></asp:Label>--%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Fathers Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblbtn" runat="server" Text='<%#Eval("Fathers_Name")%>'></asp:Label>
                                            <%--<asp:Label ID="lblid" runat="server" Visible="false" Text='<%#Eval("Admissionno")%>'></asp:Label>--%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Mothers Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcountry" runat="server" Text='<%#Eval("Mothers_Name")%>'></asp:Label>
                                            <%--<asp:Label ID="lblid" runat="server" Visible="false" Text='<%#Eval("Admissionno")%>'></asp:Label>--%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Land Area">
                                        <ItemTemplate>
                                            <asp:Label ID="lblstate" runat="server" Text='<%#Eval("Land_Area")%>'></asp:Label>
                                            <%--<asp:Label ID="lblid" runat="server" Visible="false" Text='<%#Eval("Admissionno")%>'></asp:Label>--%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>

                                    <%--  <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:Button ID="btnUpdate" runat="server" Text="Edit" Class="btn btn-primary" CommandArgument='<%#Eval("SL_No")%>' CommandName="UpdateN" ToolTip="Update" />
                                            <asp:Button ID="btnDlt" runat="server" Text="Delete" Class="btn btn-danger" ToolTip="Delete" CommandArgument='<%#Eval("SL_No")%>' CommandName="DeleteN" />
                                        </ItemTemplate>


                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>--%>


                                    <asp:TemplateField HeaderText="EDIT">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkEdit" runat="server" CommandName="UpdateN" CommandArgument='<%#Eval("SL_No") %>' CausesValidation="false" ToolTip="Update"><i class="fa fa-2x fa-edit" style="color:blue;"></i></asp:LinkButton>
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Delete">
                                        <ItemTemplate>

                                            <asp:LinkButton ID="lnkDel" runat="server" OnClientClick="javascript:return confirm('Are You Sure want to delete this Property?')" CommandName="DeleteN" CommandArgument='<%#Eval("SL_No") %>' CausesValidation="false" ToolTip="DeleteN"><i class="fa fa-2x fa-trash" style="color:red;"></i></asp:LinkButton>
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

