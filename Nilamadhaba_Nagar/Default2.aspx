<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Index.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <script type="text/javascript">

        function PNLI() {
            $("#PNLInspection_Report").show();
        }
        function PNLL() {
            $("#PNLListOfMeeting_Report").show();
        }
        function PNLB() {
            $("#PNLBMW_Report").show();
        }
        function PNLI() {
            $("#MonitoringProgram_Report").show();
        }
        function PNLI() {
            $("#RegAction_Report").show();
        }
        function PNLI() {
            $("#Sample_Report").show();
        }
        function PNLuins() {
            $("#PNLuins").show();
        }
        function pnlumet() {
            $("#pnlumet").show();
        }
        function pnlubmw() {
            $("#pnlubmw").show();
        }
        function pnlumon() {
            $("#pnlumon").show();
        }
        function pnlureg() {
            $("#pnlureg").show();
        }
        function pnlusam() {
            $("#pnlusam").show();
        }
        


        </script>
      <style>
        .middl {    display: flex;
    justify-content: center;
    align-items: center;
    height: 400px;
    font-weight: 600;
    font-size: 26px;
    color: #cc6f6f;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div id="divForAdmin" runat="server">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">My Dashboard</li>
      </ol>
      <!-- Icon Cards-->
      <div class="row box-col">
        <div class="col-xl-4 col-sm-6 mb-3">
          <div class="card text-white bg-primary o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-check-square-o"></i>
              </div>
              <div class="mr-5">Inspection</div>
            </div>
              <%--<a class="card-footer text-white clearfix small z-1" href="Admin/ListOfMeeting_Report.aspx">
              <span class="float-left">View Details</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>--%>
             
              <asp:Button class="card-footer text-white clearfix small z-1"  ID="btnInsp" runat="server" Text="Click Here" OnClientClick='PNLI(this)' OnClick="btnInsp_Click" />
              
              

             
          </div>
        </div>
        <div class="col-xl-4 col-sm-6 mb-3">
          <div class="card text-white bg-warning o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-list"></i>
              </div>
              <div class="mr-5">Sampling Data</div>
            </div>
              <%--<a class="card-footer text-white clearfix small z-1" href="Admin/RegAction_Report.aspx">
              <span class="float-left">View Details</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>--%>
              <asp:Button class="card-footer text-white clearfix small z-1"  ID="btnsamp" runat="server" Text="Click Here" OnClientClick='PNLI(this)' OnClick="btnsamp_Click" />
          </div>
        </div>
        <div class="col-xl-4 col-sm-6 mb-3">
          <div class="card text-white bg-success o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-users"></i>
              </div>
              <div class="mr-5">Meetings</div>
            </div>
              <%--<a class="card-footer text-white clearfix small z-1" href="Admin/MonitoringProgram_Report.aspx">
              <span class="float-left">View Details</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>--%>
              <%--  <asp:Button class="card-footer text-white clearfix small z-1"  ID="btnmet" runat="server" Text="Click Here" OnClientClick='PNLI(this)' OnClick="btnmet_Click" />--%>
          </div>
        </div>
        <div class="col-xl-4 col-sm-6 mb-3">
          <div class="card text-white bg-danger o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-gavel"></i>
              </div>
              <div class="mr-5">Regulatory Action</div>
            </div>
                              <asp:Button class="card-footer text-white clearfix small z-1"  ID="btnreg" runat="server" Text="Click Here" OnClientClick='PNLI(this)' OnClick="btnreg_Click" />
              <%--<input type="text" class="form-control" id="txtname">--%>
          </div>
        </div>
        <div class="col-xl-4 col-sm-6 mb-3">
          <div class="card text-white bg-info o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-desktop"></i>
              </div>
              <div class="mr-5">Monitoring Program</div>
            </div>
                             <%-- <asp:Button class="card-footer text-white clearfix small z-1"  ID="btnmon" runat="server" Text="Click Here" OnClientClick='PNLI(this)' OnClick="btnmon_Click" />--%>
              <%--<input type="text" class="form-control" id="txtname">--%>
          </div>
        </div>
          <div class="col-xl-4 col-sm-6 mb-3">
          <div class="card text-white bg-dark text-white o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-bar-chart"></i>
              </div>
              <div class="mr-5">BMW</div>
            </div>
                              <asp:Button class="card-footer text-white clearfix small z-1"  ID="btnsbmw" runat="server" Text="Click Here" OnClientClick='PNLI(this)' OnClick="btnsbmw_Click" />
              <%--<input type="text" class="form-control" id="txtname">--%>
          </div>
        </div>
      </div>
      
 
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
    <!-- Logout Modal-->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="Default.aspx">Logout</a>
          </div>
        </div>
      </div>
    </div>
  </div>


         <asp:Panel ID="PNLInspection_Report" runat="server" Visible="false">
             <div class="row justify-content-center inp-form">
                 <div class="col-lg-10">
                     <fieldset class="scheduler-border">
                         <legend class="scheduler-border"><i class="fa fa-user" style="color: #ffc107;"></i>Inspection Report</legend>
                         <div class="row">
                             <div class="col-lg-6 form-group">
                                 <label for="name">Year:</label>
                                 <%--<input type="text" class="form-control" id="txtname">--%>
                                 <asp:DropDownList ID="ddl_year" runat="server" class="form-control" AutoPostBack="true"></asp:DropDownList>
                             </div>

                             <div class="col-lg-6 form-group">
                                 <label for="name">Month:</label>
                                 <%--<input type="text" class="form-control" id="txtname">--%>
                                 <asp:DropDownList ID="ddl_month" runat="server" class="form-control" AutoPostBack="true"></asp:DropDownList>
                             </div>

                             <div class="col-lg-4 form-group">
                             </div>




                             <div class="col-lg-12 form-group d-flex justify-content-start">
                                 <%--  <button type="submit" class="btn btn-success">Submit</button>
                    <button type="reset" class="btn btn-danger" style="margin-left:10px;">Cancel</button>--%>

                                 <asp:Button ID="btnserchins" runat="server" class="btn btn-primary" Text="Search" OnClick="btnserchins_Click" />&nbsp
                     <asp:Button ID="btnExportExcel" runat="server" class="btn btn-primary" Visible="false" Text="ExportToExcel" OnClick="btnExportExcel_Click" />&nbsp
                     <asp:Button ID="btnPrint" runat="server" OnClientClick="PrintDiv();" class="btn btn-primary" Visible="false" Text="Print" Style="margin-right: auto;" OnClick="btnPrint_Click" />&nbsp
                  <%--  <input type="submit" value="print" onclick="PrintDiv();" class="pnt-b">--%>
                                 <asp:Button ID="btnApprove" runat="server" class="btn btn-success" Visible="false" Text="Approve" OnClick="btnApprove_Click1" />&nbsp
                    <asp:Button ID="btnCancel" runat="server" class="btn btn-danger" Visible="false" Text="Reject" OnClick="btnCancel_Click" />&nbsp
                
                             </div>

                             <asp:Panel ID="PNLuins" runat="server" Visible="false">

                                 <table class="w-100">
                                     <tr>
                                         <td class="text-right" >Number Of USER :-&nbsp;&nbsp;&nbsp; </td>
                                         <td class="text-left">
                                            <%-- <asp:Button ID="btnuserins" runat="server" Text="" OnClick="btnuserins_Click" />--%>
                                           <%--  <asp:HyperLink ID="hpruser" runat="server" OnClick="  ">HyperLink</asp:HyperLink>--%>
                                            <%-- <asp:Label ID="lblUSER" runat="server" Text=".."></asp:Label></td>--%>
                                             </td>
                                     </tr>
                                 </table>

                             </asp:Panel>

                             <%--<div id="divShow" runat="server" class="col-lg-12 form-group d-flex justify-content-start">--%>

                             

                             </div>

                             




                         </div>
                     </fieldset>
                 </div>

             </div>
         </asp:Panel>
         <asp:Panel ID="PNLListOfMeeting_Report" runat="server" Visible="false">
             <div class="row justify-content-center inp-form">
                 <div class="col-lg-10">
                     <fieldset class="scheduler-border">
                         <legend class="scheduler-border"><i class="fa fa-user" style="color: #ffc107;"></i>ListOfMeeting_Report</legend>
                         <div class="row">
                             <div class="col-lg-6 form-group">
                                 <label for="name">Year:</label>
                                 <%--<input type="text" class="form-control" id="txtname">--%>
                                 <asp:DropDownList ID="ddl_lom_year" runat="server" class="form-control" AutoPostBack="true"></asp:DropDownList>
                             </div>

                             <div class="col-lg-6 form-group">
                                 <label for="name">Month:</label>
                                 <%--<input type="text" class="form-control" id="txtname">--%>
                                 <asp:DropDownList ID="ddl_lom_month" runat="server" class="form-control" AutoPostBack="true"></asp:DropDownList>
                             </div>

                             <div class="col-lg-4 form-group">
                             </div>




                             <div class="col-lg-12 form-group d-flex justify-content-start">
                                 <%--  <button type="submit" class="btn btn-success">Submit</button>
                    <button type="reset" class="btn btn-danger" style="margin-left:10px;">Cancel</button>--%>

                               <%--  <asp:Button ID="btnserchmet" runat="server" class="btn btn-primary" Text="Search" OnClick="btnserchmet_Click" AutoPostBack="true" />&nbsp
                     <asp:Button ID="Button2" runat="server" class="btn btn-primary" Visible="false" Text="ExportToExcel" OnClick="btnExportExcel_Click" />&nbsp
                     <asp:Button ID="Button3" runat="server" OnClientClick="PrintDiv();" class="btn btn-primary" Visible="false" Text="Print" Style="margin-right: auto;" OnClick="btnPrint_Click" />&nbsp
                  <%--  <input type="submit" value="print" onclick="PrintDiv();" class="pnt-b">--%>
                                <%--  <asp:Button ID="Button4" runat="server" class="btn btn-success" Visible="false" Text="Approve" OnClick="btnApprove_Click" />&nbsp
                    <asp:Button ID="Button5" runat="server" class="btn btn-danger" Visible="false" Text="Reject" OnClick="btnCancel_Click" />&nbsp
                --%>
                             </div>
                              <asp:Panel ID="pnlumet" runat="server" Visible="false">

                                 <table class="w-100">
                                     <tr>
                                         <td class="text-right" >Number Of USER :-&nbsp;&nbsp;&nbsp; </td>
                                         <td class="text-left">
                                           <%--  <asp:Button ID="btnusermet" runat="server" Text="" OnClick="btnusermet_Click"  />--%>
                                           <%--  <asp:HyperLink ID="hpruser" runat="server" OnClick="  ">HyperLink</asp:HyperLink>--%>
                                            <%-- <asp:Label ID="lblUSER" runat="server" Text=".."></asp:Label></td>--%>
                                             </td>
                                     </tr>
                                 </table>

                             </asp:Panel>


                             <div id="div1" runat="server" class="col-lg-12 form-group d-flex justify-content-start">

                       

                             </div>

                            




                         </div>
                     </fieldset>
                 </div>

             </div>
         </asp:Panel>
         <asp:Panel ID="PNLBMW_Report" runat="server" Visible="false">
             <div class="row justify-content-center inp-form">
                 <div class="col-lg-10">
                     <fieldset class="scheduler-border">
                         <legend class="scheduler-border"><i class="fa fa-user" style="color: #ffc107;"></i>BMW_Report</legend>
                         <div class="row">
                             <div class="col-lg-6 form-group">
                                 <label for="name">Year:</label>
                                 <%--<input type="text" class="form-control" id="txtname">--%>
                                 <asp:DropDownList ID="ddl_BMW_year" runat="server" class="form-control"></asp:DropDownList>
                             </div>

                             <div class="col-lg-6 form-group">
                                 <label for="name">Month:</label>
                                 <%--<input type="text" class="form-control" id="txtname">--%>
                                 <asp:DropDownList ID="ddl_BMW_month" runat="server" class="form-control"></asp:DropDownList>
                             </div>

                             <div class="col-lg-4 form-group">
                             </div>




                             <div class="col-lg-12 form-group d-flex justify-content-start">
                                 <%--  <button type="submit" class="btn btn-success">Submit</button>
                    <button type="reset" class="btn btn-danger" style="margin-left:10px;">Cancel</button>--%>

                         
                             </div>
                                         <asp:Panel ID="pnlubmw" runat="server" Visible="false">

                                 <table class="w-100">
                                     <tr>
                                         <td class="text-right" >Number Of USER :-&nbsp;&nbsp;&nbsp; </td>
                                         <td class="text-left">
                                             <%--<asp:Button ID="btnuserbmw" runat="server" Text="" OnClick="btnuserbmw_Click" />--%>
                                           <%--  <asp:HyperLink ID="hpruser" runat="server" OnClick="  ">HyperLink</asp:HyperLink>--%>
                                            <%-- <asp:Label ID="lblUSER" runat="server" Text=".."></asp:Label></td>--%>
                                             </td>
                                     </tr>
                                 </table>

                             </asp:Panel>

                                                   <div id="div3" runat="server" class="col-lg-12 form-group d-flex justify-content-start">

                               

                             </div>

                            




                         </div>
                     </fieldset>
                 </div>

             </div>
         </asp:Panel>
         <asp:Panel ID="MonitoringProgram_Report" runat="server" Visible="false">
             <div class="row justify-content-center inp-form">
                 <div class="col-lg-10">
                     <fieldset class="scheduler-border">
                         <legend class="scheduler-border"><i class="fa fa-user" style="color: #ffc107;"></i>MonitoringProgramSW Report</legend>
                         <div class="row">
                             <div class="col-lg-6 form-group">
                                 <label for="name">Year:</label>
                                 <%--<input type="text" class="form-control" id="txtname">--%>
                                 <asp:DropDownList ID="ddl_mon_year" runat="server" class="form-control"></asp:DropDownList>
                             </div>

                             <div class="col-lg-6 form-group">
                                 <label for="name">Month:</label>
                                 <%--<input type="text" class="form-control" id="txtname">--%>
                                 <asp:DropDownList ID="ddl_mon_month" runat="server" class="form-control"></asp:DropDownList>
                             </div>

                             <div class="col-lg-4 form-group">
                             </div>




                             <div class="col-lg-12 form-group d-flex justify-content-start">
                                 <%--  <button type="submit" class="btn btn-success">Submit</button>
                    <button type="reset" class="btn btn-danger" style="margin-left:10px;">Cancel</button>--%>

                    
                             </div>

                                      <asp:Panel ID="pnlumon" runat="server" Visible="false">

                                 <table class="w-100">
                                     <tr>
                                         <td class="text-right" >Number Of USER :-&nbsp;&nbsp;&nbsp; </td>
                                         <td class="text-left">
                                        <%--     <asp:Button ID="btnusermon" runat="server" Text="" OnClick="btnusermon_Click" />--%>
                                           <%--  <asp:HyperLink ID="hpruser" runat="server" OnClick="  ">HyperLink</asp:HyperLink>--%>
                                            <%-- <asp:Label ID="lblUSER" runat="server" Text=".."></asp:Label></td>--%>
                                             </td>
                                     </tr>
                                 </table>

                             </asp:Panel>

                             <div id="div5" runat="server" class="col-lg-12 form-group d-flex justify-content-start">

                             </div>

                            




                         </div>
                     </fieldset>
                 </div>

             </div>
         </asp:Panel>
         <asp:Panel ID="RegAction_Report" runat="server" Visible="false">
             <div class="row justify-content-center inp-form">
                 <div class="col-lg-10">
                     <fieldset class="scheduler-border">
                         <legend class="scheduler-border"><i class="fa fa-user" style="color: #ffc107;"></i>RegAction Report</legend>
                         <div class="row">
                             <div class="col-lg-6 form-group">
                                 <label for="name">Year:</label>
                                 <%--<input type="text" class="form-control" id="txtname">--%>
                                 <asp:DropDownList ID="ddl_reg_year" runat="server" class="form-control"></asp:DropDownList>
                             </div>

                             <div class="col-lg-6 form-group">
                                 <label for="name">Month:</label>
                                 <%--<input type="text" class="form-control" id="txtname">--%>
                                 <asp:DropDownList ID="ddl_reg_month" runat="server" class="form-control"></asp:DropDownList>
                             </div>

                             <div class="col-lg-4 form-group">
                             </div>




                             <div class="col-lg-12 form-group d-flex justify-content-start">
                                 <%--  <button type="submit" class="btn btn-success">Submit</button>
                    <button type="reset" class="btn btn-danger" style="margin-left:10px;">Cancel</button>--%>

                   
                             </div>

                                      <asp:Panel ID="pnlureg" runat="server" Visible="false">

                                 <table class="w-100">
                                     <tr>
                                         <td class="text-right" >Number Of USER :-&nbsp;&nbsp;&nbsp; </td>
                                         <td class="text-left">
                                            <%-- <asp:Button ID="btnuserreg" runat="server" Text="" OnClick="btnuserreg_Click" />--%>
                                           <%--  <asp:HyperLink ID="hpruser" runat="server" OnClick="  ">HyperLink</asp:HyperLink>--%>
                                            <%-- <asp:Label ID="lblUSER" runat="server" Text=".."></asp:Label></td>--%>
                                             </td>
                                     </tr>
                                 </table>

                             </asp:Panel>

                             <div id="div7" runat="server" class="col-lg-12 form-group d-flex justify-content-start">

                                
                             </div>

                            




                         </div>
                     </fieldset>
                 </div>

             </div>
         </asp:Panel>
         <asp:Panel ID="Sample_Report" runat="server" Visible="false">
             <div class="row justify-content-center inp-form">
                 <div class="col-lg-10">
                     <fieldset class="scheduler-border">
                         <legend class="scheduler-border"><i class="fa fa-user" style="color: #ffc107;"></i>Sample_Report</legend>
                         <div class="row">
                             <div class="col-lg-6 form-group">
                                 <label for="name">Year:</label>
                                 <%--<input type="text" class="form-control" id="txtname">--%>
                                 <asp:DropDownList ID="ddl_sam_year" runat="server" class="form-control"></asp:DropDownList>
                             </div>

                             <div class="col-lg-6 form-group">
                                 <label for="name">Month:</label>
                                 <%--<input type="text" class="form-control" id="txtname">--%>
                                 <asp:DropDownList ID="ddl_sam_month" runat="server" class="form-control"></asp:DropDownList>
                             </div>

                             <div class="col-lg-4 form-group">
                             </div>




                             <div class="col-lg-12 form-group d-flex justify-content-start">
                                 <%--  <button type="submit" class="btn btn-success">Submit</button>
                    <button type="reset" class="btn btn-danger" style="margin-left:10px;">Cancel</button>--%>

             
                             </div>

                                      <asp:Panel ID="pnlusam" runat="server" Visible="false">

                                 <table class="w-100">
                                     <tr>
                                         <td class="text-right" >Number Of USER :-&nbsp;&nbsp;&nbsp; </td>
                                         <td class="text-left">
                                           <%--  <asp:Button ID="btnusersam" runat="server" Text="" OnClick="btnusersam_Click" />--%>
                                           <%--  <asp:HyperLink ID="hpruser" runat="server" OnClick="  ">HyperLink</asp:HyperLink>--%>
                                            <%-- <asp:Label ID="lblUSER" runat="server" Text=".."></asp:Label></td>--%>
                                             </td>
                                     </tr>
                                 </table>

                             </asp:Panel>

                             <div id="div9" runat="server" class="col-lg-12 form-group d-flex justify-content-start">

                          
                             </div>

                            




                         </div>
                     </fieldset>
                 </div>

             </div>
         </asp:Panel>

       

       </div>

   
    <div id="divForUser" runat="server">

         <div class="middl">Welcome</div>
    </div>






<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.5/umd/popper.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.16/js/dataTables.bootstrap4.js"></script>
<script type="text/javascript" src="js/script.js"></script>
      


</asp:Content>

