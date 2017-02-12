Type.registerNamespace("ScriptLibrary");

ScriptLibrary.UnorderedList = function () {
    ScriptLibrary.UnorderedList.initializeBase(this);

    this._clickDelegate = null;
}

ScriptLibrary.UnorderedList.prototype = {

    initialize: function () {

        var element = this.get_element();

        if (!element.tabIndex) element.tabIndex = 0;

        if (this._clickDelegate === null) {
            this._clickDelegate = Function.createDelegate(this, this._clickHandler);
        }
        Sys.UI.DomEvent.addHandler(element, 'click', this._clickDelegate);

        ScriptLibrary.HoverButton.callBaseMethod(this, 'initialize');
    },

    dispose: function () {
        var element = this.get_element();

        if (this._clickDelegate) {
            Sys.UI.DomEvent.removeHandler(element, 'click', this._clickDelegate);
            delete this._clickDelegate;
        }

        ScriptLibrary.UnorderedList.callBaseMethod(this, 'dispose');
    },

    // Bind and unbind to click event.
    add_click: function (handler) {
        this.get_events().addHandler('click', handler);
    },
    remove_click: function (handler) {
        this.get_events().removeHandler('click', handler);
    },

    _clickHandler: function (event) {
        var h = this.get_events().getHandler('click');
        if (h) h(this, Sys.EventArgs.Empty);
    }
}

ScriptLibrary.UnorderedList.registerClass('ScriptLibrary.UnorderedList', Sys.Component);

// Since this script is not loaded by System.Web.Handlers.ScriptResourceHandler
// invoke Sys.Application.notifyScriptLoaded to notify ScriptManager 
// that this is the end of the script.
if (typeof (Sys) !== 'undefined') Sys.Application.notifyScriptLoaded();
