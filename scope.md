### Javascript

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

### Result
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

Javascript has only 2 level of scope:
- **global**
- **function**

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

Unlike other lanaguage such as Java or C, JavaScript has no ***blocking scope***.

Redeclaring x in the for loop blocking using `var x` simply refer to the same `x` declared in first line of `f() {...}`. It doesn't create a new variable and no warning at all. It is quite confusing if you're from language such as Java.

### CoffeeScript

CoffeeScript **strickly forbids you from declaring variables**. Like other language such as Python, just use it when you need it, coffee automatically refers to the latest effective scope. Code above still does not solve the problem, but less confusing.

```coffeescript
x = 1                                   # global x

f = () ->
    x = 5;                              # inner x

    for i in [0...10]
        x = i * 2                       # inner x
        console.log "in loop, x=", x

    console.log "in f() x=", x          # inner x

f()

console.log "in global, x=", x          # global x
```

```coffeescript
x = 1                                   # global x

f = () ->
    for i in [0...10]
        x = i * 2                       # global x
        console.log "in loop, x=", x

    console.log "in f() x=", x          # global x

f()

console.log "in global, x=", x          # global x
```

But what if **we do want to modify the global x in f()**? Unfortunately, you can't do this in Coffee.

### LiveScript
LiveScript is similar to Coffee, but allow you to explicitly override variable in upper scope by using `:=`.

```livescript
x = 1                                   # global x
f = ->
    x := 5                              # global x

    for i from 0 til 10
        x := i * 2                      # global x
        console.log "in loop, x=", x    # global x

    console.log "in f() x=", x          # global x

f()

console.log "in global, x=", x          # global x
```

But this one doesn't work. LiveScript compiler complains *SyntaxError: accidental shadow of "x"*. Because the `x = i*2` always declares a `x` in the inner scope, which shadows the global one.

```livescript
x = 1                                   # global x
f = ->
    x := 5                              # global x

    for i from 0 til 10
        x = i * 2                       # declare x in inner scope
        console.log "in loop, x=", x    # inner x

    console.log "in f() x=", x          # global x

f()

console.log "in global, x=", x          # global x
```