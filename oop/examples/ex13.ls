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