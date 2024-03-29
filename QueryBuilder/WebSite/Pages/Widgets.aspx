﻿<%@ Page Title="Widgets" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true" CodeFile="Widgets.aspx.cs" Inherits="Pages_Widgets" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <link href="http://querybuilder.js.org/dist/bootstrap-datepicker/dist/css/bootstrap-datepicker3.min.css" rel="stylesheet">
    <link href="http://querybuilder.js.org/dist/seiyria-bootstrap-slider/dist/css/bootstrap-slider.min.css" rel="stylesheet">
    <link href="http://querybuilder.js.org/dist/selectize/dist/css/selectize.bootstrap3.css" rel="stylesheet">
    <link href="http://querybuilder.js.org/dist/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">
    <link href="http://querybuilder.js.org/dist/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
    
    <link href="../Content/querybuilder/query-builder.default.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="body" runat="server">
    <div class="well well-lg">
        <h1><%: Title %></h1>
        <p>This demo shows how to integrate widgets into QueryBuilder rules. Widgets used are <a href="https://github.com/eternicode/bootstrap-datepicker">Bootstrap Datepicker</a>, <a href="https://github.com/seiyria/bootstrap-slider">Bootstrap Slider</a> and <a href="https://github.com/brianreavis/selectize.js">Selectize</a>.<br>The filter <b>Coordinates</b> shows how to define a custom input (here two linked &lt;select&gt;) without using a plugin.</p>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="col-md-12 col-lg-10 col-lg-offset-1">
                        <div id="builder-widgets"></div>
                        <div class="btn-group">
                            <button class="btn btn-warning reset" data-target="basic">Reset</button>
                            <button class="btn btn-success set-json" data-target="basic">Set rules</button>
                            <button class="btn btn-primary parse-json" data-target="basic">Get rules</button>
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
    <script src="../Scripts/querybuilder/demo-widgets.js"></script>
    <script src="../Scripts/querybuilder/demo.js"></script>
</asp:Content>

