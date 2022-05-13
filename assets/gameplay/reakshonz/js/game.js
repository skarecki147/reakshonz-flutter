app.game = {
    settings: {
        points_max_accuracy: 50000,
        points_max_speed: 50000,
        targets_active: [1, 2, 3, 4, 5, 6, 7, 8, 9],
        targets_to_hit: 10,
        time_max_delay: 1500,
        time_wait_between: 500,
        time_before_speed: 450,
    }
};

(function () {

    'use strict';

    app.game.clearTargetFeedback = function () {
        $('.target-holder .hit').removeClass('active');
    };

    app.game.getAccuracy = function (e) {

        var data = {};

        data.w = $(e.target).width();
        data.h = $(e.target).height();
        data.x = e.offsetX;
        data.y = e.offsetY;

        data.cx = data.w / 2;
        data.cy = data.h / 2;

        data.distx = Math.abs(data.cx - data.x);
        data.disty = Math.abs(data.cy - data.y);

        data.dist = Math.sqrt(Math.pow(data.distx, 2) + Math.pow(data.disty, 2));

        data.dist = data.dist > data.cx ? data.cx : data.dist;

        data.accuracy = (data.cx - data.dist) / data.cx;

        return data.accuracy;
    };

    app.game.getNewGame = function () {
        return {
            go: -1,
            order: this.getRandomOrder(),
            active: false,
            activeTarget: 0,
            finished: false,
            targetActive: false,
            results: {
                accuracy: [],
                score: [],
                speed: [],
            },
            score: null,
            started: false,
            ts: null,
        };
    };

    app.game.getRandomOrder = function () {

        var setsRequired = Math.ceil(this.settings.targets_to_hit / this.settings.targets_active.length);
        var items = [];

        for (var i = 0; i < setsRequired; i++) {
            items = items.concat(app.helpers.arrayShuffle(this.settings.targets_active.slice()));
        }

        items = items.slice(0, this.settings.targets_to_hit);

        return items;

    };

    app.game.getScoreFromData = function (accuracy, speed) {

        accuracy = speed === 0 ? 0 : accuracy;

        return Math.floor(accuracy * this.settings.points_max_accuracy) + Math.floor(speed * this.settings.points_max_speed);
    };

    app.game.getSpeed = function () {

        var data = {};

        data.delay = (new Date()).getTime() - app.vue.data.game.ts - this.settings.time_before_speed;
        data.delayMax = data.delay > this.settings.time_max_delay ? this.settings.time_max_delay : data.delay;
        data.speed = (this.settings.time_max_delay - data.delayMax) / this.settings.time_max_delay;
        data.speed = data.speed > 1 ? 1 : data.speed;

        return data.speed;
    };

    app.game.handleTargetClick = function (e) {

        app.vue.data.game.targetActive = false;
        app.game.showTargetFeedback(e);

        var data = {
            accuracy: this.getAccuracy(e),
            speed: this.getSpeed(),
        };

        this.setResult(data.accuracy, data.speed);

        this.nextTarget();
    };

    app.game.nextTarget = function () {

        app.vue.data.game.go++;

        if (app.vue.data.game.go >= this.settings.targets_to_hit) {
            this.setScore();
            setTimeout(
                function () {
                    app.vue.data.game.finished = true;
                },
                2000
            );
            return false;
        }

        var delay = (Math.random() * this.settings.time_max_delay) + this.settings.time_wait_between;

        setTimeout(this.showTarget, delay);
    };

    app.game.reset = function () {
        app.vue.data.game = this.getNewGame();
    };

    app.game.resize = function () {

        var self = this;

        if ($('#app').height() <= 0) {
            setTimeout(function () {
                self.resize();
            }, 500);
            return false;
        }

        var dims = app.helpers.elementCentraliseSquareInApp($('#targets'));

        dims.circ = dims.el * 0.3;
        dims.circ_marg = dims.circ / 2;

        $('.target-holder')
            .height(dims.circ)
            .width(dims.circ)
            .css('margin', '-' + dims.circ_marg + 'px 0 0 -' + dims.circ_marg + 'px');

        $('#targets').css('opacity', 1);
    };

    app.game.setScore = function () {

        var res = app.vue.data.game.results,
            len = res.speed.length;

        var score = 0;

        for (var i = 0; i < len; i++) {
            score += this.getScoreFromData(res.accuracy[i], res.speed[i]);
        }

        app.game.submitScore(score, 2000);

    };

    app.game.setResult = function (accuracy, speed) {
        app.vue.model.$set(app.vue.data.game.results.accuracy, app.vue.data.game.go, accuracy);
        app.vue.model.$set(app.vue.data.game.results.speed, app.vue.data.game.go, speed);
        app.vue.model.$set(app.vue.data.game.results.score, app.vue.data.game.go, this.getScoreFromData(accuracy, speed));
    };

    app.game.showTarget = function () {
        app.game.clearTargetFeedback();
        app.vue.data.game.ts = (new Date()).getTime();
        app.vue.data.game.targetActive = true;
        app.vue.data.game.activeTarget = app.vue.data.game.order[app.vue.data.game.go];
    };

    app.game.showTargetFeedback = function (e) {
        $(e.target)
            .closest('.target-holder')
            .find('.hit')
            .css('left', (e.offsetX - 1) + 'px')
            .css('top', (e.offsetY - 1) + 'px')
            .addClass('active');
    };

    app.game.start = function () {
        app.vue.data.game.active = true;
        app.vue.data.game.started = true;
        this.nextTarget();
    };

    app.game.startNewGame = function () {
        this.reset();
        this.start();
    };

    app.game.submitScore = function (score) {
        app.game.toParent('submitScore', score);
    };

    app.game.toParent = function (name, data) {
        window.parent.postMessage(
            {
                content: data,
                name: name,
            },
            window.parent.origin
        );
    };

}());
