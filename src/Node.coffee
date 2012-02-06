root = exports ? this

class root.Node
   constructor: (@id) ->

   follow: (node) ->
      @successor = node
      node.predecessor = this

   lead: (node) ->
      @predecessor = node
      node.successor = this
