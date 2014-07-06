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