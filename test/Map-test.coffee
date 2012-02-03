vows = require 'vows'
assert = require 'assert'
{Map} = require '../lib/Map'
{Set} = require '../lib/Set'

suite = vows.describe 'Map'
suite.addBatch
   'Basic Operations':
      topic: new Map

      'Starts empty': (map) ->
         assert.equal map.size(), 0
         assert.isTrue map.isEmpty()

   'Basic Put':
      topic: new Map

      'put should work': (map) ->
         map.put 1, 2
         assert.equal map.size(), 1

      'clear should work': (map) ->
         map.put 2,3
         map.clear()
         assert.equal map.size(), 0

      'isEmpty should work': (map) ->
         map.clear()
         assert.isTrue map.isEmpty()
         map.put 1,2
         assert.isFalse map.isEmpty()

   'Get':
      topic: new Map

      'get should work': (map) ->
         map.put 'one', 1
         assert.equal map.get('one'), 1

      'get should return null upon non-existing key': (map) ->
         map.clear()
         assert.isNull map.get 'non-existing'

   'keySet':
      topic: new Map

      'keySet starts empty': (map) ->
         assert.isTrue map.keySet().isEmpty()

      'keySet works': (map) ->
         map.put(1, 'one').put 'two', 1
         assert.deepEqual map.keySet(), new Set [1,'two']

   'Advanced Put':
      topic: new Map

      'put should override value of existing key': (map) ->
         map.clear().put(1,2).put 1,3
         assert.equal map.size(), 1
         assert.equal map.get(1), 3

      'putAll should work': (map) ->
         map.clear().putAll {'one': 1, 2: 'two'}
         assert.equal map.size(),2
         assert.equal map.get('one'),1
         assert.equal map.get('2'),'two' #object properties are converted to strings, so the 2 from putAll becomes '2'!

   'Remove':
      topic: new Map

      'remove should work': (map) ->
         map.put 1,2
         map.remove 1
         assert.isTrue map.isEmpty()

      'removeAll should work with array': (map) ->
         map.clear().putAll({'one': 1, 'two': 2, 'three': 3}).removeAll ['one','two']
         assert.equal map.size(), 1

      'removeAll should work with Set': (map) ->
         map.clear().putAll({'one': 1, 'two': 2, 'three': 3}).removeAll new Set ['one','two']
         assert.equal map.size(), 1

suite.export module
