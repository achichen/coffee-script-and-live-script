## JavaScript

JavaScript is an OO language. But it's just not that straight-forward because of using ***prototype-based oop***:
- instead of defining `class`, JavaScript defines ***constructor***
- member lookup and inheritance are achieved by ***protytype chaining***

### Example1

```javascript
// constructor Person
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
// constructor Person
function Person(name) {
	this.name = name;
}

Person.prototype.sayHello = function() {
	console.log("hello, i'm", this.name);
}

Person.prototype.walk = function() {
	console.log(this.name, "is walking");
}

// constructor BasketballPlayer
function BasketballPlayer(name, team) {
	Person.call(this, name);

	this.team = team;
}

BasketballPlayer.prototype = Object.create(Person.prototype);

BasketballPlayer.prototype.sayHello = function() {
	Person.prototype.sayHello.call(this);				// Call Person.sayHello()
	console.log("of", this.team);
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
```

#### Prototype Chain
![](https://raw.githubusercontent.com/achichen/qcloud-sharing-july-seventh/master/oop/prototype_chain.png)

### The Problem
It's never easy to form a proper prototype chain by yourself. Some library provides helper for this, for example, [`util.inherits()`](http://nodejs.org/api/util.html#util_util_inherits_constructor_superconstructor) in Node.js.

---

## CoffeeScript
CoffeeScript provides ***class-based oop*** over ***protoype-based oop*** JavaScript.

### Example 3
To rewrite the class definition in Example 1 using CoffeeScript:
```coffeescript
class Person
	# Use a shorthand to assing @name
    constructor : (@name) ->

	sayHello : () ->
		console.log("hello, i'm", @name)

person1 = new Person("manu ginobili")
person2 = new Person("jeremy lin")

console.log("person1", person1)
console.log("person2", person2)

person1.sayHello()								# hello, i'm manu ginobili
person2.sayHello()								# hello, i'm jeremy lin
```

it is compiled to:

```javascript
(function() {
    var Person, person1, person2;

    Person = (function() {
        function Person(name) {
            this.name = name;
        }

        Person.prototype.sayHello = function() {
            return console.log("hello, i'm", this.name);
        };

        return Person;

    })();

    person1 = new Person("manu ginobili");

    person2 = new Person("jeremy lin");

    console.log("person1", person1);

    console.log("person2", person2);

    person1.sayHello();

    person2.sayHello();

}).call(this);
```

### Example 4
CoffeeScript provides `extends` for inheritance. Let's rewrite the Example 2 using CoffeeScript.

```coffeescript
class Person
	# Use a shorthand to assing @name
	constructor : (@name) ->

	sayHello : () ->
		console.log("hello, i'm", @name)

	walk : () ->
		console.log(@name, "is walking")


class BasketballPlayer extends Person
	constructor : (name, team) ->
		super(name)
		@team = team

	sayHello : () ->
		super()
		console.log("of", @team)

	jump : () ->
		console.log(@name, "is jumping")


# create 2 player instance
player1 = new BasketballPlayer("manu ginobini", "san antonio spurs")
player2 = new BasketballPlayer("jeremy lin", "houston rockets")

console.log("player1", player1)
console.log("player2", player2)

player1.sayHello()
player1.jump()
player1.walk()

player2.sayHello()
player2.jump()
player2.walk()
```

it is compiled to:

```javascript
(function() {
    var BasketballPlayer, Person, player1, player2,
        __hasProp = {}.hasOwnProperty,
        __extends = function(child, parent) {
            for (var key in parent) {
                if (__hasProp.call(parent, key)) child[key] = parent[key];
            }

            function ctor() {
                this.constructor = child;
            }
            ctor.prototype = parent.prototype;
            child.prototype = new ctor();
            child.__super__ = parent.prototype;
            return child;
        };

    Person = (function() {
        function Person(name) {
            this.name = name;
        }

        Person.prototype.sayHello = function() {
            return console.log("hello, i'm", this.name);
        };

        Person.prototype.walk = function() {
            return console.log(this.name, "is walking");
        };

        return Person;

    })();

    BasketballPlayer = (function(_super) {
        __extends(BasketballPlayer, _super);

        function BasketballPlayer(name, team) {
            BasketballPlayer.__super__.constructor.call(this, name);
            this.team = team;
        }

        BasketballPlayer.prototype.sayHello = function() {
            BasketballPlayer.__super__.sayHello.call(this);
            return console.log("of", this.team);
        };

        BasketballPlayer.prototype.jump = function() {
            return console.log(this.name, "is jumping");
        };

        return BasketballPlayer;

    })(Person);

    player1 = new BasketballPlayer("manu ginobini", "san antonio spurs");

    player2 = new BasketballPlayer("jeremy lin", "houston rockets");

    console.log("player1", player1);

    console.log("player2", player2);

    player1.sayHello();

    player1.jump();

    player1.walk();

    player2.sayHello();

    player2.jump();

    player2.walk();

}).call(this);
```

#### Prototype Chain
![](https://raw.githubusercontent.com/achichen/qcloud-sharing-july-seventh/master/oop/prototype_chain_by_coffee.png)

### Example 5
It is also possible to add **static** members onto class. But unlike Java, C++ and Python, they are not accessible via instances.

```coffeescript
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
```

it is compiled to:

```javascript
var Person, person1, person2;

Person = (function() {
    Person.personCount = 0;

    Person.type = "PERSON";

    Person.getType = function() {
        return this.type;
    };

    function Person(name) {
        this.name = name;
        Person.personCount++;
    }

    Person.prototype.sayHello = function() {
        return console.log("hello, i'm", this.name);
    };

    Person.prototype.getClassType = function() {
        return Person.type;
    };

    return Person;
})();

person1 = new Person("manu ginobili");

person2 = new Person("jeremy lin");
```

### Example 6
static members are inherited by subclass. But unlike Java, C++, the inherited static members are **copied** into subclass, change on it doesn't affect the superclass's static member. The same behavior can also be found in Python.

```coffeescript
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

    walk : () ->
        console.log(@name, "is walking")


class BasketballPlayer extends Person

    constructor : (name, @team) ->
        super(name)
        BasketballPlayer.personCount+=2

    sayHello : () ->
        super()
        console.log("of", @team)

    jump : () ->
        console.log(@name, "is jumping")

# create 2 player instance
player1 = new BasketballPlayer("manu ginobini", "san antonio spurs")


console.log Person.type                     # "PERSON"
console.log Person.getType()                # "PERSON"
console.log BasketballPlayer.type           # "PERSON"
console.log BasketballPlayer.getType()      # "PERSON"

console.log player1.type                    # undefined
#console.log player1.getType()              # TypeError: Object #<BasketballPlayer> has no method 'getType'

BasketballPlayer.type = "BasketballPlayer"
console.log Person.type                     # "PERSON"
console.log BasketballPlayer.type           # "BasketballPlayer"

BasketballPlayer.getType = () ->
    return @type + "!!!!!"
console.log Person.getType()                # "PERSON"
console.log BasketballPlayer.getType()      # "BasketballPlayer!!!"

console.log Person.personCount              # 1
console.log BasketballPlayer.personCount    # 2
```

---

## LiveScript

LiveScript provides `class` statement the same as CoffeeScript, except the `constrcutor` keyword is removed. From Example 7 to 10, it demostrates the behavior of LiveScript class is the same as CoffeeScript. In fact, their compiled code is almost in the same logic.

### Example 7

Rewrite Example 3 using LiveScript.

```livescript
class Person
    (@name) ->

    sayHello : ->
        console.log("hello, i'm", @name)

person1 = new Person("manu ginobili")
person2 = new Person("jeremy lin")

console.log("person1", person1)
console.log("person2", person2)

person1.sayHello()                              # hello, i'm manu ginobili
person2.sayHello()                              # hello, i'm jeremy lin
```

### Example 8
Inheritance is also the same as CoffeeScript.

```livescript
class Person
    (@name) ->

    sayHello : ->
        console.log("hello, i'm", @name)

    walk : ->
        console.log(@name, "is walking")


class BasketballPlayer extends Person
    (name, team) ->
        super(name)
        @team = team

    sayHello : ->
        super()
        console.log("of", @team)

    jump : ->
        console.log(@name, "is jumping")


# create 2 player instance
player1 = new BasketballPlayer("manu ginobini", "san antonio spurs")
player2 = new BasketballPlayer("jeremy lin", "houston rockets")

console.log("player1", player1)
console.log("player2", player2)

player1.sayHello()
player1.jump()
player1.walk()

player2.sayHello()
player2.jump()
player2.walk()
```

#### Prototype Chain
![](https://raw.githubusercontent.com/achichen/qcloud-sharing-july-seventh/master/oop/prototype_chain_by_livescript.png)

### Example 9
static members behaves just like CoffeeScript. `@@` annotation is a shorthand to the constructor.

```livescript
class Person
    # Static members
    @personCount = 0
    @type = "PERSON"

    @getType = ->
        return @type

    (@name) ->
        @@personCount++

    sayHello : ->
        console.log("hello, i'm", @name)

    getClassType : ->
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
```

### Example 10
static members behaves just like CoffeeScript.

```livescript
class Person
    # Static members
    @personCount = 0
    @type = "PERSON"

    @getType = ->
        return @type

    (@name) ->
        @@personCount++

    sayHello : ->
        console.log("hello, i'm", @name)

    walk : ->
        console.log(@name, "is walking")


class BasketballPlayer extends Person

    (name, team) ->
        super(name)
        @team = team
        @@personCount+=2

    sayHello : ->
        super()
        console.log("of", @team)

    jump : ->
        console.log(@name, "is jumping")

# create 2 player instance
player1 = new BasketballPlayer("manu ginobini", "san antonio spurs")


console.log Person.type                     # "PERSON"
console.log Person.getType()                # "PERSON"
console.log BasketballPlayer.type           # "PERSON"
console.log BasketballPlayer.getType()      # "PERSON"

console.log player1.type                    # undefined
#console.log player1.getType()              # TypeError: Object #<BasketballPlayer> has no method 'getType'

BasketballPlayer.type = "BasketballPlayer"
console.log Person.type                     # "PERSON"
console.log BasketballPlayer.type           # "BasketballPlayer"

BasketballPlayer.getType = ->
    return @type + "!!!!!"
console.log Person.getType()                # "PERSON"
console.log BasketballPlayer.getType()      # "BasketballPlayer!!!"

console.log Person.personCount              # 1
console.log BasketballPlayer.personCount    # 2
```

### Example 11
LiveScripts provides addition feature called **Mixin**. A mixin is an object(or class) waiting to be *mixed in* somewhere. You may treat it as a reusable component, implementing certain interface, usually not used alone. 

Mixin is a good concept to reuse codes by combining difference pieces of codes in a place.

LiveScript uses keyword `implements` to mixin. This might be very confusing for Java guys. But it is more like multiple inheritance.

```livescript
Runnable =
    run: ->
        "run!!"

Renamable = 
    set-name : (@name) ->
    get-name : -> @name ? @id


class A implements Runnable, Renamable
    ->
        @id = Math.random! * 1000

a = new A
a.set-name "Achi"
console.log "a.get-name!", a.get-name()         # run Renamable.get-name()
console.log a.run()                             # run Runnable.run()
```

If you check the compiled JavaScript. There is no magic, simply copying everything from each mixed-in objects.

```javascript
(function() {
    var Runnable, Renamable, A, a;
    Runnable = {
        run: function() {
            return "run!!";
        }
    };
    Renamable = {
        setName: function(name) {
            this.name = name;
        },
        getName: function() {
            var ref$;
            return (ref$ = this.name) != null ? ref$ : this.id;
        }
    };
    A = (function() {
        A.displayName = 'A';
        var prototype = A.prototype,
            constructor = A;
        importAll$(prototype, arguments[0]);
        importAll$(prototype, arguments[1]);

        function A() {
            this.id = Math.random() * 1000;
        }
        return A;
    }(Runnable, Renamable));
    a = new A;
    a.setName("Achi");
    console.log("a.get-name!", a.getName());
    console.log(a.run());

    function importAll$(obj, src) {
        for (var key in src) obj[key] = src[key];
        return obj;
    }
}).call(this);
```

### Example 12
When there are more than one mixin containing function with the same name, the later is used.

```livescript
Renamable = 
    set-name : (@name) ->
    get-name : -> @name

Nameconcatable = 
    get-name : -> "#{@name} #{@id}"


class A implements Renamable, Nameconcatable
    ->
        @id = Math.random! * 1000

a = new A
a.set-name "Achi"
console.log a.get-name()          # run Nameconcatable.get-name(), the later overide the former
```

### Example 13
It is not working as you expected if you mixin a class.

```livescript
class Runnable

    run: ->
        "run!!"

Renamable = 
    set-name : (@name) ->
    get-name : -> @name ? @id


class A implements Runnable, Renamable
    ->
        @id = Math.random! * 1000

a = new A
a.set-name "Achi"

console.log a.run!              # TypeError: Object #<A> has no method 'run'
```

### Example 14
Instead, you should mixin its instance rather than the class itself.

```livescript
class Runnable

    run: ->
        "run!!"

Renamable = 
    set-name : (@name) ->
    get-name : -> @name ? @id


R = new Runnable
class A implements R, Renamable
    ->
        @id = Math.random! * 1000

a = new A
a.set-name "Achi"

console.log a.run!              # TypeError: Object #<A> has no method 'run'
```