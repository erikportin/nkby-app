'use strict'
angular.module('ngScaffoldApp').directive 'htmlTool', (UrlFactory, Utils) ->
        restrict: 'E'
        replace: true
        scope:
            html: '='
            url: '='
            item: '='

        templateUrl: '/modules/htmlTool/html-tool-tmplt.html'
        link: (scope, element, attrs) ->
            
            scope.types = 
                'people': scope.html.people
                'years': scope.html.years
                'streets': scope.html.streets

            scope.goTo = (index, type) ->
                elInCopy = document.querySelectorAll('.' + type + '-'+index)[0]
                elInCopy.scrollIntoView({block: "end", behavior: "smooth"})

                elInCopy.classList.add 'in-view'

                window.setTimeout(() -> 
                    elInCopy.classList.remove('in-view')
                , 2000)

                return

            scope.encode = UrlFactory.encode

            scope.addText = (url) ->
                item =
                    type: 'text'
                    url: url
                    years: Utils.flattenObj scope.html.years
                    people: Utils.flattenObj scope.html.people
                    parent: scope.encode scope.url                    

                scope.$emit('addItem', item)

            scope.addImage = (node) ->
                item =
                    type: 'image'
                    node: node
                    years: Utils.flattenObj scope.html.years
                    people: Utils.flattenObj scope.html.people
                    parent: scope.encode scope.url

                scope.$emit('addItem', item)

                return

            return