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

      'addNode should work': (graph) ->
         graph.addNode new Node 'Test1'
         graph.addNode new Node 'Test2'
         assert.equal graph.numberOfNodes(), 2

      'addNode should not add already contained Nodes': (graph) ->
         node = new Node 'Duplicate'
         graph.addNode node
         graph.addNode node
         assert.equal graph.numberOfNodes(), 3

      'addEdge should work with new nodes': (graph) ->
         n1 = new Node 'Test3'
         n2 = new Node 'Test4'
         graph.addEdge n1, n2
         assert.equal graph.numberOfNodes(), 5
         assert.isTrue n1.follows n2
         assert.isTrue n2.leads n1
      
      'addEdge should honor existing nodes': (graph) ->
         n1 = new Node 'Test3'
         n2 = new Node 'Test4'
         graph.addEdge n1, n2
         assert.equal graph.numberOfNodes(), 5
      
      'addBiEdge should work': (graph) ->
         n1 = graph.findNode 'Test1'
         n2 = graph.findNode 'Test2'
         graph.addBiEdge n1, n2
         assert.isTrue n1.follows n2
         assert.isTrue n2.leads n1
         assert.isTrue n2.follows n1
         assert.isTrue n1.leads n2

suite.export module
