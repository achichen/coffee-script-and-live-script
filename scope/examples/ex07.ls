f = ->
    x = 5                               # inner x 

    for i from 0 til 10
        x = i * 2                       # inner x
        console.log "in loop, x=", x

    console.log "in f() x=", x          # inner x

x = 1                                   # global x

f()

console.log "in global, x=", x          # global x