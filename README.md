Coffee-Collection
=================

A fine _collection_ of [collection](http://en.wikipedia.org/wiki/Collection_\(computing\) "Collection_(computing)")-classes and utilities written in CoffeScript.
Intended for Node- and client-side usage.

Currently contains
------------------
* Set - each entry is singular, no duplicates allowed
* Map - stores "entries" for provided "keys" like a dictionary
* Graph - a set of nodes where each node max be conected with other nodes
  making a path

Examples
--------
### Set
```coffeescript
fruit = new Set
fruit.add 'Apple'
fruit.add 'Banana'
fruit.add 'Cherry'
fruit.size() # => 3

fruit.add 'Apple' # adding the same entry twice
fruit.size() # => 3

fruit.has 'Cherry' # => true
fruit.has 'Raspberry' # => false

fruit.elements() # => ['Apple', 'Banana', 'Cherry']

```


