<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Index.master" AutoEventWireup="true" CodeFile="Land_Owner_Details.aspx.cs" Inherits="Admin_Land_Owner_Details" %>

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
   <!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row justify-content-center inp-form">
        <div class="col-lg-10">
            <fieldset class="scheduler-border">
                <legend class="scheduler-border"><i class="fa fa-user" style="color: #ffc107;"></i>Land Owner Details Master  </legend>
                <div class="row">
                    <div class="col-lg-6 form-group">
                        <label for="name">Land Owner Name:</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Land Owner Name" onkeypress="return validation(event);" BackColor="White" BorderColor="Black"></asp:TextBox>
                    </div>
                    <div class="col-lg-6 form-group">
                        <label for="desg">Land Owner Email :</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Land Owner Email" onkeypress="return validation(event);" BorderColor="Black"></asp:TextBox>
                    </div>

                    <div class="col-lg-6 form-group">
                        <label for="name">Land Owner Contact No:</label>
                        <%--<input type="text" class="form-control" id="txtname">--%>
                        <asp:TextBox ID="txtcontact" runat="server" CssClass="form-control" placeholder="Land Owner Contact No" onkeypress="return validation(event);"></asp:TextBox>
                    </div>
                    <div class="col-lg-6 form-group">
                        <label for="desg">Land Owner Current Address :</label>
                        <%--<input type="text" class="form-control" id="txtdesig">--%>
                        <asp:TextBox ID="txtcurrentads" runat="server" CssClass="form-control" placeholder="Land Owner Current Address" onkeypress="return validation(event);"></asp:TextBox>
                    </div>

                    <div class="col-lg-6 form-group">
                        <label for="name">Land Owner Permanent Address:</label>
                        <%--<input type="text" class="form-control" id="txtname">--%>
                        <asp:TextBox ID="txtpermanentads" runat="server" CssClass="form-control" placeholder="Land Owner Permanent Address" onkeypress="return validation(event);"></asp:TextBox>
                    </div>
                    <div class="col-lg-6 form-group">
                        <label for="desg">Land Owner Location:</label>
                        <%--<input type="text" class="form-control" id="txtdesig">--%>
                        <asp:TextBox ID="txtlandloc" runat="server" CssClass="form-control" placeholder="Land Owner Location" onkeypress="return validation(event);"></asp:TextBox>
                    </div>
                    <div class="col-lg-4 form-group"></div>
                    <div class="col-lg-6 form-group">
                        <asp:Button ID="btnSubmit" runat="server" class="btn btn-success" Text="Submit" OnClick="btnSubmit_Click" OnClientClick="return signup();" />&nbsp
                       <asp:Button ID="btnCancel" runat="server" class="btn btn-primary" Text="Cancel" OnClick="btnCancel_Click" />&nbsp
                        <asp:Button ID="btnDelete" runat="server" visible="false" class="btn btn-danger" Text="Delete" OnClick="btnDelete_Click" />
                    </div>
                     <div class="col-lg-4 form-group"></div>

                      <div id="divShow" runat="server" class="col-lg-12 form-group d-flex justify-content-start">
                        <div class="table-responsive tgid">
                            <asp:GridView ID="grdDetail" Width="100%" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true"
                                CssClass="mGrid tbltxt table" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                                OnRowCommand="grdDetail_RowCommand" OnDataBound="grdDetail_DataBound" TabIndex="5" OnSelectedIndexChanged="grdDetail_SelectedIndexChanged" OnRowDataBound="grdDetail_RowDataBound">
                                <Columns>

                                               <%--  <asp:TemplateField>
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

                                    <asp:TemplateField HeaderText="Land Owner Name">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkDesign" CausesValidation="false" Text='<%#Eval("Land_Owner_Name")%>'
                                                CommandName="show" CommandArgument='<%#Eval("Land_Owner_Id")%>' runat="server"></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Land Owner Email Id">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmail_address" runat="server" Text='<%#Eval("Land_Owner_Email_Id")%>'></asp:Label>

                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Land Owner Contact No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDesignation" runat="server" Text='<%#Eval("Land_Owner_Contact_No")%>'></asp:Label>

                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Land Owner Current Address">
                                        <ItemTemplate>
                                            <asp:Label ID="lblContact_no" runat="server" Text='<%#Eval("Land_Owner_Current_Details")%>'></asp:Label>

                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Land Owner Permanent Address">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgen" runat="server" Text='<%#Eval("Land_Owner_Permanent_Details")%>'></asp:Label>
                                            <%--<asp:Label ID="lblid" runat="server" Visible="false" Text='<%#Eval("Admissionno")%>'></asp:Label>--%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Land Owner Fathers Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblbtn" runat="server" Text='<%#Eval("Land_Location")%>'></asp:Label>
                                            <%--<asp:Label ID="lblid" runat="server" Visible="false" Text='<%#Eval("Admissionno")%>'></asp:Label>--%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>
                                     <%--<asp:TemplateField HeaderText="Land Owner Mothers Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcountry" runat="server" Text='<%#Eval("Mothers_Name")%>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Land Area">
                                        <ItemTemplate>
                                            <asp:Label ID="lblstate" runat="server" Text='<%#Eval("Land_Area")%>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>--%>
                                   
                             <%--       <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:Button ID="btnUpdate" runat="server" Text="Edit" CssClass="btn btn-primary" CommandArgument='<%#Eval("Land_Owner_Id")%>' CommandName="UpdateN" ToolTip="Update" />
                                            <asp:Button ID="btnDlt" runat="server" Text="Delete" CssClass="btn btn-danger" ToolTip="Delete" CommandArgument='<%#Eval("Land_Owner_Id")%>' CommandName="DeleteN" />
                                        </ItemTemplate>


                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>--%>

                                        <asp:TemplateField HeaderText="EDIT">
                                        <ItemTemplate>                                         
                                                <asp:LinkButton ID="lnkEdit" runat="server" CommandName="UpdateN" CommandArgument='<%#Eval("Land_Owner_Id") %>' CausesValidation="false" ToolTip="Update"><i class="fa fa-2x fa-edit" style="color:blue;"></i></asp:LinkButton>                                            
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Delete">
                                        <ItemTemplate>
                                         
                                             <asp:LinkButton ID="lnkDel" runat="server" OnClientClick="javascript:return confirm('Are You Sure want to delete this Property?')" CommandName="DeleteN" CommandArgument='<%#Eval("Land_Owner_Id") %>' CausesValidation="false" ToolTip="DeleteN"><i class="fa fa-2x fa-trash" style="color:red;"></i></asp:LinkButton>
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

