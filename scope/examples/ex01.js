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