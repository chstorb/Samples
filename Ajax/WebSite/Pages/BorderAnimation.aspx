<%@ Page Title="Border Animation" MasterPageFile="~/Content.master" Language="C#" AutoEventWireup="true" CodeFile="BorderAnimation.aspx.cs" Inherits="Pages_BorderAnimation" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="body" runat="server">
    <div class="well well-lg">
        <h1><%: Title %></h1>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div id="panel" style="width:600px;height:300px;border: solid 1px blue;">
                <div id="panelBody" style="width:400px;height:200px;background-color:goldenrod;"></div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="FooterContent" ContentPlaceHolderID="footer" runat="server">
    <script src="../Scripts/ScriptLibrary/BorderAnimation.js"></script>
    <script>
        debugger;
        var app = Sys.Application;
        app.add_init(applicationInitHandler);

        function applicationInitHandler(sender, args) {
            // Create the ScriptLibrary.BorderAnimation component instance.  
            // Set properties and bind events.
            //
            // $create(type, properties, events, references, element);
            // Arguments
            // Parameter   Description
            // type        The type of the component to create.
            // properties  (Optional) A JSON object that describes the properties and their values.
            // events      (Optional) A JSON object that describes the events and their handlers.
            // references  (Optional) A JSON object that describes the properties that are references to other components.
            // element     (Optional) The DOM element that the component must be attached to.
            // https://ajax.asp.net/ajax/documentation/live/ClientReference/Global/CreateShortcutMethod.aspx
            try {
                var a = $create(ScriptLibrary.BorderAnimation, {
                    borderWidth: '5px',
                    color: 'purple',
                    duration: '3000'
                },
                null, null, $get("panel"));
                debugger;
                a.animatePanel();
            } catch (ex) { debugger; alert(ex.message);
            }
        }
    </script>
</asp:Content>