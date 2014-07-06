x = 1                                   # global x

f = () ->
    x = 5                               # global x

    for i in [0...10]
        x = i * 2                       # global x
        console.log "in loop, x=", x

    console.log "in f() x=", x          # global x

f()

console.log "in global, x=", x          # global x