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
             onclick="DoCallTheServer1()"/>    
      <input type="button" 
             value="ClientCallBack2" 
             onclick="DoCallTheServer2()"/>
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

        function DoCallTheServer1()
        {
            debugger;
            CallTheServer1(value1, alert('Increment value'));
        }

        function DoCallTheServer2()
        {
            debugger;
            CallTheServer2(value2, alert('Increment value'))
        }
    </script>
</asp:Content>

