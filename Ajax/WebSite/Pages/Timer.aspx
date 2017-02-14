<%@ Page Title="Custom Non-Visual Client Components" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true" CodeFile="Timer.aspx.cs" Inherits="Pages_Timer" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="body" runat="server">
    <div class="well well-lg">
        <h1><%: Title %></h1>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    Timer Tick Count: <span id="result" class="badge">0</span>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <h2>Creating Basic Functionality of a Non-visual Client Component</h2>
            <p>An ASP.NET AJAX non-visual client component encapsulates JavaScript code that is intended to be reusable across applications. An example of a non-visual component is a timer component that raises events at set intervals.</p>
            <p><a class="btn btn-default" href="https://msdn.microsoft.com/en-us/library/bb386520.aspx" target="_blank">Learn more &raquo;</a></p>
        </div>
        <div class="col-md-8"></div>
    </div>
</asp:Content>
<asp:Content ID="FooterContent" ContentPlaceHolderID="footer" runat="server">
    <script src="../Scripts/ScriptLibrary/Timer.js"></script>
    <script>
        function OnTick(sender, args) {
            var result = $get("result");
            result.innerText = parseInt(result.innerText) + 1;
        }

        var app = Sys.Application;
        app.add_init(applicationInitHandler);

        function applicationInitHandler(sender, args) {
            // Create the ScriptLibrary.Timer component instance.  
            // Set properties and bind events.
            $create(ScriptLibrary.Timer,
                { enabled: true, id: "scriptLibraryTimer1", interval: 2000 },
                { tick: OnTick }, null, null);
        }
    </script>
</asp:Content>

