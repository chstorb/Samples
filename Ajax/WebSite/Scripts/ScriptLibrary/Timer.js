Type.registerNamespace("ScriptLibrary");

ScriptLibrary.Timer = function () {
    ScriptLibrary.Timer.initializeBase(this);

    this._interval = 1000;
    this._enabled = false;
    this._timer = null;
}

ScriptLibrary.Timer.prototype = {
    // OK to declare value types in the prototype


    get_interval: function () {
        /// <value type="Number">Interval in milliseconds</value>
        return this._interval;
    },
    set_interval: function (value) {
        if (this._interval !== value) {
            this._interval = value;
            this.raisePropertyChanged('interval');

            if (!this.get_isUpdating() && (this._timer !== null)) {
                this._restartTimer();
            }
        }
    },

    get_enabled: function () {
        /// <value type="Boolean">True if timer is enabled, false if disabled.</value>
        return this._enabled;
    },
    set_enabled: function (value) {
        if (value !== this.get_enabled()) {
            this._enabled = value;
            this.raisePropertyChanged('enabled');
            if (!this.get_isUpdating()) {
                if (value) {
                    this._startTimer();
                }
                else {
                    this._stopTimer();
                }
            }
        }
    },

    // events
    add_tick: function (handler) {
        /// <summary>Adds a event handler for the tick event.</summary>
        /// <param name="handler" type="Function">The handler to add to the event.</param>
        this.get_events().addHandler("tick", handler);
    },
    remove_tick: function (handler) {
        /// <summary>Removes a event handler for the tick event.</summary>
        /// <param name="handler" type="Function">The handler to remove from the event.</param>
        this.get_events().removeHandler("tick", handler);
    },

    dispose: function () {
        // call set_enabled so the property changed event fires, for potentially attached listeners.
        this.set_enabled(false);
        // make sure it stopped so we aren't called after disposal
        this._stopTimer();
        // be sure to call base.dispose()
        ScriptLibrary.Timer.callBaseMethod(this, 'dispose');
    },

    updated: function () {
        ScriptLibrary.Timer.callBaseMethod(this, 'updated');
        // called after batch updates, this.beginUpdate(), this.endUpdate().
        if (this._enabled) {
            this._restartTimer();
        }
    },

    _timerCallback: function () {
        var handler = this.get_events().getHandler("tick");
        if (handler) {
            handler(this, Sys.EventArgs.Empty);
        }
    },

    _restartTimer: function () {
        this._stopTimer();
        this._startTimer();
    },

    _startTimer: function () {
        // save timer cookie for removal later
        this._timer = window.setInterval(Function.createDelegate(this, this._timerCallback), this._interval);
    },

    _stopTimer: function () {
        if (this._timer) {
            window.clearInterval(this._timer);
            this._timer = null;
        }
    }
}

ScriptLibrary.Timer.registerClass('ScriptLibrary.Timer', Sys.Component);

// Since this script is not loaded by System.Web.Handlers.ScriptResourceHandler
// invoke Sys.Application.notifyScriptLoaded to notify ScriptManager 
// that this is the end of the script.
if (typeof (Sys) !== 'undefined') Sys.Application.notifyScriptLoaded();