## Range Loop

### JavaScript
```javascript
for (var i=0 ; i<= 10 ; i++) {
	console.log(i);
}
```

### CoffeeScript
```coffeescript
for i in [0..10]
    console.log i
```
it is compiled to:
```javascript
for (i = _i = 0; _i <= 10; i = ++_i) {
    console.log(i);
}
```

### LiveScript
LiveScript has similar notation.
```livescript
for i in [0 to 10]
    console.log i
```
it is compiled to:
```javascript
for (i$ = 0, len$ = (ref$ = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]).length;
     i$ < len$;
     ++i$) {
    i = ref$[i$];
    console.log(i);
}
```
What if we want [0 to 100000]? It is memory consuming.
#####a better way for range looping:
```livescript
for i from 0 to 10
    console.log i
```
it is compiled to:
```javascript
for (i$ = 0; i$ <= 10; ++i$) {
    i = i$;
    console.log(i);
}
```
which is actually equivalent to CoffeeScript.

## Object Iteration
It is common to iterate (key, value) pair in an object.

### JavaScript 
This iterates all key, value in obj.
```javascript
for (var k in obj) {
    var v = obj[k];
    console.log(k, ":", v);
}
```
If you want to exclude inherited properties.
```javascript
for (var k in obj) {
    if (obj.hasOwnProperty(k)) {
        var v = obj[k];
        console.log(k, ":", v);
    }
}
```

###CoffeeScript
```coffeescript
for k, v of obj
	console.log k, ":", v
   
for own k, v of obj
	console.log k, ":", v
```

###LiveScript
```livescript
for k, v of obj
	console.log k, ":", v

for own k, v of obj
	console.log k, ":", v
```

## Comprehensions

### JavaScript
It is common to generate a new list based on one list.
```javascript
var result=[];
for (var i=0 ; i<=10 ; i+=2) {
    if (i != 4) {
        result.push(i+1);
    }
}
console.log(result);                                    // [ 1, 3, 7, 9, 11 ]
```
Sometimes it is more complex.
```javascript
var result=[];
var arr1 = [ "a", "b" ], arr2 = [ 1, 2 ];
for (var i=0 ; i<arr1.length ; i++) {
    var x = arr1[i];
    for (var j=0 ; j<arr2.length ; j++) {
    	var y = arr2[j];
        result.push(""+x+y);
    }
}
console.log(result);                                    // [ 'a1', 'a2', 'b1', 'b2' ]
```

### CoffeeScript
list comprehension. Unlike Python, it uses `(` `)`.
```coffeescript
(x + 1 for x in [0..10] by 2 when x isnt 4)             # [ 1, 3, 7, 9, 11 ]
```
2-dimension list comprehension. CoffeeScript returns a 2-dimension list.
```coffeescript
("#{x}#{y}" for x in ["a", "b"] for y in [1, 2])        # [ [ 'a1', 'b1' ], [ 'a2', 'b2' ] ]
```
NOTE: CoffeeScript doens't support object comprehension.

### LiveScript
list comprehension. Similar to Python syntax, using `[` `]`.
```livescript
console.log [x + 1 for x to 10 by 2 when x isnt 4]  	# [ 1, 3, 7, 9, 11 ]
```
2-dimension list comprehension. Unlike CoffeeScript, LiveScript returns a flattened list.
```livescript
console.log ["#x#y" for x in ["a" "b"] for y in [1 2]]  # [ 'a1', 'a2', 'b1', 'b2' ]
```
LiveScript even supports object comprehension, in a syntax using `{ [key,value] for ...}` unlike Python.
```livescript
console.log { ["t#{x}", x] for x in [1 to 3] }          # -> { t1: 1, t2: 2, t3: 3 }

o = {a: 1, b: 2}
console.log { [key, val * 2] for key, val of o }        # -> { a:2, b:4}
```

## Closure in Loop
Consider doing an async action within loop.
###JavaScript
```javascript
for (var i=0 ; i<10 ; i++) {
    setTimeout(function() {
    	console.log(i);
    }, 500);								// This prints 10 for 10 times
}
```
It is a common practice to preseve the looping variable by passing it in a closure function.
```javascript
for (var i=0 ; i<10 ; i++) {
    setTimeout((function(i) {
        return function() {
       	    console.log(i);
        }
    })(i), 500);							// This correctly prints 0,1,2...,9
}
```
### CoffeeScript
With `do` keyword, it creates a closure wrapper.
```coffeescript
for i in [0..9]
  do(i) ->
      setTimeout ->
          console.log i
      , 200
```
### LiveScript
With `let` keyword, it create a closure wrapper.
```livescript
for let i in [0 to 9]
    setTimeout ->
        console.log i
    , 200
```
or
```livescript
for let i from 0 to 9
    setTimeout ->
        console.log i
    , 200
```