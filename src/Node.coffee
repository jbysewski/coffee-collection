root = exports ? this

{Set} = require './Set'

class root.Node
   constructor: (@id) ->
      @_successors = new Set
      @_predecessors = new Set

   follow: (node) ->
      @_successors.add node
      node._predecessors.add this

   lead: (node) ->
      @_predecessors.add node
      node._successors.add this

   follows: (node) -> @_successors.has node
   leads: (node) -> @_predecessors.has node
   equals: (node) -> @id is node.id
