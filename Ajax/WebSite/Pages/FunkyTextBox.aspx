<%@ Page Title="Funky Textbox" MasterPageFile="~/Content.master" Language="C#" AutoEventWireup="true" CodeFile="FunkyTextBox.aspx.cs" Inherits="Pages_FunkyTextBox" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="body" runat="server">
    <div class="well well-lg">
        <h1><%: Title %></h1>
    </div>
    <div class="row">
        <div class="col-md-12">        
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="http://aspnet.4guysfromrolla.com/articles/080906-1.aspx" Target="_blank">Accessing Embedded Resources through a URL using WebResource.axd</asp:HyperLink>
        </div>
        <div class="col-md-12">
            <aspSample:FunkyTextBox ID="FunkyTextBox1" runat="server" DirectDump="false" CssClass="funky1"></aspSample:FunkyTextBox>
        </div>
        <div class="col-md-12">
            <aspSample:FunkyTextBox ID="FunkyTextBox2" runat="server" DirectDump="false" CssClass="funky2"></aspSample:FunkyTextBox>
        </div>
    </div>

</asp:Content>
<asp:Content ID="FooterContent" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
