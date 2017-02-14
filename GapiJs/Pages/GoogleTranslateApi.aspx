<%@ Page Title="Loading an API and Making a Request" MasterPageFile="~/Content.master" Language="C#" AutoEventWireup="true" CodeFile="GoogleTranslateApi.aspx.cs" Inherits="Pages_GoogleTranslateApi" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="body" runat="server">
    <div class="well well-lg">
        <h1><%: Title %></h1>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div id="results"></div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="FooterContent" ContentPlaceHolderID="footer" runat="server">
    <script src="../Scripts/gapi.js"></script>
    <script>
        function start() {
            // Initializes the client with the API key and the Translate API.
            gapi.client.init({
                'apiKey': '<%= Application["GOOGLE_API_KEY"] %>',
            'discoveryDocs': ['https://www.googleapis.com/discovery/v1/apis/translate/v2/rest'],
            }).then(function () {
                // Executes an API request, and returns a Promise.
                // The method name `language.translations.list` comes from the API discovery.
                return gapi.client.language.translations.list({
                    q: 'hello world',
                    source: 'en',
                    target: 'de',
                });
            }).then(function (response) {
                var text = response.result.data.translations[0].translatedText;
                console.log(text);
                var textNode = document.createTextNode(text);
                var resultsPanel = $get("results");
                resultsPanel.appendChild(textNode);
            }, function (reason) {
                var text = reason.result.error.message;
                console.log('Error: ' + text);
                var textNode = document.createTextNode(text);
                var resultsPanel = $get("results");
                resultsPanel.appendChild(textNode);
            });
    };

    // Loads the JavaScript client library and invokes `start` afterwards.
    gapi.load('client', start);
    </script>
</asp:Content>
