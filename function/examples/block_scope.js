function f() {  return "global";  }


function test1(x) {
    function f() {  return "local";  }

    var result = [];
    if (x) {
        result.push(f());
    }
    result.push(f());
    return result;
}

console.log(test1(true));                 // [ "local", "local" ]
console.log(test1(false));                // [ "local" ]


function test2(x) {
    var result = [];
    if (x) {
        function f() {  return "local";  }
        result.push(f());
    }
    result.push(f());
    return result;
}

console.log(test2(true));                 // [ "local", "local" ]
console.log(test2(false));                // [ "local" ]