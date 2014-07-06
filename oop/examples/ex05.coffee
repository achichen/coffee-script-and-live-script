class Person
    # Static members
    @personCount = 0                    # alternative: @personCount : 0
    @type = "PERSON"                    # alternative: @type : "PERSON"

    @getType = () ->                    # alternative: @getType : () ->
        return @type

    constructor : (@name) ->
        Person.personCount++

    sayHello : () ->
        console.log("hello, i'm", @name)

    getClassType : () ->
        return Person.type

person1 = new Person("manu ginobili")
person2 = new Person("jeremy lin")

console.log(Person.type)                # "PERSON"
console.log(Person.personCount)         # 2
console.log(person1.type)               # undefined
console.log(person1.personCount)        # undefined
console.log(person2.type)               # undefined
console.log(person2.personCount)        # undefined

console.log(Person.getType())           # "PERSON"
#console.log(person1.getType())         # TypeError: Object #<Person> has no method 'getType'
#console.log(person2.getType())         # TypeError: Object #<Person> has no method 'getType'

console.log(person1.getClassType())     # "PERSON"
console.log(person2.getClassType())     # "PERSON"