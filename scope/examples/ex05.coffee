f = () ->
    x = 5                               # 1st declare of x

    for i in [0...10]
        x = i * 2                       # inner x
        console.log "in loop, x=", x

    console.log "in f() x=", x          # inner x

x = 1                                   # global x

f()

console.log "in global, x=", x          # global x