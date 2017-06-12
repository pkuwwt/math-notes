
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

  * Unfunctional function
```python
    a = 0
    def increment():
		global a
		a += 1
```
  * Functional function
```python
    def increment(a):
		return a+1
```

#### Iteration vs. `map/reduce`

  * Unfunctional
```python
name_lengths = [len(name) for name in ["Mary", "Isla", "Sam"]]
squares = [x*x for x in [0,1,2,3,4]]
```
  * Functional
```python
name_lengths = map(len, ["Mary", "Isla", "Sam"])
squares = map(lambda x: x*x, [0,1,2,3,4])
```
  * Unfunctional 
```python
sum = 0
for i in [0,1,2,3,4]:
	    sum += i
```
  * Functional 
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
 
#### Imperatively vs. Declaratively

  * Imperative code
```python
    from random import random
    time = 5
    car_positions = [1,1,1]
    while time:
    	time -= 1
    	print ''
    	for i in range(len(car_positions)):
    		if random()>0.3:
    			car_positions[i] += 1
    		print '-' * car_positions[i]
```
  * Use functions to be declarative, to describe what to do, rather than how to do it
```python
	from random import random
	def move_cars():
		for i,_ in enumerate(car_positions):
			if random()>0.3:
				car_positions[i] += 1
	def draw_car(car_position):
		print '-' * car_position
	def run_step_of_race():
		global time
		time -= 1
		move_cars()
	def draw():
		print ''
		for car_position in car_positions:
			draw_car(car_position)
	time = 5
	car_positions = [1,1,1]
	while time:
		run_step_of_race()
		draw()
```
  * Remove state to be functional
```python
	from random import random
	def move_cars(car_positions):
		return map(lambda x:x+1 if random()>0.3 else x, car_positions)
	def output_car(car_position):
		return '-' * car_position
	def run_step_of_race(state):
		return {'time':state['time']-1, 'car_position': move_cars(state['car_positions'])}
	def draw(state):
		print ''
		print '\n'.join(map(output_car, state['car_positions']))
	def race(state):
		draw(state)
		if state['time']:
			race(run_step_of_race(state))
	race({'time':5, 'car_positions': [1,1,1]})
```

#### Pipeline techniques

  * Unfunctional code, hard to reuse/test/parallelize
```python
    bands = [{'name': 'sunset rubdown', 'country': 'UK', 'active': False},
    	     {'name': 'women', 'country': 'Germany', 'active': False},
             {'name': 'a silver mt. zion', 'country': 'Spain', 'active': True}]
    def format_bands(bands):
		for band in bands:
			band['country'] = 'Canada'
			band['name'] = band['name'].replace('.', '')
			band['name'] = band['name].title()
	format_bands(bands)
	print bands
```
  * Functional code
```python
	print pipeline_each(bands, [set_canada_as_country,
								strip_punctuation_from_name,
								captitalize_names])
	def assoc(_d, key, value):
		from copy import deepcopy
		d = deepcopy(_d)
		d[key] = value
		return d
	def set_canada_as_country(band):
		return assoc(band, 'country', 'Canada')
	def strip_punctuation_from_name(band):
		return assoc(band, 'name', band['name'].replace('.', ''))
	def capitalize_names(band):
		return assoc(band, 'name, band['name'].title())
	def pipeline_each(data, functions):
		return reduce(lambda a, x: map(x,a), functions, data)
```





