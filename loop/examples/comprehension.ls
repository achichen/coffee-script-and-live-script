#list comprehension: return a list
console.log [x + 1 for x to 10 by 2 when x isnt 4]          # [ 1, 3, 7, 9, 11 ]

#2-dimension list comprehension
console.log ["#x#y" for x in ["a" "b"] for y in [1 2]]        # [ 'a1', 'a2', 'b1', 'b2' ]
# --> 
# In coffee, this will produce 2-dimension array, which is not quite useful.
# --> [ [ 'a1', 'b1' ], [ 'a2', 'b2' ] ]


console.log "--------- Enhanced from Coffee -------------"

# Object comprehension: return a object
console.log { ["t#{x}", x] for x in [1 to 3] }          # -> { t1: 1, t2: 2, t3: 3 }

o = {a: 1, b: 2}
console.log { [key, val * 2] for key, val of o }        # -> { a:2, b:4}