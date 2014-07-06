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