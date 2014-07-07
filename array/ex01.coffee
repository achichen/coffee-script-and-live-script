my_arr = [ 1,2,3,4,5 ]

# console.log my_arr[1,4]       # Not work in coffee
console.log my_arr[1..3]        # [2,3,4]
console.log my_arr[1...3]       # [2,3]

console.log "------------"

my_arr = [ 1,2,3,4,5 ]
my_arr[1..3] = [7,8,9]          
console.log my_arr              # [1,7,8,9,5] 

my_arr = [ 1,2,3,4,5 ]
my_arr[1..2] = [7,8,9]          
console.log my_arr              # [1,7,8,9,4,5] 

my_arr = [ 1,2,3,4,5 ]
my_arr[1..4] = [7,8,9]
console.log my_arr              # [1,7,8,9] 

my_arr = [ 1,2,3,4,5 ]
my_arr[1..1] = [7,8,9]
console.log my_arr              # [1,7,8,9,3,4,5] 

console.log "------------"

my_arr = [ 1,2,3,4,5 ]
my_arr[1...4] = [7,8,9]         
console.log my_arr              # [1,7,8,9,5] 

my_arr = [ 1,2,3,4,5 ]
my_arr[1...3] = [7,8,9]         
console.log my_arr              # [1,7,8,9,4,5] 

my_arr = [ 1,2,3,4,5 ]
my_arr[1...5] = [7,8,9]
console.log my_arr              # [1,7,8,9] 

my_arr = [ 1,2,3,4,5 ]
my_arr[1...2] = [7,8,9]
console.log my_arr              # [1,7,8,9,3,4,5] 

console.log "------------"

my_arr = [ 1,2,3,4,5 ]
# my_arr[*] = 6                 # Not working in cofffee
console.log my_arr

console.log "------------"

obj = one: 1, two: 2, three: 3
#console.log obj{one, two}        #=> Not working in coffee
#console.log obj{first: one, two} #=> Not working in coffee