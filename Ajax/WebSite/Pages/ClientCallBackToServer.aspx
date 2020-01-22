<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true" CodeFile="ClientCallBackToServer.aspx.cs" Inherits="Pages_ClientCallBackToServer" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="body" runat="Server">
<div>
      Callback 1 result: <span id="Message1">0</span>
      <br />
      Callback 2 result: <span id="Message2">0</span>
      <br /> <br />
      <input type="button" 
             value="ClientCallBack1" 
             onclick="CallTheServer1(value1, alert('Increment value'))"/>    
      <input type="button" 
             value="ClientCallBack2" 
             onclick="CallTheServer2(value2, alert('Increment value'))"/>
      <br /> <br />
      <asp:Label id="MyLabel" 
                 runat="server"></asp:Label>
    </div>
</asp:Content>
<asp:Content ID="FooterContent" ContentPlaceHolderID="footer" runat="Server">
    <script>
        var value1 = 0;
        var value2 = 0;

        function ReceiveServerData2(arg, context) {
            Message2.innerText = arg;
            value2 = arg;
        }

        function ProcessCallBackError(arg, context) {
            Message2.innerText = 'An error has occurred.';
        }
    </script>
</asp:Content>

