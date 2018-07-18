using System;
using System.ComponentModel;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Samples.AspNet.Controls
{
    [DefaultProperty("Text")]
    [ToolboxData("<{0}:FunkyTextBox runat=server></{0}:FunkyTextBox>")]
    public class FunkyTextBox : TextBox
    {
        [Category("Behavior")]
        [DefaultValue(true)]
        [Localizable(false)]
        public bool DirectDump
        {
            get
            {
                object b = ViewState["DirectDump"];
                return ((b == null) ? false : (bool)b);
            }
            set
            {
                ViewState["DirectDump"] = value;
            }
        }

        public static object StreamHelper { get; private set; }

        protected override void AddAttributesToRender(System.Web.UI.HtmlTextWriter writer)
        {
            // Wire up the onkeypress event handler to the ChangeBackgroundColor() JavaScript function
            writer.AddAttribute("onkeypress", "ChangeBackgroundColor(this);");

            base.AddAttributesToRender(writer);
        }

        protected override void OnPreRender(EventArgs e)
        {
            // When pre-rendering, ...
            if (DirectDump)
            {
                // ... dump in the JavaScript directly into the page
                // (Although the external JavaScript approach is more efficient)
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "FunkyTextBox",
                    @"
                    function ChangeBackgroundColor(ctrl)
                    {
                      var max = funkyTextBoxColors.length;
                      var rndNum = Math.floor(Math.random() * Math.floor(max));
                      if (ctrl)
                        ctrl.style.backgroundColor = funkyTextBoxColors[rndNum];
                    }

                    var funkyTextBoxColors =  new Array('#89C142', '#EF14E5', '#75762C', '#BB9E24', '#BF4A44', '#9D4A77');
                    ", true);
            }
            else
            {
                // ... add in external files

                // JavaScript
                var javaScriptResourceName = "Samples.AspNet.Controls.Scripts.FunkyTextBox.js";
                if (!Page.ClientScript.IsClientScriptIncludeRegistered(key: javaScriptResourceName))
                {
                    var urlJavaScript = Page.ClientScript.GetWebResourceUrl(type: typeof(FunkyTextBox), resourceName: javaScriptResourceName);
                    Page.ClientScript.RegisterClientScriptInclude(type: typeof(FunkyTextBox), key: javaScriptResourceName, url: urlJavaScript);
                }

                // StypleSheet
                var styleSheetResourceName = "Samples.AspNet.Controls.Styles.FunkyTextBox.css";
                if (!Page.ClientScript.IsClientScriptBlockRegistered(key: styleSheetResourceName))
                {
                    var urlStyleSheet = Page.ClientScript.GetWebResourceUrl(typeof(FunkyTextBox), styleSheetResourceName);
                    var css = $"\r\n<link href=\"{urlStyleSheet}\" type=\"text/css\" rel=\"stylesheet\" />";
                    Page.ClientScript.RegisterClientScriptBlock(type: typeof(FunkyTextBox), key: styleSheetResourceName, script: css, addScriptTags: false);

                    //var htmlLink = new HtmlLink
                    //{
                    //    Href = Page.ClientScript.GetWebResourceUrl(type: typeof(FunkyTextBox), resourceName: "Samples.AspNet.Controls.Styles.FunkyTextBox.css")
                    //};
                    //htmlLink.Attributes.Add("rel", "stylesheet");
                    //htmlLink.Attributes.Add("type", "text/css");
                    //Page.Header.Controls.Add(htmlLink);
                }
            }

            base.OnPreRender(e);
        }

        protected override void RenderContents(HtmlTextWriter output)
        {
            output.Write(Text);
        }
    }
}
