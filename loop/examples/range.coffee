for i in [0..10]
    console.log i

# These 2 usage should be the same in sematics, but coffee compiles them to different logic.
# This causes an interesting behavior that what "i" will be after the loop.
# See wrapper.coffee for the interesting case.
# In LiveScript, the 2 usages are compiled using the same logic.

arr = [0..10]
for i in arr
    console.log i


# for i,index in [0..10]        # NOT WORK: indexes do not apply to range loops
#   console.log i,index

range = [0..10] 
for i,index in range
    console.log i,index


console.log "-------------------------------------------"

start = 10
end = 1
for i in [start..end] by -1
    console.log i

# Works as well when "by" is not specified
# Coffee is smart enough to auto determine ascending or descending, but it takes some cost.
for i in [start..end]
    console.log i

console.log "-------------------------------------------"
