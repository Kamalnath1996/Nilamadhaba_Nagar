<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Index.master" AutoEventWireup="true" CodeFile="Property_Master.aspx.cs" Inherits="Admin_Property_Masters" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="row justify-content-center inp-form">
        <div class="col-lg-12">
            <fieldset class="scheduler-border">
                <legend class="scheduler-border"><i class="fa fa-user" style="color: #ffc107;"></i>Create New User</legend>
                <div class="row">
                    <div class="col-lg-3 form-group">
                        <label for="name">Plot Details Id:</label>
                        <%--<input type="text" class="form-control" id="txtname">--%>
                        <asp:TextBox ID="txtplotid" runat="server" CssClass="form-control" onkeypress="return validation(event);"></asp:TextBox>
                    </div>
                 
                    <div class="col-lg-6 form-group">
                        <label for="desg">Upload Property :</label>
                        <br />
                        <asp:FileUpload ID="fldUpImage" class="btn btn-primary" width="200px" runat="server" />
                        <asp:Button ID="btnPreview" runat="server" class="btn btn-warning" Text="Preview" OnClick="btnPreview_Click" />
                        <asp:Label ID="lblimg" runat="server" Text="lblimg"> </asp:Label>  
                    </div>
                     <div class="col-lg-3 form-group">
                         <img id="imgStud" runat="server" width="150" height="150" borderstyle="Groove" borderwidth="2px"
                            src="~/images/admin1.jpg" />
                         </div>
                    <%--choose file--%>
                  
                   <%-- <div class="col-lg-12 form-group d-flex justify-content-start">--%>
                      <br />
                    <br />
                      <div class="col-lg-4 form-group">
                          </div>
                         <div class="col-lg-6 form-group">
                        <asp:Button ID="btnSubmit" runat="server" class="btn btn-success" Text="Submit" OnClick="btnSubmit_Click" OnClientClick="return signup();" />&nbsp
                       <asp:Button ID="btnCancel" runat="server" class="btn btn-primary" Text="Cancel" OnClick="btnCancel_Click" />&nbsp
                        <asp:Button ID="btnDelete" runat="server" Visible="false" class="btn btn-danger" Text="Delete" OnClick="btnDelete_Click" />
                             </div>
                       <div class="col-lg-4 form-group">
                          </div>
                     <div class="col-lg-6 form-group">
                        <i class="fa fa-search" id="searchs" style=" margin-left: 110px;"></i>
                        <asp:TextBox ID="txtsearch"  runat="server" Width="203px" OnTextChanged="txtsearch_TextChanged" AutoPostBack="true"></asp:TextBox></div>

                    </div>

                    <div id="divShow" runat="server" class="col-lg-12 form-group d-flex justify-content-start">
                        <div class="table-responsive tgid">
                            <asp:GridView ID="grdDetails" Width="100%" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true"
                                CssClass="mGrid tbltxt table" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                                OnRowCommand="grdDetails_RowCommand" OnDataBound="grdDetails_DataBound" TabIndex="5" OnSelectedIndexChanged="grdDetails_SelectedIndexChanged" OnRowDataBound="grdDetails_RowDataBound">
                                <Columns>
                                                 <asp:TemplateField>
                                                        <HeaderTemplate>
                                                            <input name="toggleAll" onclick="checkAll(this);" type="checkbox" value="ON" />
                                                        </HeaderTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="15px" />
                                                        <HeaderStyle HorizontalAlign="Center" Width="15px" />
                                                        <ItemTemplate>
                                                            <input name="Checkb" type="checkbox" value='<%#Eval("UserId")%>' />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="15px"></ItemStyle>
                                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Plot Details Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkDesign" CausesValidation="false" Text='<%#Eval("Name")%>'
                                                CommandName="show" CommandArgument='<%#Eval("UserId")%>' runat="server"></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Photo">
                                        <ItemTemplate>
                                            <asp:Image ID="UserImg"  width="100" height="100" runat="server" />
                                            <%--<img id="UserImg" runat="server" width="150" height="150" borderstyle="Groove" borderwidth="2px"
                                            src="~/images/admin1.jpg" />--%>
                                           <%-- <asp:Label ID="lblimg" runat="server" Text='<%#Eval("Photo")%>'></asp:Label>--%>
                                            <%--<asp:Label ID="lblid" runat="server" Visible="false" Text='<%#Eval("Admissionno")%>'></asp:Label>--%>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>

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

                                 <%--   <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:Button ID="btnUpdate" runat="server" Text="Edit" CssClass="btn btn-primary" CommandArgument='<%#Eval("UserId")%>' CommandName="UpdateN" ToolTip="Update" />
                                            <asp:Button ID="btnDlt" runat="server" Text="Delete" CssClass="btn btn-danger" ToolTip="Delete" CommandArgument='<%#Eval("UserId")%>' CommandName="DeleteN" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>--%>
                                </Columns>
                            </asp:GridView>
                        </div>
                  </div>
                 </fieldset>
               </div>
        </div>
</asp:Content>

