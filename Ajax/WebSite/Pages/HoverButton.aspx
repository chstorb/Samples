<%@ Page Title="Creating Custom ASP.NET AJAX Client Controls" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true" CodeFile="HoverButton.aspx.cs" Inherits="Pages_HoverButton" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /*button {border: solid 1px black}*/
        #HoverLabel {color: blue}
    </style>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="body" runat="server">
    <div class="well well-lg">
        <h1><%: Title %></h1>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    <button type="button" id="Button1" class="btn btn-default"></button>&nbsp;
                    <label id="HoverLabel"></label>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <h2>Creating Basic Functionality of a Non-visual Client Component</h2>
            <p>An ASP.NET AJAX client control represents a DOM element as a client object and extends a markup representation or provides additional functionality for the element. For example, a client control might extend an HTML element to react to mouse events by applying different CSS styles.</p>
            <p><a class="btn btn-default" href="https://ajax.asp.net/ajax/documentation/live/tutorials/CreatingCustomClientControlsTutorial.aspx" target="_blank">Learn more &raquo;</a></p>
        </div>
        <div class="col-md-8"></div>
    </div>
</asp:Content>
<asp:Content ID="FooterContent" ContentPlaceHolderID="footer" runat="server">
    <script src="../Scripts/ScriptLibrary/HoverButton.js"></script>
    <script>
        var app = Sys.Application;
        app.add_init(applicationInitHandler);

        function applicationInitHandler(sender, args) {
            $create(ScriptLibrary.HoverButton,
                {
                    text: 'A HoverButton Control',
                    element: {
                        style: {
                            fontWeight: "bold",
                            borderWidth: "2px"
                        }
                    }
                },
                {
                    click: start,
                    hover: doSomethingOnHover,
                    unhover: doSomethingOnUnHover
                },
                null,
                $get('Button1'));
        }

        function doSomethingOnHover(sender, args) {
            hoverMessage = "The mouse is over the button."
            $get('HoverLabel').innerHTML = hoverMessage;
        }

        function doSomethingOnUnHover(sender, args) {
            $get('HoverLabel').innerHTML = "";
        }

        function start(sender, args) {
            alert("The start function handled the HoverButton click event.");
        }
    </script>
</asp:Content>


