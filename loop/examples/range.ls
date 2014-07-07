# The range way to loop
# A array [0,1,...,10] is allocated in memory before loop

for i in [0 to 10]
    console.log i

# These 2 usage should be the same in sematics.
# In LiveScript, the 2 usages are compiled using the same logic.
# But in coffee, their behavior are different.
# See basic.coffee for the interesting case.
# 

arr = [0 to 10]
for i in arr
    console.log i

# a better way to loop
# no array is allocated
# this one is close to following coffeescript
# for i in [0..10]
#     console.log i
for i from 0 to 10
    console.log i

# Support index on range
for i,index in [0 to 10]
    console.log i,index


console.log "-------------------------------------------"

start = 10
end = 1
for i in [start to end by -1]
    console.log i

# Print nothing when "by" is not specified
for i in [start to end]
    console.log i


console.log "--------- Enhanced from Coffee -------------"

# the beginning of range is ignorable
for i to 10
    console.log i

# Omit one or both variable, if you don't need it
for ,index in [0 to 10]
    console.log index

# the variable can be ignored, if you don't need it at all
for from 8 to 9
    console.log "hi2"

for to 9
    console.log "hi10"

# These two are equivalent
for i in [1,2,3]
    console.log "hi hi", i

for [1,2,3]
    console.log "hi hi", ..