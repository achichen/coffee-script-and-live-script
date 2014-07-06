## JavaScript

JavaScript is an OO language, just not that straight-forward by using ***prototype-based programming***:
- instead of defining `class`, JavaScript defines ***constructor***
- inheritance is provided by ***protytype chaining***

### Example1

```javascript
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
```

### Example 2

```javascript
// class Person
function Person(name) {
	this.name = name;
}

Person.prototype.sayHello = function() {
	console.log("hello", this.name);
}

Person.prototype.walk = function() {
	console.log(this.name, "is walking");
}

// class BasketballPlayer
function BasketballPlayer(name, team) {
	Person.call(this, name);

	this.team = team;
}

BasketballPlayer.prototype = Object.create(Person.prototype);

BasketballPlayer.prototype.sayHello = function() {
	console.log("hello, i'm", this.name, "of", this.team);
}

BasketballPlayer.prototype.jump = function() {
	console.log(this.name, "is jumping");
}


// create 2 player instance
var player1 = new BasketballPlayer("manu ginobini", "san antonio spurs");
var player2 = new BasketballPlayer("jeremy lin", "houston rockets");

console.log("player1", player1);
console.log("player2", player2);

player1.sayHello();
player1.jump();
player1.walk();

player2.sayHello();
player2.jump();
player2.walk();

console.log(player1 instanceof BasketballPlayer);							// true
console.log(player1 instanceof Person);										// true

// properties defined on the instance
console.log("properties defined on the instance");
console.log(player1.hasOwnProperty("name"));								// true
console.log(player1.hasOwnProperty("team"));								// true
console.log(player1.hasOwnProperty("sayHello"));							// false
console.log(player1.hasOwnProperty("walk"));								// false
console.log(player1.hasOwnProperty("jump"));								// false

// properties defined on BasketballPlayer prototype
console.log("properties defined on the prototype");
console.log(player1.__proto__ === BasketballPlayer.prototype);				// true
console.log(player1.__proto__.hasOwnProperty("sayHello"));					// true
console.log(player1.__proto__.hasOwnProperty("jump"));						// true
console.log(player1.__proto__.hasOwnProperty("walk"));						// false

// properties defined on BasketballPlayer prototype
console.log("properties defined on the prototype");
console.log(player1.__proto__ instanceof Person);							// true
console.log(player1.__proto__.__proto__ === Person.prototype);				// true
console.log(player1.__proto__.__proto__.hasOwnProperty("sayHello"));		// true
console.log(player1.__proto__.__proto__.hasOwnProperty("walk"));			// true
console.log(player1.__proto__.__proto__.hasOwnProperty("jump"));			// false

console.log(Person.prototype.__proto__ === Object.prototype);				// true
```

#### Prototype Chain
![](https://github.com/achichen/qcloud-sharing-july-seventh/tree/master/oop/prototype_chain.png)