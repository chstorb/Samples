Type.registerNamespace("ScriptLibrary");

ScriptLibrary.BorderAnimation = function (element) {
    
    ScriptLibrary.BorderAnimation.initializeBase(this, [element]);

    this._color = 'red';
    this._duration = 1500;
    this._borderWidth = '1px';
}
ScriptLibrary.BorderAnimation.prototype = {
    animatePanel: function () {
        debugger;
        var s = this.get_element().style;
        s.borderWidth = this._borderWidth;
        s.borderColor = this._color;
        s.borderStyle = 'solid';
        window.setTimeout(
            function () { { s.borderWidth = 0; } },
            this._duration
        );
    },

    get_borderWidth: function() {
        return this._borderWidth;
    },

    set_borderWidth: function (value) {
        this._borderWidth = value;
    },

    get_color: function () {
        return this._color;
    },

    set_color: function (value) {
        this._color = value;
    },

    get_duration: function () {
        return this._duration;
    },

    set_duration: function (value) {
        this._duration = value;
    }

}

ScriptLibrary.BorderAnimation.registerClass('ScriptLibrary.BorderAnimation', Sys.UI.Control);

if (typeof (Sys) !== 'undefined') Sys.Application.notifyScriptLoaded();