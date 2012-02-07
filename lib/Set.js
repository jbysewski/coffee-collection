(function() {
  var root;

  root = typeof exports !== "undefined" && exports !== null ? exports : this;

  root.Set = (function() {

    function Set(items) {
      this.clear();
      if (items != null) this.addAll(items);
    }

    Set.prototype.clear = function() {
      return this._items = [];
    };

    Set.prototype.addAll = function(items) {
      var item, _i, _len;
      for (_i = 0, _len = items.length; _i < _len; _i++) {
        item = items[_i];
        this.add(item);
      }
      return this;
    };

    Set.prototype.has = function(item) {
      if (item.equals != null) {
        return this._items.some(function(existing) {
          return item.equals(existing);
        });
      }
      return !!~this._items.indexOf(item);
    };

    Set.prototype.size = function() {
      return this._items.length;
    };

    Set.prototype.isEmpty = function() {
      return this.size() === 0;
    };

    Set.prototype.add = function(item) {
      if (!this.has(item)) this._items.push(item);
      return this;
    };

    Set.prototype.remove = function(item) {
      var existing, index;
      if ((item.equals != null) && (existing = this._items.filter(function(existing) {
        return item.equals(existing);
      })).length) {
        index = this._items.indexOf(existing[0]);
      } else {
        index = this._items.indexOf(item);
      }
      if (index >= 0) this._items.splice(index, 1);
      return this;
    };

    Set.prototype.removeAll = function(items) {
      var item, _i, _len;
      for (_i = 0, _len = items.length; _i < _len; _i++) {
        item = items[_i];
        this.remove(item);
      }
      return this;
    };

    Set.prototype.elements = function() {
      return this._items;
    };

    return Set;

  })();

}).call(this);
