class Person
	constructor : (name) ->
		@name = name

	sayHello : () ->
		console.log("hello, i'm", @name)

person1 = new Person("manu ginobili")
person2 = new Person("jeremy lin")

console.log("person1", person1)
console.log("person2", person2)

person1.sayHello()								# hello, i'm manu ginobili
person2.sayHello()								# hello, i'm jeremy lin
