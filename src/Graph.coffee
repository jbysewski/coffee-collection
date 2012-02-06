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

   numberOfNodes: -> @nodes.size()

   addNode: (node) -> @nodes.put node.id, node

   findNode: (id) -> @nodes.get id
