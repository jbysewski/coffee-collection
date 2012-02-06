root = exports ? this

{Set} = require './Set'

class KeyValue
   constructor: (@key, @value) ->
   keyEquals: (otherKey) -> @key is otherKey
   equals: (other) -> @keyEquals other.key

class root.Map
   constructor: ->
      @clear()

   clear: ->
      @_keyValueSet = new Set
      this

   size: ->
      @_keyValueSet.size()

   isEmpty: ->
      @_keyValueSet.isEmpty()

   put: (key, value) ->
      if (existing = @_getKeyValue key)?
         existing.value = value
         this 
      else
         @_keyValueSet.add new KeyValue key, value
         this

   putAll: (map) ->
      @put key, value for key,value of map
      this

   _getKeyValue: (key) ->
      if (existing = @_keyValueSet.elements().filter (item) -> item.keyEquals key).length
        existing[0]
      else
         null

   get: (key) -> if (keyValue = @_getKeyValue(key))? then keyValue.value else null 

   keySet: ->
      result = new Set
      result.add item.key for item in @_keyValueSet.elements()
      result

   remove: (key) ->
      keyValue = @_getKeyValue key
      if keyValue? then @_keyValueSet.remove keyValue

   removeAll: (keys) ->
      if keys instanceof Set
         @remove key for key in keys.elements()
      else
         @remove key for key in keys
