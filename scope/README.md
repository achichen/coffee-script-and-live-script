## Javascript

### Example 1
```javascript
var x = 1;

function f() {
    var x = 5;

    for (var i = 0; i < 10; i++) {
        var x = i * 2;
        console.log("in loop, x=", x);
    }

    console.log("in f() x=", x);
}

f();

console.log("in global, x=", x);
```

#### Result
```sh
in loop, x= 0
in loop, x= 2
in loop, x= 4
in loop, x= 6
in loop, x= 8
in loop, x= 10
in loop, x= 12
in loop, x= 14
in loop, x= 16
in loop, x= 18
in f() x= 18
in global, x= 1
```

Javascript uses so-called **function scope**, has only 2 kind of scope:
- **global**: the top-most scope
- **function**: every function has its own scope.

Unlike lanaguage with similar syntax, e.g. Java or C, JavaScript has no ***blocking scope***.

Back to Example 1, let's find out which scope of every `x` is.

```javascript
var x = 1;                                  // global x

function f() {
    var x = 5;                              // inner x

    for (var i = 0; i < 10; i++) {
        var x = i * 2;                      // inner x
        console.log("in loop, x=", x);
    }

    console.log("in f() x=", x);            // inner x
}

f();

console.log("in global, x=", x);            // global x
```

Redeclaring x in the for loop blocking using `var x` simply refers to the same `x` declared in first line of `f() {...}`. It doesn't create a new variable and no warning at all. ***It is quite confusing if you're from  those similar languages.***

### Example2
Let's refactor Example 1 to Example 2, by extracting the code in the for loop to `f1()`.

```javascript
var x = 1;                                  // global x

function f() {
    var x = 5;                              // x in f() scope

    function f1(i) {
        var x = i * 2;                      // x in f1() scope
        console.log("in loop, x=", x);
    }

    for (var i = 0; i < 10; i++) {
        f1(i);
    }

    console.log("in f() x=", x);            // x in f() scope
}

f();

console.log("in global, x=", x);            // global x
```
#### Result
```sh
in loop, x= 0
in loop, x= 2
in loop, x= 4
in loop, x= 6
in loop, x= 8
in loop, x= 10
in loop, x= 12
in loop, x= 14
in loop, x= 16
in loop, x= 18
in f() x= 5
in global, x= 1
```

You can see a different `x` is declared in the scope of `f1()`, shadowing the `x` in the scope of `f()`, keeping it unaffected by the loop.

### The Problem
When writing JavaScript, you have to be careful about `var`, which sometimes doesn't declare a variable as you expected, this might lead to a buggy code. Tools like [jslint](http://www.jslint.com/) is a good way to discover the potential bug.

---

## CoffeeScript

CoffeeScript solves this problem by **strickly forbidding you from declaring variables**, enforcing **lexical scope**. You never write `var x` yourself. Variable is automatically declared when the 1st time you use it. Any later use of it refers to the one already declared in scopes. 

### Example 3
It is less confusing if Example 1 is rewritten using coffee.

```coffeescript
x = 1                                   # global x

f = () ->
    x = 5                               # global x

    for i in [0...10]
        x = i * 2                       # global x
        console.log "in loop, x=", x

    console.log "in f() x=", x          # global x

f()

console.log "in global, x=", x          # global x
```

is compiled to 

```javascript
(function() {
    var f, x;                                   // global x is declared

    x = 1;                                      // reuse global x

    f = function() {
        var i, _i;
        x = 5;                                  // reuse global x
        for (i = _i = 0; _i < 10; i = ++_i) {
            x = i * 2;                          // reuse global x
            console.log("in loop, x=", x);
        }
        return console.log("in f() x=", x);     // reuse global x
    };

    f();

    console.log("in global, x=", x);

}).call(this);
```

#### Result
```sh
in loop, x= 0
in loop, x= 2
in loop, x= 4
in loop, x= 6
in loop, x= 8
in loop, x= 10
in loop, x= 12
in loop, x= 14
in loop, x= 16
in loop, x= 18
in f() x= 18
in global, x= 18
```

You can see all `x` refers to the one defined in global scope.

### Example 4
Lets' refactor Example 3 in a way similar to Example 2, extracting loop code to a inner function `f1()`.

```coffeescript
x = 1                                       # global x

f = () ->
    x = 5                                   # global x

    f1 = (i) ->
    	x = i * 2                           # global x
    	console.log "in loop, x=", x

    for i in [0...10]
    	f1(i)

    console.log "in f() x=", x              # global x

f()

console.log "in global, x=", x              # global x
```

The effect is completely the same as Example 3. CoffeeScript doesn't create a new variable in `f1()`, because **there is one existed before it lexically**.


### Example 5
Now let's do something interesting on Example 3, move the global `x = 1` after the `f()`.

```coffeescript
f = () ->
    x = 5                               # 1st declare of x

    for i in [0...10]
    	x = i * 2                       # inner x
    	console.log "in loop, x=", x

    console.log "in f() x=", x          # inner x

x = 1                                   # global x

f()

console.log "in global, x=", x          # global x
```

#### Result
```sh
in loop, x= 0
in loop, x= 2
in loop, x= 4
in loop, x= 6
in loop, x= 8
in loop, x= 10
in loop, x= 12
in loop, x= 14
in loop, x= 16
in loop, x= 18
in f() x= 18
in global, x= 1
```

You can see the global `x` is not affected by code in `f()`, because it is lexically later than `f()`. 

The compiled Javascript is :

```javascript
(function() {
    var f, x;                                   // declare global x

    f = function() {
        var i, x, _i;                           // declare inner x
        x = 5;
        for (i = _i = 0; _i < 10; i = ++_i) {
            x = i * 2;
            console.log("in loop, x=", x);
        }
        return console.log("in f() x=", x);
    };

    x = 1;

    f();

    console.log("in global, x=", x);

}).call(this);
```

### The Problem

1. Is lexical scope less confusing? You have to examine codes before current line for occurrence of the variable you want use. And moving a single line might completely change the scope and final result.
2. What if we do want to modify the global x from f()? Unfortunately, there is no way to do that in Coffee.

---

## LiveScript
Unlike CoffeeScript's lexical scope design, LiveScript is much more similar to JavaScript's function scope, which has ***global*** and ***function*** scopes. But it solves JavaScript's problem by automatic variable declaration too. 

### Example 6
The LiveScript's scope is just like JavaScript, see Example 1.

```livescript
x = 1                                   # global x

f = ->
    x = 5                               # inner x

    for i from 0 til 10
        x = i * 2                       # inner x
        console.log "in loop, x=", x

    console.log "in f() x=", x          # inner x

f()

console.log "in global, x=", x          # global x
```

### Example 7

Let's move the `x=1` just like CoffeeScript Example 5. Because LiveScript doesn't use lexical scope, it doesn't affect the final result.

```livescript
f = ->
    x = 5                               # inner x 

    for i from 0 til 10
        x = i * 2                       # inner x
        console.log "in loop, x=", x

    console.log "in f() x=", x          # inner x

x = 1                                   # global x

f()

console.log "in global, x=", x          # global x
```

### Example 8
Again, we extract `f1()`. The result is the same as JavaScript Example 2.

```livescript
x = 1                                   # global x

f = ->
    x = 5                               # x in scope f()

    f1 = (i) ->
        x = i * 2                       # x in scope f1()
        console.log "in loop, x=", x

    for i from 0 til 10
        f1(i)

    console.log "in f() x=", x          # x in scope f()

f()

console.log "in global, x=", x          # global x
```

#### Result
```sh
in loop, x= 0
in loop, x= 2
in loop, x= 4
in loop, x= 6
in loop, x= 8
in loop, x= 10
in loop, x= 12
in loop, x= 14
in loop, x= 16
in loop, x= 18
in f() x= 5
in global, x= 1
```

### Example 9
LiveScript allows you to explicitly override variable in upper scope by using `:=`.

```livescript
x = 1                                   # global x

f = ->
    x := 5                              # global x

    f1 = (i) ->
        x := i * 2                      # global x
        console.log "in loop, x=", x

    for i from 0 til 10
        f1(i)

    console.log "in f() x=", x          # global x

f()

console.log "in global, x=", x          # global x
```

### Example 10
Let's see another example, a `x` is declared in `f()` scope.

```livescript
x = 1                                   # global x

f = ->
    x = 5                               # x in scope f()

    f1 = (i) ->
        x := i * 2                      # x in scope f()
        console.log "in loop, x=", x

    for i from 0 til 10
        f1(i)

    console.log "in f() x=", x          # x in scope f()

f()

console.log "in global, x=", x          # global x
```

### Example 11
However, when you try to use both `:=` and `=` to access the same variable `x` in `f()`. LiveScript compiler complains ***SyntaxError: accidental shadow of "x"***. Because the line `x = i*2` always declares a `x` in the inner scope, which shadows the global one.

```livescript
x = 1                                   # global x
f = ->
    x := 5                              # no way to access global x, because it has been shadowed

    for i from 0 til 10
        x = i * 2                       # declare x in inner scope
        console.log "in loop, x=", x    # inner x

    console.log "in f() x=", x          # global x

f()

console.log "in global, x=", x          # global x
```

## Conclusion

- Function scope, used by JavaScript and LiveScript, is easier to understand and discover without the need to examine all the occurrences of variables before using it. 
- LiveScript also prevents the buggy, ineffective but no-warning `var` redeclaration.