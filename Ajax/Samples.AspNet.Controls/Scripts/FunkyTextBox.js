function ChangeBackgroundColor(ctrl) {
    var max = funkyTextBoxColors.length;
    var rndNum = Math.floor(Math.random() * Math.floor(max));
    if (ctrl)
        ctrl.style.backgroundColor = funkyTextBoxColors[rndNum];
}

var funkyTextBoxColors = new Array('#89C142', '#EF14E5', '#75762C', '#BB9E24', '#BF4A44', '#9D4A77');
