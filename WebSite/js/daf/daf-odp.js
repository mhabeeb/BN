/*!
* Data Aquarium Framework - Offline Data Processor
* Copyright 2008-2017 Code On Time LLC; Licensed MIT; http://codeontime.com/license
*/

(function () {
    var _app = $app,
        _odp,
        _controllers = {};

    _odp = _app.odp = {
        offline: function (value) { return false; },
        invoke: function (dataView, params) {
            var that = this,
                servicePath = dataView.get_servicePath(),
                methodName = params.url.substring(servicePath.length + 1),
                controller = params.data.match(/\"controller\":\"(.+?)\"/),
                deferred = $.Deferred();
            if (controller)
                controller = controller[1];

            function ajax() {
                $.ajax(params).done(function (result) {
                    deferred.resolve(result);
                }).fail(function (jqXHR, textStatus, error) {
                    deferred.reject(jqXHR, textStatus, error);
                });
            }

            if (_app.touch) {
                // assign an instance of ODP to the root of a potential hierarachy
                if (methodName == 'GetPage') {
                    if (!dataView.odp) {
                        if (dataView._dataViewFieldParentId) {
                            var master = _app.find(dataView._filterSource);
                            if (master)
                                dataView.odp = master.odp;
                        }
                        else {
                            var parent = dataView.get_parentDataView();
                            if (parent) {
                                if (dataView._filterSource)
                                    dataView.odp = parent.odp;
                                if (!dataView.odp)
                                    dataView.odp = new _app.OfflineDataProcessor(dataView);
                            }
                        }
                        if (!dataView.odp && dataView._isModal)
                            dataView.odp = new _app.OfflineDataProcessor(dataView);
                    }
                }
            }

            //if (that.is(':disabled'))
            //    ajax();
            //else {
            //    that.analyze({ method: methodName, dataView: dataView });
            //    if (methodName.match(/^(GetPage|Execute|GetListOfValues)$/) && that.is(':active') && !_controllers[controller]) {
            //        $.ajax({
            //            url: servicePath + '/getcontrollerlist',
            //            method: 'POST',
            //            cache: false,
            //            dataType: 'text',
            //            data: JSON.stringify({ controllers: [controller] })
            //        }).done(function (result) {
            //            // controller JSON received
            //            _controllers[controller] = JSON.parse(JSON.parse(result).d)
            //            ajax();
            //        });
            //    }
            //    else
            //        ajax();
            //}


            ajax();
            return deferred.promise();
        }
    }

    _app.OfflineDataProcessor = function (dataView) {
        this._dataView = dataView;
        this._state = 'inactive';
        this._data = [];
        this._log = [];
    }

    _app.OfflineDataProcessor.prototype = {
        is: function (value) {
            if (arguments.length) {
                if (value.match(/^:/))
                    return (this._state) == value.substring(1);
                else
                    this._state = value;
            }
            else
                return this._state;

        },
        analyze: function (data) {
            var that = this,
                dataView = data.dataView,
                lastArgs = dataView._lastArgs,
                isMaster = !dataView._filterSource,
                method = data.method,
                root;
            if (that.is(':active')) {
                if (method == 'Execute' && lastArgs && lastArgs.CommandName.match(/^(Insert|Update|Delete)$/))
                    that.is('commit');
            }
            else
                if (isMaster) {
                    if (method == 'GetPage' && dataView.get_lastCommandName() == 'New') {
                        that.root = dataView._id;
                        that.is('active');
                    }
                }
                else if (method == 'Execute' && lastArgs && lastArgs.CommandName.match(/^(Insert|Update|Delete)$/)) {
                    that.is('active');
                }
        }
    };

    //_odp.is('disabled');

})();