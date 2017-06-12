
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

#### No iteration

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
