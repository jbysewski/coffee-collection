root = exports ? this

{Node} = require './Node'

class root.Graph
   constructor: ->
      @nodes = []

   addBiEdge: (from, to) ->
      @addEdge from, to, true

   addEdge: (from, to, bidirectional = false) ->
      from = @addNode from
      to = @addNode to
      from.follow to
      if bidirectional then to.follow from

   _makeNode: (possibleNode) ->
      if possibleNode instanceof Node
         possibleNode
      else
         new Node possibleNode

   numberOfNodes: -> @nodes.length

   addNode: (node) ->
      existing = @findNode node
      if existing?
         return existing
      newNode = @_makeNode node
      @nodes.push newNode
      newNode

   findNode: (node) ->
      if node in @nodes 
         return node
      if (existing = @nodes.filter (existing) -> existing.id is node).length
         return existing[0]
