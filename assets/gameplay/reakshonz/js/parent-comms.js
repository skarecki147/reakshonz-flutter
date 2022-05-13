app.parent = {};

(function () {

    'use strict';

    app.parent.prepare = (function () {

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

    });

    app.parent.toParent = function (name, data) {
        window.parent.postMessage(
            {
                content: data,
                name: name,
            },
            window.parent.origin
        );
    };

}());
