(function() {
  var KeyEntry, Set, root;

  root = typeof exports !== "undefined" && exports !== null ? exports : this;

  Set = require('./Set').Set;

  KeyEntry = (function() {

    function KeyEntry(key, entry) {
      this.key = key;
      this.entry = entry;
    }

    KeyEntry.prototype.keyEquals = function(otherKey) {
      return this.key === otherKey;
    };

    KeyEntry.prototype.equals = function(other) {
      return this.keyEquals(other.key);
    };

    return KeyEntry;

  })();

  root.Map = (function() {

    function Map() {
      this.clear();
    }

    Map.prototype.clear = function() {
      this._keyValueSet = new Set;
      return this;
    };

    Map.prototype.size = function() {
      return this._keyValueSet.size();
    };

    Map.prototype.isEmpty = function() {
      return this._keyValueSet.isEmpty();
    };

    Map.prototype.put = function(key, entry) {
      var existing;
      if ((existing = this._getKeyEntry(key)) != null) {
        existing.entry = entry;
        return this;
      } else {
        this._keyValueSet.add(new KeyEntry(key, entry));
        return this;
      }
    };

    Map.prototype.putAll = function(map) {
      var entry, key;
      for (key in map) {
        entry = map[key];
        this.put(key, entry);
      }
      return this;
    };

    Map.prototype._getKeyEntry = function(key) {
      var existing;
      if ((existing = this._keyValueSet.elements().filter(function(item) {
        return item.keyEquals(key);
      })).length) {
        return existing[0];
      } else {
        return null;
      }
    };

    Map.prototype.get = function(key) {
      var keyValue;
      if ((keyValue = this._getKeyEntry(key)) != null) {
        return keyValue.entry;
      } else {
        return null;
      }
    };

    Map.prototype.keySet = function() {
      var item, result, _i, _len, _ref;
      result = new Set;
      _ref = this._keyValueSet.elements();
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        item = _ref[_i];
        result.add(item.key);
      }
      return result;
    };

    Map.prototype.entrySet = function() {
      var item, result, _i, _len, _ref;
      result = new Set;
      _ref = this._keyValueSet.elements();
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        item = _ref[_i];
        result.add(item.entry);
      }
      return result;
    };

    Map.prototype.remove = function(key) {
      var keyValue;
      keyValue = this._getKeyEntry(key);
      if (keyValue != null) return this._keyValueSet.remove(keyValue);
    };

    Map.prototype.removeAll = function(keys) {
      var key, _i, _j, _len, _len2, _ref, _results, _results2;
      if (keys instanceof Set) {
        _ref = keys.elements();
        _results = [];
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          key = _ref[_i];
          _results.push(this.remove(key));
        }
        return _results;
      } else {
        _results2 = [];
        for (_j = 0, _len2 = keys.length; _j < _len2; _j++) {
          key = keys[_j];
          _results2.push(this.remove(key));
        }
        return _results2;
      }
    };

    return Map;

  })();

}).call(this);
