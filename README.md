Coffee-Collection
=================

A fine _collection_ of [collection](http://en.wikipedia.org/wiki/Collection_\(computing\))-classes and utilities written in CoffeScript.
Intended for Node- and client-side usage.

Currently contains
------------------
* Set - each entry is singular, no duplicates allowed
* Map - stores "entries" for provided "keys" like a dictionary
* Graph - a set of nodes where each node max be conected with other nodes
  making a path

API
---
* Set
  * **!Important!** If an element has an .equals-method it is used to determine
    if other items are treated as the same - otherwise the is-operator (===) is
    used
  * ```coffeescript add element```: Adds an element if it is not already contained
  * addAll ['a', 'b'] | otherSet: adds all elements from an array or other set
  * remove element: Removes an element
  * removeAll ['a', 'b'] | otherSet: removes all elements from an array or other set
  * clear(): Removes all elements
  * size(): Returns the number of elements contained in this set
  * isEmtpy(): Returns true if this set is empty
  * has element: Returns true if ```coffeescript element.equals other``` returns true for
    any other element or - if element does not have a method equals - if an
    contained element is equal in terms of (===)

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


