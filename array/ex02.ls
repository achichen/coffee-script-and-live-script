my_arr = [ 1,2,3,4,5 ]

console.log my_arr[1,4]         # [2, 5]
console.log my_arr[1 to 3]      # [2,3,4]
console.log my_arr[1 til 3]     # [2,3]

console.log "------------"

my_arr = [ 1,2,3,4,5 ]
my_arr[1 to 3] = [7,8,9]            
console.log my_arr              # [1,7,8,9,5] 

my_arr = [ 1,2,3,4,5 ]
my_arr[1 to 2] = [7,8,9]            
console.log my_arr              # [1,7,8,4,5] 

my_arr = [ 1,2,3,4,5 ]
my_arr[1 to 4] = [7,8,9]
console.log my_arr              # [1,7,8,9,undefined] 

my_arr = [ 1,2,3,4,5 ]
my_arr[1 to 1] = [7,8,9]
console.log my_arr              # [1,[7,8,9],3,4,5] 

console.log "------------"

my_arr = [ 1,2,3,4,5 ]
my_arr[1 til 4] = [7,8,9]           
console.log my_arr              # [1,7,8,9,5] 

my_arr = [ 1,2,3,4,5 ]
my_arr[1 til 3] = [7,8,9]           
console.log my_arr              # [1,7,8,4,5] 

my_arr = [ 1,2,3,4,5 ]
my_arr[1 til 5] = [7,8,9]
console.log my_arr              # [1,7,8,9,undefined] 

my_arr = [ 1,2,3,4,5 ]
my_arr[1 til 2] = [7,8,9]
console.log my_arr              # [1,[7,8,9],3,4,5] 

console.log "------------"

my_arr = [ 1,2,3,4,5 ]
my_arr[*] = 6
console.log my_arr              # [ 1,2,3,4,5,6 ]

console.log "------------"

obj = one: 1, two: 2, three: 3
console.log obj{one, two}        #=> {one: 1, two: 2}
console.log obj{first: one, two} #=> {first: 1, two: 2}