using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_ClientCallBackToServer : System.Web.UI.Page, ICallbackEventHandler
{
    public int cbCount = 0;

    #region ICallbackEventHandler implementation

    public string GetCallbackResult()
    {
        return cbCount.ToString();
    }

    public void RaiseCallbackEvent(string eventArgument)
    {
        cbCount = Convert.ToInt32(eventArgument) + 1;
    }

    #endregion 

    protected void Page_Load(object sender, EventArgs e)
    {
        // Define a StringBuilder to hold messages to output.
        StringBuilder sb = new StringBuilder();

        // Check if this is a postback.
        sb.Append("No page postbacks have occurred.");
        if (Page.IsPostBack)
        {
            sb.Append("A page postback has occurred.");
        }

        // Write out any messages.
        MyLabel.Text = sb.ToString();

        #region ICallbackEventHandler implementation

        // Get a ClientScriptManager reference from the Page class.
        ClientScriptManager cs = Page.ClientScript;

        // Define one of the callback script's context.
        // The callback script will be defined in a script block on the page.
        StringBuilder context1 = new StringBuilder();
        context1.Append("function ReceiveServerData1(arg, context)");
        context1.Append("{");
        context1.Append("Message1.innerText = arg;");
        context1.Append("value1 = arg;");
        context1.Append("}");

        // Define callback references.
        string cbReference1 = cs.GetCallbackEventReference(control: this, argument: "arg", clientCallback: "ReceiveServerData1", context: context1.ToString());
        string cbReference2 = cs.GetCallbackEventReference(target: "'" + Page.UniqueID + "'", argument: "arg", clientCallback: "ReceiveServerData2", context: "", clientErrorCallback:  "ProcessCallBackError", useAsync: false);
        
        string callbackScript1 = "function CallTheServer1(arg, context) {" + cbReference1 + "; }";
        
        string callbackScript2 = "function CallTheServer2(arg, context) {" + cbReference2 + "; }";

        // Register script blocks will perform call to the server.
        cs.RegisterClientScriptBlock(this.GetType(), "CallTheServer1", callbackScript1, true);
        cs.RegisterClientScriptBlock(this.GetType(), "CallTheServer2", callbackScript2, true);

        #endregion
    }
}