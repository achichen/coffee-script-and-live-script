hello = ->
    console.log "hello"

square = (x) -> x * x

cube   = (x) -> 
    square(x) * x

fill = (container, liquid = "coffee") ->
    "Filling the #{container} with #{liquid}..."