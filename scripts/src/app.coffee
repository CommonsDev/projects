angular.element(document).on('ready page:load', ->
        angular.module('project_sheet', ['project_sheet.controllers', 'project_sheet.services'])

        angular.module('unisson_projects', ['project_sheet', 'ui.router', 'ngAnimate', 'restangular', 'angular-unisson-auth', 'xeditable', 'chieffancypants.loadingBar'])

        # CORS
        .config(['$httpProvider', ($httpProvider) ->
                $httpProvider.defaults.useXDomain = true
                delete $httpProvider.defaults.headers.common['X-Requested-With']
        ])

        # Tastypie
        .config((RestangularProvider) ->
                RestangularProvider.setBaseUrl(config.rest_uri)
                RestangularProvider.setRequestSuffix('?format=json');
                # RestangularProvider.setDefaultHeaders({"Authorization": "ApiKey pipo:46fbf0f29a849563ebd36176e1352169fd486787"});
                # Tastypie patch
                RestangularProvider.setResponseExtractor((response, operation, what, url) ->
                        newResponse = null;

                        if operation is "getList"
                                newResponse = response.objects
                                newResponse.metadata = response.meta
                        else
                                newResponse = response

                        return newResponse
                )
        )


        # URI config
        .config(['$locationProvider', '$stateProvider', '$urlRouterProvider', ($locationProvider, $stateProvider, $urlRouterProvider) ->
                $locationProvider.html5Mode(config.useHtml5Mode)
                $urlRouterProvider.otherwise("/")

                $stateProvider.state('home',
                        url: '/',
                        templateUrl: 'views/homepage.html'
                )

                .state('project-list',
                        url: '/p',
                        controller: 'ProjectListCtrl'
                        templateUrl: 'views/project_sheet/page/project_list.html'
                )

                .state('project-detail',
                        url: '/p/:id',
                        templateUrl: 'views/project_sheet/page/project_detail.html'
                        controller: 'ProjectDetailCtrl'
                )


        ])

        # Google auth config
        .config(['TokenProvider', '$locationProvider', (TokenProvider, $locationProvider) ->
                TokenProvider.extendConfig(
                        clientId: '645581170749.apps.googleusercontent.com',
                        redirectUri: 'http://localhost:8080/oauth2callback.html',
                        scopes: ["https://www.googleapis.com/auth/userinfo.email",
                                "https://www.googleapis.com/auth/userinfo.profile"],
                )
        ])

        # Unisson auth config
        .config((loginServiceProvider) ->
                loginServiceProvider.setBaseUrl(config.loginBaseUrl)
        )

        .run(['$rootScope', '$state', '$stateParams', 'loginService', 'editableOptions', ($rootScope, $state, $stateParams, loginService, editableOptions) ->
                $rootScope.homeStateName = 'apps' # Should be moved to loginServiceProvider

                $rootScope.config = config
                $rootScope.$state = $state
                $rootScope.$stateParams = $stateParams
                $rootScope.loginService = loginService

                editableOptions.theme = 'default' # bootstrap3 theme. Can be also 'bs2', 'default'

        ])

        # Ugly Fix for autofill on forms
        .directive('formAutofillFix', ->
                (scope, elem, attrs) ->
                        # Fixes Chrome bug: https://groups.google.com/forum/#!topic/angular/6NlucSskQjY
                        elem.prop 'method', 'POST'

                        # Fix autofill issues where Angular doesn't know about autofilled inputs
                        if attrs.ngSubmit
                                setTimeout ->
                                        elem.unbind('submit').submit (e) ->
                                                e.preventDefault()
                                                elem.find('input, textarea, select').trigger('input').trigger('change').trigger 'keydown'
                                                scope.$apply attrs.ngSubmit
                                , 0
        )

        console.debug("running unisson projects...")
        angular.bootstrap(document, ['unisson_projects'])


)
