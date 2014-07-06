x = 1                                   # global x

f = ->
    x = 5                               # x in scope f()

    f1 = (i) ->
        x = i * 2                       # x in scope f1()
        console.log "in loop, x=", x

    for i from 0 til 10
        f1(i)

    console.log "in f() x=", x          # x in scope f()

f()

console.log "in global, x=", x          # global x