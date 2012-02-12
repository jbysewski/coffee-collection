root = exports ? this

class root.Set
   constructor: (items) ->
      @clear()
      if items? then @addAll items

   clear: -> @_items = []

   addAll: (items) ->
      if items instanceof root.Set then items = items.elements()
      @add item for item in items
      this

   has: (item) ->
      if item.equals? then return @_items.some (existing) -> item.equals existing
      !!~ @_items.indexOf item

   size: -> @_items.length

   isEmpty: -> @size() is 0

   add: (item) ->
      if not @has item
         @_items.push item
      this

   remove: (item) ->
      if item.equals? and (existing = @_items.filter (existing) -> item.equals existing).length
         index = @_items.indexOf existing[0]
      else
         index = @_items.indexOf item
      if index >= 0
         @_items.splice index, 1
      this

   removeAll: (items) ->
      @remove item for item in items
      this

   elements: -> @_items

   equals: (other) ->
      if other instanceof root.Set and @size() is other.size() and (@_items.every (item) -> other.has item)
         return true
      return false
