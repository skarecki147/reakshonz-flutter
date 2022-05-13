app.vue = app.vue || {
    computed: {},
    data: {},
    methods: {},
    mounted: {},
    ready: false,
    routing: {},
    watch: {},
};

(function () {

    'use strict';

    Vue.config.productionTip = false;

    app.vue.el = '#app';

    app.vue.data = {
        current: {
            scores: null,
        },
        game: {},
    };

    app.vue.create = function () {
        app.vue.model = new Vue({
            el: app.vue.el,
            data: app.vue.data,
            computed: app.vue.computed,
            methods: app.vue.methods,
            router: app.vue.routing.router,
            watch: app.vue.watch,
        });
    };

    app.vue.init = function () {
        app.vue.data.game = app.game.getNewGame();
        app.vue.create();

        document.dispatchEvent(new CustomEvent('vue:initialised'));

    };

    app.vue.methods.getFormattedTime = function (time, format) {

        time = time ? new Date(time) : new Date();
        format = format || 'Do MMMM YYYY HH:mm';

        return moment(time).format(format);
    };

    app.vue.methods.getObjectFromDotString = function (string, data) {

        var data = data !== undefined ? data : app.vue.data;
        var nodes = string.split('.');
        var node = nodes.shift();

        if (!data[node]) {
            return null;
        }

        if (nodes.length > 0) {
            return this.getObjectFromDotString(nodes.join('.'), data[node])
        }

        return data[node];
    };

    app.vue.methods.playAgain = function () {
        app.game.reset();
    };

}());
