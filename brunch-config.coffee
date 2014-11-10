exports.config =
        conventions:
                assets: /^app\/assets\//
        paths:
            public: '_public'
        plugins:
            sass:
                options: ['--compass']
        files:
                javascripts:
                        joinTo:
                                'js/vendor.js': /^bower_components/
                                'js/app.js': /^app\/scripts/
                        order:
                                before: [
                                  'bower_components/jquery/dist/jquery.js'
                                  'bower_components/angular/angular.js'
                                ]
                stylesheets:
                        joinTo:
                                'css/vendor.css': /^bower_components/
                                'css/app.css': /^app\/styles/
                        order:
                                before: [
                                        'bower_components/bootstrap/dist/css/bootstrap.css'
                                        'bower_components/bootstrap/dist/css/bootstrap-theme.css'
                                ]
