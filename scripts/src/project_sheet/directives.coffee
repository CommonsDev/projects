module = angular.module('project_sheet.directives', [])

module.directive('showonhoverparent', ->
        link = (scope, element, attrs) ->
                element.parent().bind('mouseenter', -> 
                    element.show()
                )
                element.parent().bind('mouseleave', ->
                     element.hide()
                )
        return {
                restrict: 'A',
                link: link
        }
)
