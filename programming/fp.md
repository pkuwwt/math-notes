
# Functional Programming

## Introduction

Functional characteristics:
  * immutable data1
  * first class functions2
  * tail call optimisation3
  * MOST IMPORTANT: absense of side effects

Functional techniques:
  * Composition
  * Pipelining
  * Higher order functions

Language features:
  * mapping
  * pipelining
  * recursing
  * currying 4
  * use of higher order functions

Programming techniques:
  * parallelization 5
  * lazy evaluation 6
  * determisism 7


## Functional Programming Language

### FP in python

#### No side-effects

  * unfunctional function
```python
a = 0
def increment():
    global a
    a += 1
```
  * functional function
```python
def increment(a):
    return a+1
```

#### Iteration vs. `map/reduce`

  * unfunctional
```python
name_lengths = [len(name) for name in ["Mary", "Isla", "Sam"]]
squares = [x*x for x in [0,1,2,3,4]]
```
  * functional
```python
name_lengths = map(len, ["Mary", "Isla", "Sam"])
squares = map(lambda x: x*x, [0,1,2,3,4])
```
  * unfunctional 
```python
sum = 0
for i in [0,1,2,3,4]:
    sum += i
```
  * unfunctional 
```python
sum = reduce(lambda a,x: a+x, [0,1,2,3,4])
# or
sum = reduce(lambda a,x: a+x, [0,1,2,3,4], 0)
```

#### Benefits of `map/reduce`

  * They are often one-liners
  * The collection, the operation and the return value are always in the same places
  * Loop may affect other variables, `map/reduce` are functional by convention.
  * `map/reduce` are elemental operations, easy to understand
  * `map/reduce` have other variants for basic behaviors: `filter`, `all`, `any`, `find`

```python
people = [{'name': 'Mary', 'height': 160},
    {'name': 'Isla', 'height': 80},
    {'name': 'Sam'}]
heights = map(lambda x: x['height'], filter(lambda x: 'height' in x, people))
if len(heights)>0:
    from operator import add
    average_height = reduce(add, heights) / len(heights)
```
 








