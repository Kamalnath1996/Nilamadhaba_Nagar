<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Index.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Nilamadhaba Nagar.com</title>
    <link href="Css/Style.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <!-- Main content -->

        <!-- Small boxes (Stat box) -->
        <div class="row">

            <!-- ./col -->

            <div class="col-lg-3 col-xs-6">
                <!-- small box -->

                <div class="small-box bg-green">
                    <asp:LinkButton ID="lnkProperty" ToolTip="Click here to See Property Details" runat="server" OnClick="lnkProperty_Click">
                        <div class="inner">
                            <h3>&nbsp;<asp:Label ID="lblProperty" ForeColor="White" runat="server"></asp:Label></h3>
                            <p class="admin">&nbsp;Admin</p>

                            <div class="icon">
                                <%--   <i class="ion ion-stats-bars"></i>--%>
                                <%--   <img src="Image/admin.jpg" style="height:40px; width:40px;"/>--%>
                                <img class="images" src="Image/admin1.jpg" />
                            </div>
                        </div>
                    </asp:LinkButton>
                    <a href="AddNewProp.aspx" class="small-box-footer">Add <i class="fa fa-arrow-circle-right"></i></a>

                </div>

            </div>


            <!-- ./col -->
            <div class="spaces">
            </div>
            <div class="col-lg-3 col-xs-6">
                <!-- small box -->

                <div class="small-box bg-yellow">
                    <asp:LinkButton ID="lnkCustomer" ToolTip="Click here to See Customer Details" runat="server" OnClick="lnkCustomer_Click">
                        <div class="inner">

                            <h3>&nbsp;<asp:Label ID="lblCustomer" ForeColor="White" runat="server"></asp:Label></h3>
                            <p class="user">&nbsp;User</p>
                            <div class="icon">
                                <%--    <i class="ion ion-person-add"></i>--%>
                                <img class="images" src="Image/user4.jpg"/>
                            </div>
                        </div>
                    </asp:LinkButton>
                    <a href="AddCustomer.aspx" class="small-box-footer">Total User<i class="fa fa-arrow-circle-right"></i></a>
                </div>

            </div>
            <!-- ./col -->

            <!-- ./col -->
        </div>

        <div class="row" id="rpProperty" runat="server">

            <!-- column -->

        </div>



        <!-- /.content -->
    </div>
</asp:Content>

