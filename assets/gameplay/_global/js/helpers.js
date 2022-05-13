app.helpers = {
    init: (new Date()).getTime(),
};

(function () {

    'use strict';

    app.helpers.arrayShuffle = function (arr) {
        var j, x, i;
        for (i = arr.length - 1; i > 0; i--) {
            j = Math.floor(Math.random() * (i + 1));
            x = arr[i];
            arr[i] = arr[j];
            arr[j] = x;
        }
        return arr;
    };

    app.helpers.elementCentraliseSquareInApp = function (el, options) {

        options = options || {};

        var defaults = {
            padding: 20,
            paddingBreak: 480,
        }

        var settings = $.extend({}, true, defaults, options);

        var dims = {
            settings: settings
        };

        dims.h_app = $('#app').height();
        dims.w_app = $('#app').width();
        dims.h_nav_sec = $('.section-nav').height();

        dims.h_max = dims.h_app - dims.h_nav_sec;
        dims.w_max = dims.w_app;
        dims.max = dims.h_max > dims.w_max ? dims.w_max : dims.h_max;

        dims.padd = dims.max > settings.paddingBreak ? dims.max / 100 * settings.padding : settings.padding;
        dims.el = dims.max - dims.padd;

        dims.el_top = (dims.h_max / 2) + (dims.h_nav_sec / 2);
        dims.el_marg = dims.el / 2;

        el
            .height(dims.el)
            .width(dims.el)
            .css('margin', '-' + (dims.el_marg) + 'px 0 0 -' + dims.el_marg + 'px')
            .css('top', dims.el_top + 'px');

        return dims;
    };


    app.helpers.formatNumber = function (number, options) {

        options = options || {};

        var defaults = {
            commas: true,
        }

        var settings = $.extend({}, true, defaults, options);

        if (settings.commas) {
            number = number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
        }

        return number;
    }



}());
