(function() {
  var Set, root;

  root = typeof exports !== "undefined" && exports !== null ? exports : this;

  Set = require('./Set').Set;

  root.Node = (function() {

    function Node(id) {
      this.id = id;
      this._successors = new Set;
      this._predecessors = new Set;
    }

    Node.prototype.follow = function(node) {
      this._successors.add(node);
      return node._predecessors.add(this);
    };

    Node.prototype.lead = function(node) {
      this._predecessors.add(node);
      return node._successors.add(this);
    };

    Node.prototype.follows = function(node) {
      return this._successors.has(node);
    };

    Node.prototype.leads = function(node) {
      return this._predecessors.has(node);
    };

    Node.prototype.equals = function(node) {
      return this.id === node.id;
    };

    return Node;

  })();

}).call(this);
