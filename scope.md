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

Unlike other lanaguage such as Java, JavaScript has no ***blocking scope***.

Redeclare x in the for loop blocking using `var x` do nothing and no warning at all, it simply refer to the same `x` declared in first line of `f() {...}`.


### CoffeeScript
```coffeescript
x = 1

f = () ->
    x = 5;

    for i in [0...10]
        x = i * 2
        console.log "in loop, x=", x

    console.log "in f() x=", x

f()

console.log "in global, x=", x
```

### LiveScript
```livescript
x = 1

f = ->
    x = 5;

    for i from 0 til 10
        x = i * 2
        console.log "in loop, x=", x

    console.log "in f() x=", x

f()

console.log "in global, x=", x
```