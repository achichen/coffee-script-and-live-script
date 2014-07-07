
## Array Slicing

###CoffeeScript
```coffeescript
my_arr = [ 1,2,3,4,5 ]

console.log my_arr[1..3]        # [2,3,4]
console.log my_arr[1...3]       # [2,3]
```

###LiveScript
```livescript
my_arr = [ 1,2,3,4,5 ]

console.log my_arr[1,4]         # [2,5]
console.log my_arr[1 to 3]      # [2,3,4]
console.log my_arr[1 til 3]     # [2,3]
```

## Array Splicing

###CoffeeScript
```coffeescript
my_arr = [ 1,2,3,4,5 ]
my_arr[1..3] = [7,8,9]
console.log my_arr				# [1,7,8,9,5]

my_arr = [ 1,2,3,4,5 ]
my_arr[1..2] = [7,8,9]
console.log my_arr				# [1,7,8,9,4,5]

my_arr = [ 1,2,3,4,5 ]
my_arr[1..4] = [7,8,9]
console.log my_arr				# [1,7,8,9]

my_arr = [ 1,2,3,4,5 ]
my_arr[1..1] = [7,8,9]
console.log my_arr				# [1,7,8,9,3,4,5]
```

###LiveScript
```livescript
my_arr = [ 1,2,3,4,5 ]
my_arr[1 to 3] = [7,8,9]
console.log my_arr				# [1,7,8,9,5] 

my_arr = [ 1,2,3,4,5 ]
my_arr[1 to 2] = [7,8,9]
console.log my_arr				# [1,7,8,4,5] 

my_arr = [ 1,2,3,4,5 ]
my_arr[1 to 4] = [7,8,9]
console.log my_arr				# [1,7,8,9,undefined]

my_arr = [ 1,2,3,4,5 ]
my_arr[1 to 1] = [7,8,9]
console.log my_arr				# [1,[7,8,9],3,4,5]
```