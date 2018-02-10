<%@ Page Title="Import/Export" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true" CodeFile="Exchange.aspx.cs" Inherits="Pages_Exchange" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="Server">
    <link href="http://querybuilder.js.org/dist/bootstrap-datepicker/dist/css/bootstrap-datepicker3.min.css" rel="stylesheet">
    <link href="http://querybuilder.js.org/dist/seiyria-bootstrap-slider/dist/css/bootstrap-slider.min.css" rel="stylesheet">
    <link href="http://querybuilder.js.org/dist/selectize/dist/css/selectize.bootstrap3.css" rel="stylesheet">
    <link href="http://querybuilder.js.org/dist/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">
    <link href="http://querybuilder.js.org/dist/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
    
    <link href="../Content/querybuilder/query-builder.default.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="body" runat="Server">
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
</asp:Content>
<asp:Content ID="FooterContent" ContentPlaceHolderID="footer" runat="server">
    <script src="http://querybuilder.js.org/dist/moment/min/moment.min.js"></script>
    <script src="http://querybuilder.js.org/dist/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <script src="http://querybuilder.js.org/dist/seiyria-bootstrap-slider/dist/bootstrap-slider.min.js"></script>
    <script src="http://querybuilder.js.org/dist/selectize/dist/js/standalone/selectize.min.js"></script>
    <script src="http://querybuilder.js.org/dist/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
    <script src="http://querybuilder.js.org/dist/sql-parser/browser/sql-parser.js"></script>
    <script src="http://querybuilder.js.org/dist/interact/dist/interact.min.js"></script>

    <script src="../Scripts/querybuilder/query-builder.standalone.js"></script>

    <script>var baseurl = 'http://querybuilder.js.org';</script>
    <script src="../Scripts/querybuilder/demo-import-export.js"></script>
    <script src="../Scripts/querybuilder/demo.js"></script>
</asp:Content>
