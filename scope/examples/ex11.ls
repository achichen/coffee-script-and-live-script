x = 1                                   # global x
f = ->
    x := 5                              # no way to access global x, because it has been shadowed

    for i from 0 til 10
        x = i * 2                       # declare x in inner scope
        console.log "in loop, x=", x    # inner x

    console.log "in f() x=", x          # global x

f()

console.log "in global, x=", x          # global x