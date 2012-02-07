(function() {
  var Map, Node, root;

  root = typeof exports !== "undefined" && exports !== null ? exports : this;

  Node = require('./Node').Node;

  Map = require('./Map').Map;

  root.Graph = (function() {

    function Graph() {
      this.nodes = new Map;
    }

    Graph.prototype.addBiEdge = function(from, to) {
      return this.addEdge(from, to, true);
    };

    Graph.prototype.addEdge = function(from, to, bidirectional) {
      if (bidirectional == null) bidirectional = false;
      this.addNode(from);
      this.addNode(to);
      from.follow(to);
      if (bidirectional) return to.follow(from);
    };

    Graph.prototype.numberOfNodes = function() {
      return this.nodes.size();
    };

    Graph.prototype.addNode = function(node) {
      return this.nodes.put(node.id, node);
    };

    Graph.prototype.findNode = function(id) {
      return this.nodes.get(id);
    };

    return Graph;

  })();

}).call(this);
