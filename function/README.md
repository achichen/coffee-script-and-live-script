## Function Definition
### JavaScript
```javascript
function hello() {
    console.log("hello");
}

function square(x) {
    return x*x;
}

function cube(x) {
    return square(x) * x;
}
```
Or you might also write in this way:
```javascript
var hello = function() {
    console.log("hello");
}

var square = function(x) {
    return x*x;
}

var cube = function(x) {
    return square(x) * x;
}
```

### CoffeeScript
In CoffeeScript, functions always return the last expression.
```coffeescript
hello = () ->
    console.log "hello"

square = (x) -> x * x

cube   = (x) -> 
    square(x) * x

fill = (container, liquid = "coffee") ->
    "Filling the #{container} with #{liquid}..."
```
it is compiled to:
```javascript
var cube, fill, hello, square;

hello = function() {
    return console.log("hello");
};

square = function(x) {
    return x * x;
};

cube = function(x) {
    return square(x) * x;
};

fill = function(container, liquid) {
    if (liquid == null) {
        liquid = "coffee";
    }
    return "Filling the " + container + " with " + liquid + "...";
};
```

### LiveScript
Everything is almost the same as CoffeeScript, except `()` must be removed when defining function.
```livescript
hello = ->
    console.log "hello"

square = (x) -> x * x

cube   = (x) -> 
    square(x) * x

fill = (container, liquid = "coffee") ->
    "Filling the #{container} with #{liquid}..."
```

## Dangerous Block-Local Function

### JavaScript
Consider this example:
```javascript
function f() {  return "global";  }

function test(x) {
    function f() {  return "local";  }

    var result = [];
    if (x) {
        result.push(f());
    }
    result.push(f());
    return result;
}

console.log(test(true));                 // [ "local", "local" ]
console.log(test(false));                // [ "local" ]
```

If we move the inner `f()` into `if (x) {...}`

```javascript
function f() {  return "global";  }

function test(x) {
    var result = [];
    if (x) {
        function f() {  return "local";  }
        result.push(f());
    }
    result.push(f());
    return result;
}

console.log(test(true));                 // [ "local", "local" ] NOT [ "local", "global" ]
console.log(test(false));                // [ "local" ]
```
If you are coming from languages such as Java, C, you would expect `test(true)` to get `[ "local", "global" ]`. But in fact, it gets `[ "local", "local" ]`.

This is because JavaScript doesn't have **blocking scope**, but just **function scope**. Thought `function f() {  return "local";  }` is defined in `if(x) {...}` block, it is actually declared in the scope of `test()`, and can be seen by all codes with `test() {...}`.

It is even worse, not all environments behave the same way. This behavior is not specified in ECMAScript standard.

Thus, it is recommend not using `function xxx() {...}` statement in blocking. Instead, you should use `var xxx = function() { ... }`.

### CoffeeScript
CoffeeScript doesn't suffer from this problem, it always uses variable declartion for functions.

### LiveScript
LiveScript doesn't suffer from this problem, it always uses variable declartion for functions.

See [Scope](..scope) for more explanations.
