var app = {
    helpers: {},
    listeners: {},
    settings: {
        network: 'online',
        routing: {}
    },
    sw: {},
    timeouts: {},
};

(function () {

    'use strict';

    app.init = function () {
        app.ready();
        app.vue.init();
    };

}());
