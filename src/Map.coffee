root = exports ? this

{Set} = require './Set'

class KeyEntry
   constructor: (@key, @entry) ->
   keyEquals: (otherKey) -> @key is otherKey
   equals: (other) -> @keyEquals other.key

class root.Map
   constructor: -> @clear()

   clear: ->
      @_keyValueSet = new Set
      this

   size: -> @_keyValueSet.size()

   isEmpty: -> @_keyValueSet.isEmpty()

   put: (key, entry) ->
      if (existing = @_getKeyEntry key)?
         existing.entry = entry
         this 
      else
         @_keyValueSet.add new KeyEntry key, entry
         this

   putAll: (map) ->
      @put key, entry for key,entry of map
      this

   _getKeyEntry: (key) ->
      if (existing = @_keyValueSet.elements().filter (item) -> item.keyEquals key).length
        existing[0]
      else
         null

   get: (key) -> if (keyValue = @_getKeyEntry(key))? then keyValue.entry else null 

   keySet: ->
      result = new Set
      result.add item.key for item in @_keyValueSet.elements()
      result
   
   entrySet: ->
      result = new Set
      result.add item.entry for item in @_keyValueSet.elements()
      result

   remove: (key) ->
      keyValue = @_getKeyEntry key
      if keyValue? then @_keyValueSet.remove keyValue

   removeAll: (keys) ->
      if keys instanceof Set
         @remove key for key in keys.elements()
      else
         @remove key for key in keys
