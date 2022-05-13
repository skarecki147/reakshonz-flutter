(function () {

    'use strict';

    app.ready = function () {
        app.game.reset();
        app.game.resize();
    };

    $(window).resize(function () {
        app.game.resize();
    });

    window.addEventListener('message', (event) => {

        if (!event || !event.data || !event.data.name) {
            return false;
        }

        let functionName = event.data.name;
        if (typeof app.game[functionName] === 'undefined') {
            console.groupCollapsed('method not found: app.game.' + functionName);
            console.log(event.data.content);
            console.groupEnd();
        } else {
            app.game[functionName](event.data.content);
        }

    }, false);

}());
