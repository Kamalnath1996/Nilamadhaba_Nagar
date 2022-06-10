<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Index.master" AutoEventWireup="true" CodeFile="Plot_Location_Master.aspx.cs" Inherits="Master_Pages_Plot_Location_Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="row justify-content-center inp-form">
        <div class="col-lg-12">
            <fieldset class="scheduler-border">
                <legend class="scheduler-border"><i class="fa fa-user" style="color: #ffc107;"></i>Plot Location Master</legend>

                         <div id="divShow" runat="server" class="col-lg-12 form-group d-flex justify-content-start">
                        <div class="table-responsive tgid" align="center">
                            <asp:GridView ID="grdDetails" Width="50%" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true"
                                CssClass="mGrid tbltxt table" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                                OnRowCommand="grdDetails_RowCommand">
                                <Columns>
                                                 <asp:TemplateField>
                                                        <HeaderTemplate>
                                                            <input name="toggleAll" onclick="checkAll(this);" type="checkbox" value="ON" />
                                                        </HeaderTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="15px" />
                                                        <HeaderStyle HorizontalAlign="Center" Width="15px" />
                                                        <ItemTemplate>
                                                            <input name="Checkb" type="checkbox" value='<%#Eval("id")%>' />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="15px"></ItemStyle>
                                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Plot Location">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkDesign" CausesValidation="false" Text='<%#Eval("Plot_Location")%>'
                                                CommandName="show" CommandArgument='<%#Eval("id")%>' runat="server"></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderText="EDIT">
                                        <ItemTemplate>                                         
                                                <asp:LinkButton ID="lnkEdit" runat="server" CommandName="UpdateN" CommandArgument='<%#Eval("id") %>' CausesValidation="false" ToolTip="Update"><i class="fa fa-2x fa-edit" style="color:blue;"></i></asp:LinkButton>                                            
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Delete">
                                        <ItemTemplate>
                                         
                                             <asp:LinkButton ID="lnkDel" runat="server" OnClientClick="javascript:return confirm('Are You Sure want to delete this Property?')" CommandName="DeleteN" CommandArgument='<%#Eval("id") %>' CausesValidation="false" ToolTip="DeleteN"><i class="fa fa-2x fa-trash" style="color:red;"></i></asp:LinkButton>
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:TemplateField>

                                </Columns>
                            </asp:GridView>
                        </div>
                  </div>

                <div class="row">
                      <div class="col-lg-4 form-group">
                          </div>
                    <div class="col-lg-3 form-group">
                        <label for="name">Plot Location:</label>
                        <%--<input type="text" class="form-control" id="txtname">--%>
                        <asp:TextBox ID="txtplotLoc" runat="server" CssClass="form-control" onkeypress="return validation(event);"></asp:TextBox>
                    </div>
                 
                   <div class="col-lg-4 form-group">
                          </div>
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
             
                    </div>

           
                 </fieldset>
               </div>
        </div>
</asp:Content>

