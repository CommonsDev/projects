module = angular.module("project_sheet.services", ['restangular'])


# Services
module.factory('ProjectSheet', (Restangular) ->
        return Restangular.service('project/project')
)
