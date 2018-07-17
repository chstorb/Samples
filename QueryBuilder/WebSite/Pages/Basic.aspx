<%@ Page Title="Basic" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true" CodeFile="Basic.aspx.cs" Inherits="Pages_Basic" %>

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
        <p>This demo shows the basic features of the QueryBuilder. Click one of the blue buttons to trigger the validation and display the output.</p>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="col-md-12 col-lg-10 col-lg-offset-1">
                        <div id="builder-basic"></div>
                        <div class="btn-group">
                            <button class="btn btn-warning reset" data-target="basic">Reset</button>
                            <button class="btn btn-success set-json" data-target="basic">Set rules</button>
                            <button class="btn btn-primary parse-json" data-target="basic">Get rules</button>
                        </div>
                        <div class="btn-group">
                            <button class="btn btn-primary destroy" data-target="basic">Destroy</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="FooterContent" ContentPlaceHolderID="footer" runat="server">
    <script src="../Scripts/querybuilder/query-builder.standalone.js"></script>
    <script src="../Scripts/querybuilder/demo-basic.js"></script>
    <script src="../Scripts/querybuilder/demo.js"></script>    
    <script type="text/javascript">
        $(".destroy").on("click", function () {
            debugger;
            try {
                $('#builder-basic').queryBuilder('destroy');
            } catch (ex) {
                alert(ex.message);
            }
        });
    </script>
</asp:Content>
