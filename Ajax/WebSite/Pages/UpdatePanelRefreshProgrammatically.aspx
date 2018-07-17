<%@ Page Title="Programmgesteuertes Aktualisieren eines UpdatePanel" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true" CodeFile="UpdatePanelRefreshProgrammatically.aspx.cs" Inherits="Pages_UpdatePanelRefreshProgrammatically" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .AnswerFloatPanelStyle {
            background-color: bisque;
            position: absolute;
            right: 10px;
            height: 130px;
            width: 150px;
            border-right: silver thin solid;
            border-top: silver thin solid;
            border-left: silver thin solid;
            border-bottom: silver thin solid;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="body" runat="Server">
    <div class="well well-lg">
        <h1><%: Title %></h1>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div id="panel panel-default">
                <div class="panel-body">
                    <div id="AnswerFloatPanel" class="AnswerFloatPanelStyle" runat="server">
                        <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                            <ContentTemplate>
                                Completed Questions:
                                <asp:DataList ID="ResultsList" runat="server">
                                    <ItemTemplate>
                                        <asp:Label ID="ResultQuestion" runat="server" Text='<%# Eval("Key") %>' />
                                        ::
                                        <asp:Label ID="ResultAnswer" runat="server" Text='<%# Eval("Value") %>' />
                                    </ItemTemplate>
                                </asp:DataList>
                                <p style="text-align: right">
                                    <asp:Button ID="SubmitButton" Text="Submit" runat="server" Visible="false"
                                        OnClick="SubmitButton_Click" />
                                </p>
                                <asp:Label ID="Message" runat="Server" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <asp:XmlDataSource ID="SurveyDataSource"
                        runat="server"
                        XPath="/Questions/Question"
                        DataFile="~/App_Data/SurveyQuestions.xml" />
                    <asp:DataList
                        ID="SurveyDataList"
                        DataSourceID="SurveyDataSource"
                        runat="server">

                        <ItemTemplate>
                            <table cellpadding="2" cellspacing="2">
                                <tr>
                                    <td valign="top">
                                        <asp:Label ID="QuestionLabel" Text='<%# XPath("@Title")%>' runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:RadioButtonList ID="ChoicesRadioButtonList" runat="server"
                                            DataSource='<%#XPathSelect("Choices/Choice") %>'
                                            DataTextField="InnerText" DataValueField="InnerText"
                                            AutoPostBack="True"
                                            ToolTip='<%# "Question" + XPath("@ID") %>'
                                            OnSelectedIndexChanged="ChoicesRadioButtonList_SelectedIndexChanged" />
                                    </td>
                                </tr>
                            </table>
                            <hr />
                        </ItemTemplate>
                    </asp:DataList>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="FooterContent" ContentPlaceHolderID="footer" runat="Server">
</asp:Content>

