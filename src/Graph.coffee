root = exports ? this

{Node} = require './Node'
{Map} = require './Map'

class root.Graph
   constructor: -> @nodes = new Map

   addBiEdge: (from, to) -> @addEdge from, to, true

   addEdge: (from, to, bidirectional = false) ->
      @addNode from
      @addNode to
      from.follow to
      if bidirectional then to.follow from
      return [from, to]

   numberOfNodes: -> @nodes.size()
   addNode: (node) -> @nodes.put node.id, node
   findNode: (predicate) -> @nodes.get predicate
