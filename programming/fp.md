
# Functional Programming

## Introduction

Functional characteristics:
  * immutable data<sup>[1](#myfootnote1)</sup>
  * first class functions<sup>[2](#myfootnote2)</sup>
  * tail call optimisation<sup>[3](#myfootnote3)</sup>
  * **MOST IMPORTANT**: absense of side effects

Functional techniques:
  * Composition
  * Pipelining
  * Higher order functions

Language features:
  * mapping
  * pipelining
  * recursing
  * currying<sup>[4](#myfootnote4)</sup>
  * use of higher order functions

Programming techniques:
  * Parallelization
  * Lazy evaluation<sup>[5](#myfootnote5)</sup>
  * Determinism<sup>[6](#myfootnote6)</sup>


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
		return assoc(band, 'name', band['name'].title())
	def pipeline_each(data, functions):
		return reduce(lambda a, x: map(x,a), functions, data)
```
  * or a less readable version 
```python
	print pipeline_each(bands, [call(lambda x: 'Canada', 'country'),
								call(lambda x: x.replace('.', ''), 'name'),
								call(str.title, 'name')])
	def assoc(_d, key, value):
		from copy import deepcopy
		d = deepcopy(_d)
		d[key] = value
		return d
	def call(func, key):
		def apply_func(record):
			return assoc(record, key, func(record.get(key)))
		return apply_func
```
  * Techniques used above:
    * **Higher order function** `call()`. A higher order function takes a function as argument or return a function.
	* `call()` does not do actual work, `apply_func()`, when called, will do the work: look up -> apply -> assign back
	* **Closure**. `func` and `key` in `apply_func()` are references to closed over variables in outer scope, leading to a scope chain.
  * Another task: extracting name and country 
```python
	def extract_name_and_country(band):
		plucked_band = {}
		plucked_band['name'] = band['name']
		plucked_band['country'] = band['country']
		return plucked_band
	print pipeline_each(bands, [call(lambda x: 'Canada', 'country'),
								call(lambda x: x.replace('.', ''), 'name'),
								call(str.title, 'name'),
								extract_name_and_country])
	def pluck(keys):
		def pluck_func(record):
			return reduce(lambda a,x: assoc(a,x,record[x]), keys, {})
		return pluck_func
	print pipeline_each(bands, [call(lambda x: 'Canada', 'country'),
								call(lambda x: x.replace('.', ''), 'name'),
								call(str.title, 'name'),
								pluck(['name','country'])])
```

## References

  * <a name="myfootnote1">1</a>: A piece of **immutable data** is one that cannot be changed. Some languages, like Clojure, make all values immutable by default. Immutable data eliminates bugs.
  * <a name="myfootnote2">2</a>: Languages that support **first class functions** allow functions to be treated like any other value.
  * <a name="myfootnote3">3</a>: **Tail call optimization** It is a programming feature. In general, the frame stack may become very large after a large number of recursive function call. Language with tail call optimisation reuse the same stack frame for their entire sequence of recursive calls. Python does not support tail call optimisation.
  * <a name="myfootnote4">4</a>: **Curying** is a technique that transform `func(arg1, arg2, ...)` to `func1(arg1) { return func2(arg2,...); }`
  * <a name="myfootnote5">5</a>: **Lazy evaluation** is a compiler technique that avoids running code until the result is needed.
  * <a name="myfootnote6">6</a>: A process is **deterministic** if repetitions yield the same result every time.



