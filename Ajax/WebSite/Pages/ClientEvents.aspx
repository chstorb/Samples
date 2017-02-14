<%@ Page Title="Lebenszyklusereignisse des AJAX-Clients" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true" CodeFile="ClientEvents.aspx.cs" Inherits="Pages_ClientEvents" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="body" runat="server">
    <div class="well well-lg">
        <h1><%: Title %></h1>
    </div>
    <div class="well">
        <p class="lead">Postbacks from inside the outer panel and inner panel are asynchronous postbacks.</p>
        <p>APP = Sys.Application.</p>
        <p>PRM = Sys.WebForms.PageRequestManager.</p>
    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:UpdatePanel ID="OuterPanel" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <p>Postbacks from inside the outer panel and inner panel are asynchronous postbacks.</p>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <asp:Button ID="OPButton1" Text="Outer Panel Button" runat="server" />
                            <p>Last updated on <%= DateTime.Now.ToString() %></p>
                            <br />
                            <br />
                            <asp:UpdatePanel ID="NestedPanel" UpdateMode="Conditional" runat="server">
                                <ContentTemplate>
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                        <asp:Button ID="NPButton1" Text="Nested Panel 1 Button" runat="server" />
                                        <p>Last updated on <%= DateTime.Now.ToString() %></p>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>

            <input type="button" class="btn btn-default" onclick="Clear();" value="Clear" />

            <asp:Button ID="FullPostBack" CssClass="btn btn-default" runat="server" Text="Full Postback" />
            <a href="http://www.microsoft.com">Test Window Unload</a>
            <br />
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <span id="ClientEvents"></span>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <h2>Sys.Application-Klasse</h2>
            <p>
                Stellt ein Laufzeitobjekt bereit, das Clientereignisse verfügbar macht und Clientkomponenten verwaltet, die bei der Anwendung registriert sind. Die Member dieses Objekts sind global verfügbar, nachdem die Clientanwendung initialisiert wurde. Die Member können aufgerufen werden, ohne eine Instanz der Klasse zu erstellen. 
            </p>
            <p>
                <a class="btn btn-default" href="https://msdn.microsoft.com/de-de/library/bb310856(v=vs.100).aspx" target="_blank">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>PageRequestManager-Klasse</h2>
            <p>
                Die PageRequestManager-Klasse der Microsoft AJAX Library verwaltet Teilaktualisierungen von Seiten im Browser. Wenn eine Seite ein ScriptManager-Steuerelement sowie mindestens ein UpdatePanel-Steuerelement enthält, sind automatisch Teilaktualisierungen der Seite möglich. Die PageRequestManager-Klasse macht Eigenschaften, Methoden und Ereignisse verfügbar, die es Ihnen ermöglichen, Teilaktualisierungen von Seiten mit Clientskripts anzupassen. Die PageRequestManager-Klasse macht ein Ereignismodell für die Clientseite verfügbar, das Sie auf eine ähnliche Weise wie das Ereignismodell für die Serverseite verwenden können.
            </p>
            <p>
                <a class="btn btn-default" href="https://msdn.microsoft.com/de-de/library/bb386571(v=vs.100).aspx" target="_blank">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Lebenszyklusereignisse des AJAX-Clients</h2>
            <p>
                Eine AJAX-fähige ASP.NET-Seite löst die gleichen serverseitigen Lebenszyklusereignisse wie eine ASP.NET 2.0-Webseite und darüber hinaus auch clientseitige Lebenszyklusereignisse aus. Die Clientereignisse ermöglichen die Anpassung der Benutzeroberfläche sowohl für Postbacks als auch für asynchrone Postbacks (Teilaktualisierungen von Seiten). Die Clientereignisse sind auch hilfreich bei der Verwaltung benutzerdefinierter Skriptkomponenten während der Lebensdauer der Seite im Browser. 
            </p>
            <p>
                <a class="btn btn-default" href="https://msdn.microsoft.com/de-de/library/bb386417(v=vs.100).aspx" target="_blank">Learn more &raquo;</a>
            </p>
        </div>
    </div>
</asp:Content>
<asp:Content ID="FooterContent" ContentPlaceHolderID="footer" runat="server">
    <script>
        // Hook up Application event handlers.
        var app = Sys.Application;
        app.add_load(ApplicationLoad);
        app.add_init(ApplicationInit);
        app.add_disposing(ApplicationDisposing);
        app.add_unload(ApplicationUnload);


        // Application event handlers for component developers.
        function ApplicationInit(sender) {
            debugger;
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            if (!prm.get_isInAsyncPostBack()) {
                prm.add_initializeRequest(InitializeRequest);
                prm.add_beginRequest(BeginRequest);
                prm.add_pageLoading(PageLoading);
                prm.add_pageLoaded(PageLoaded);
                prm.add_endRequest(EndRequest);
            }
            $get('ClientEvents').innerHTML += "APP:: Application init. <br/>";
        }
        function ApplicationLoad(sender, args) {
            debugger;
            $get('ClientEvents').innerHTML += "APP:: Application load. ";
            $get('ClientEvents').innerHTML += "(isPartialLoad = " + args.get_isPartialLoad() + ")<br/>";
        }
        function ApplicationUnload(sender) {
            debugger;
            alert('APP:: Application unload.');
        }
        function ApplicationDisposing(sender) {
            debugger;
            $get('ClientEvents').innerHTML += "APP:: Application disposing. <br/>";
        }
        // Application event handlers for page developers.
        function pageLoad() {
            debugger;
            $get('ClientEvents').innerHTML += "PAGE:: Load.<br/>";
        }

        function pageUnload() {
            debugger;
            alert('Page:: Page unload.');
        }

        // PageRequestManager event handlers.
        function InitializeRequest(sender, args) {
            debugger;
            $get('ClientEvents').innerHTML += "<hr/>";
            $get('ClientEvents').innerHTML += "PRM:: Initializing async request.<br/>";
        }
        function BeginRequest(sender, args) {
            debugger;
            $get('ClientEvents').innerHTML += "PRM:: Begin processing async request.<br/>";
        }
        function PageLoading(sender, args) {
            debugger;
            $get('ClientEvents').innerHTML += "PRM:: Loading results of async request.<br/>";
            var updatedPanels = printArray("PanelsUpdating", args.get_panelsUpdating());
            var deletedPanels = printArray("PanelsDeleting", args.get_panelsDeleting());

            var message = "-->" + updatedPanels + "<br/>-->" + deletedPanels + "<br/>";

            document.getElementById("ClientEvents").innerHTML += message;
        }
        function PageLoaded(sender, args) {
            debugger;
            $get('ClientEvents').innerHTML += "PRM:: Finished loading results of async request.<br/>";
            var updatedPanels = printArray("PanelsUpdated", args.get_panelsUpdated());
            var createdPanels = printArray("PaneslCreated", args.get_panelsCreated());

            var message = "-->" + updatedPanels + "<br/>-->" + createdPanels + "<br/>";

            $get('ClientEvents').innerHTML += message;
        }
        function EndRequest(sender, args) {
            debugger;
            $get('ClientEvents').innerHTML += "PRM:: End of async request.<br/>";
        }

        // Helper functions.
        function Clear() {
            $get('ClientEvents').innerHTML = "";
        }
        function printArray(name, arr) {
            var panels = name + '=' + arr.length;
            if (arr.length > 0) {
                panels += "(";
                for (var i = 0; i < arr.length; i++) {
                    panels += arr[i].id + ',';
                }
                panels = panels.substring(0, panels.length - 1);
                panels += ")";
            }
            return panels;
        }
    </script>
</asp:Content>

