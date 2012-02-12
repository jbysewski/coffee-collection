vows = require 'vows'
assert = require 'assert'
{Set} = require '../src/Set'

class Equal
   constructor: (@id) ->
   equals: (other) -> @id is other.id

suite = vows.describe 'Set'
suite.addBatch
   'Basic Operations':
      topic: new Set

      'Starts empty': (set) ->
         assert.equal set.size(), 0
         assert.isTrue set.isEmpty()

      'equals should work': (set) ->
         assert.isFalse set.equals '42'
         other = new Set
         assert.isTrue set.equals other
         set.add 'one'
         assert.isFalse set.equals other
         other.add 'one'
         assert.isTrue set.equals other
         set.add 'two'
         assert.isFalse set.equals other
         other.add 'two'
         assert.isTrue set.equals other

   'Add':
      topic: new Set
      
      'add should work': (set) ->
         set.add 'test'
         assert.equal set.size(), 1

      'clear should work': (set) ->
         set.add 'anotherValue'
         set.clear()
         assert.equal set.size(), 0
      
      'isEmpty should work': (set) ->
         set.clear()
         assert.isTrue set.isEmpty()
         set.add 'test'
         assert.isFalse set.isEmpty()

      'addAll should work': (set) ->
         set.clear()
         set.addAll ['one', 'two', 'three']
         assert.equal set.size(), 3
      
      'addAll should work with another Set': (set) ->
         set.clear()
         other = new Set ['one', 'two', 'three']
         set.addAll other
         assert.isTrue set.equals other

      'add should not add existing item': (set) ->
         set.clear()
         set.add 'duplicate'
         set.add 'duplicate'
         assert.equal set.size(), 1

      'add should not add existing item honoring item.equals': (set) ->
         set.clear()
         set.add new Equal 42
         set.add new Equal 42
         assert.equal set.size(), 1

   'Remove':
      topic: new Set
      
      'remove should work': (set) ->
         set.add 'toRemove'
         set.remove 'toRemove'
         assert.equal set.size(), 0

      'remove should work honoring item.equals': (set) ->
         set.add new Equal 42
         set.remove new Equal 42
         assert.equal set.size(), 0

      'removeAll should work': (set) ->
         set.addAll ['toRemove1', 'toRemove2']
         set.removeAll ['toRemove1', 'toRemove2']
         assert.equal set.size(), 0

   'Has':
      topic: new Set

      'has should return false upon non-existing item': (set) ->
         assert.isFalse set.has 'non-existing'

      'has should return true upon existing item': (set) ->
         set.add 'existing'
         assert.isTrue set.has 'existing'

suite.export module
