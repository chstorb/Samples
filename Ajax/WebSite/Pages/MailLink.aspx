<%@ Page Title="MailLink" MasterPageFile="~/Content.master" Language="C#" AutoEventWireup="true" CodeFile="MailLink.aspx.cs" Inherits="Pages_MailLink" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="body" runat="server">
    <div class="well well-lg">
        <h1><%: Title %></h1>
    </div>
    <div class="row">
        <div class="col-md-12">        
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="https://msdn.microsoft.com/en-us/library/f820d25y.aspx" Target="_blank">Web Control Rendering Example</asp:HyperLink>
        </div>
        <div class="col-md-12">
            <aspSample:MailLink id="MailLink1" Font-Bold="true" ForeColor="Green" Email="someone@example.com" runat="server">
                Mail Webmaster
            </aspSample:MailLink>
        </div>
    </div>

</asp:Content>
<asp:Content ID="FooterContent" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
