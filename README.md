Scope
=====

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