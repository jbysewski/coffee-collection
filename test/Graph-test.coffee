vows = require 'vows'
assert = require 'assert'
{Graph} = require '../src/Graph'
{Node} = require '../src/Node'

suite = vows.describe 'Graph'
suite.addBatch
   'Add nodes and edges':
      topic: new Graph

      'Starts empty': (graph) ->
         assert.equal graph.numberOfNodes(), 0

      'addNode works with strings': (graph) ->
         node = graph.addNode 'Test1'
         assert.equal graph.numberOfNodes(), 1
         assert.isTrue node instanceof Node
         assert.equal node.id, 'Test1'

      'addNode works with Nodes': (graph) ->
         graph.addNode new Node 'Test2'
         assert.equal graph.numberOfNodes(), 2

      'addNode does not add already contained Nodes': (graph) ->
         node = new Node 'Duplicate'
         graph.addNode node
         graph.addNode node
         assert.equal graph.numberOfNodes(), 3

      'addNode does not add Nodes with same name': (graph) ->
         graph.addNode 'Duplicate'
         assert.equal graph.numberOfNodes(), 3

      'addEdge works and creates new nodes': (graph) ->
         graph.addEdge 'Test3', 'Test4'
         assert.equal graph.numberOfNodes(), 5
         n1 = graph.findNode 'Test3'
         n2 = graph.findNode 'Test4'
         assert.equal n1.successor, n2
         assert.equal n2.predecessor, n1
      
      'addEdge works and honors existing nodes': (graph) ->
         graph.addEdge 'Test3', 'Test4'
         assert.equal graph.numberOfNodes(), 5
      
      'addBiEdge works': (graph) ->
         n1 = graph.findNode 'Test1'
         n2 = graph.findNode 'Test2'
         graph.addBiEdge n1, n2
         assert.equal n1.successor, n2
         assert.equal n2.successor, n1
         assert.equal n2.predecessor, n1
         assert.equal n1.predecessor, n2
      

suite.export module
