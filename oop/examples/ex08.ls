# class Person
class Person
    (name) ->
        @name = name

    sayHello : ->
        console.log("hello, i'm", @name)

    walk : ->
        console.log(@name, "is walking")


# class BasketballPlayer
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
