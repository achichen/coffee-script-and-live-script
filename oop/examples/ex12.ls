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
