app.vue.computed.ScoreDisplay = function () {

    if (this.game.score !== null) {
        return app.helpers.formatNumber(this.game.score);
    }

    var go = this.game.go;

    if (go < 1) {
        return '';
    }

    var score = app.game.getScoreFromData(this.game.results.accuracy[go - 1], this.game.results.speed[go - 1]);

    return '+' + app.helpers.formatNumber(score);
};

app.vue.computed.ScoreDisplayAccuracy = function () {

    var go = this.game.go;

    if (go < 1) {
        return '';
    }

    var accuracy = this.game.results.accuracy[go - 1];

    return (accuracy * 100).toFixed(1) + '%';
};

app.vue.computed.ScoreDisplaySpeed = function () {

    var go = this.game.go;

    if (go < 1) {
        return '';
    }

    var speed = this.game.results.speed[go - 1];

    return (speed * 100).toFixed(1) + '%';
};

app.vue.computed.scoresUserLatestSpeed = function () {

        var item = this.game.results.speed,
            len = item.length,
            total = 0,
            average = 0;

        if (len < 1) {
            return '';
        }

        for (var i = 0; i < len; i++) {
            total += item[i];
        }

        average = total / len;

        return (average * 100).toFixed(1) + '%';
};

app.vue.computed.scoresUserLatestAccuracy = function () {

        var item = this.game.results.accuracy,
            len = item.length,
            total = 0,
            average = 0;

        if (len < 1) {
            return '';
        }

        for (var i = 0; i < len; i++) {
            total += item[i];
        }

        average = total / len;

        return (average * 100).toFixed(1) + '%';
};

app.vue.methods.gameStart = function () {
    app.game.startNewGame();
};

app.vue.methods.gameTargetTouched = function (e) {

    var data = {
        ac: app.vue.data.game.activeTarget,
        id: $(e.target).closest('.target-holder').data('id'),
    };

    if (data.ac === 0) {
        console.log('NO, wait for it!!');
        return false;
    }

    if (data.ac !== data.id) {
        console.log('NO, wrong target');
        return false;
    }

    if (app.vue.data.game.results.accuracy[app.vue.data.game.go]) {
        console.log('NO, already clicked');
        return false;
    }

    if (!app.vue.data.game.targetActive) {
        console.log('NO, target not active');
        return false;
    }

    app.game.handleTargetClick(e);

};
