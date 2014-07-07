#list comprehension
console.log (x + 1 for x in [0..10] by 2 when x isnt 4)         # [ 1, 3, 7, 9, 11 ]

#2-dimension list comprehension
console.log ("#{x}#{y}" for x in ["a", "b"] for y in [1, 2])    # [ [ 'a1', 'b1' ], [ 'a2', 'b2' ] ]
