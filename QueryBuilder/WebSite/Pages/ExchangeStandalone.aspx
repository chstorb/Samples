<%@ Page Title="Import/Export standalone" Language="C#" AutoEventWireup="true" CodeFile="ExchangeStandalone.aspx.cs" Inherits="Pages_ExchangeStandalone" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title><%: Page.Title %></title>

    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>
    <webopt:BundleReference runat="server" Path="~/Content/css" />
    <link href="../Content/querybuilder/query-builder.default.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <%--To learn more about bundling scripts in ScriptManager see https://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
                <asp:ScriptReference Name="respond" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Site Scripts--%>
                <%--<asp:ScriptReference Path="~/Scripts/bootbox.js" />--%>
            </Scripts>
        </asp:ScriptManager>
        <div class="well well-lg">
            <h1><%: Title %></h1>
            <p>This demo shows how SQL and MongoDB import/export features are working.</p>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="col-md-12 col-lg-10 col-lg-offset-1">
                            <div id="builder-import_export"></div>

                            <div class="btn-group">
                                <button class="btn btn-warning reset" data-target="import_export">Reset</button>
                            </div>

                            <div class="btn-group">
                                <button class="btn btn-success set-sql" data-target="import_export">Set rules from SQL</button>
                                <button class="btn btn-success set-mongo" data-target="import_export">Set rules from MongoDB</button>
                            </div>

                            <div class="btn-group">
                                <button class="btn btn-primary parse-sql" data-target="import_export" data-stmt="false">SQL</button>
                                <button class="btn btn-primary parse-sql" data-target="import_export" data-stmt="question_mark">SQL statement (?)</button>
                                <button class="btn btn-primary parse-sql" data-target="import_export" data-stmt="named">SQL statement (named)</button>
                                <button class="btn btn-primary parse-mongo" data-target="import_export">MongoDB</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="http://querybuilder.js.org/dist/moment/min/moment.min.js"></script>
    <script src="http://querybuilder.js.org/dist/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <script src="http://querybuilder.js.org/dist/seiyria-bootstrap-slider/dist/bootstrap-slider.min.js"></script>
    <script src="http://querybuilder.js.org/dist/selectize/dist/js/standalone/selectize.min.js"></script>
    <script src="http://querybuilder.js.org/dist/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
    <script src="http://querybuilder.js.org/dist/sql-parser/browser/sql-parser.js"></script>
    <script src="http://querybuilder.js.org/dist/interact/dist/interact.min.js"></script>

    <script src="../Scripts/querybuilder/query-builder.standalone.js"></script>
    <script src="../Scripts/querybuilder/demo-import-export.js"></script>
    <script src="../Scripts/querybuilder/demo.js"></script>
</body>
</html>
