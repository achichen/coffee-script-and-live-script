// class Person
function Person(name) {
	this.name = name;
}

Person.prototype.sayHello = function() {
	console.log("hello, i'm", this.name);
}

var person1 = new Person("manu ginobili");
var person2 = new Person("jeremy lin");

console.log("person1", person1);
console.log("person2", person2);

person1.sayHello();								// hello, i'm manu ginobili
person2.sayHello();								// hello, i'm jeremy lin

// change on protype affects all instances
person1.__proto__.sayHello = function() {
	console.log("bonjour, je suis", this.name);
}
person1.sayHello();								// bonjour, je suis manu ginobili
person2.sayHello();								// bonjour, je suis jeremy lin
