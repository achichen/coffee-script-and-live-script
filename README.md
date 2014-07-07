# JavaScript

- JavaScript @ 1995. 
  - Released by Sun+Netscape
  - Supported by Netscape Navigator
  - Was named Mocha, later LiveScript
- JScript @ 1996, a compatible dialect developed by Microsoft
- ECMAScript: a standard for JavaScript, JScript, ActionScript(Adobe)
  - 1st Edition @ June 1997
  - 2nd Edition @ June 1998
  - 3rd Edition @ December 1999
  - ~~4th Edition~~ abandoned.
  - ==5th Edition @ Decemeber 2009==
  - ==5.1th Edition @ June 2011==
  - 6th Edition (Harmony): in progress, target at December 2014
    - class
    - generator
    - enhanced for loop (comprehensions)
    - modules
    - See [ECMA 6 Features](https://github.com/lukehoban/es6features) for more.

---

# CoffeeScript
- @ 2009
- Current version: 1.7.1
- Inspired by Python, Ruby, Haskell
- *.coffee

## Install CoffeeScript
```sh
npm install -g coffee-script
```

## Use CoffeeScript at backend
### Option 1: run .coffee directly
```sh
coffee ex03.coffee
```

### Option 2: precompile CoffeeScript
You may precompile .coffee into .js at build time.
```sh
coffee -c ex03.coffee
```

### Option 3: compile on-demand
boot.js
```javascript
var coffee = require("coffee-script");
coffee.register();

// This will try to load my_module.js or my_module.coffee
var my_module = require("./my_module");
```
NOTE: This method is deprecated in recent Node.js version.

## Use CoffeeScript in browser

### Option 1: precompile CoffeeScript

### Option 2: compile on-demand
While it's not recommended for serious use.
```html
<script src="http://coffeescript.org/extras/coffee-script.js"></script>
<script type="text/coffeescript">
	console.log "Hello coffee in browser"
</script>
```

---

# LiveScript
- @ 2011
- Current version: 1.2.0
- Inspired by Coco, CoffeeScript, Haskell, F#
- *.ls
- Similar to Coffee, but with much more rich expression.
- Who is using LiveScript
  - [g0v.tw](https://github.com/g0v/g0v.tw)
  - [clkao](https://github.com/clkao)

## Install LiveScript
```sh
npm install -g LiveScript
```

## Use LiveScript at backend
### Option 1: run .ls directly
```sh
lsc ex03.ls
```

### Option 2: precompile CoffeeScript
You may precompile .ls into .js at build time.  
```sh
lsc -c ex03.ls
```

## Use LiveScript in browser

### Option 1: precompile LiveScript

### Option 2: compile on-demand
```html
<script src="livescript.js"></script>
<script type="text/ls">
	console.log "Hello livescript in browser"
</script>
```

---

# Repository language on Github: @Jul 2014
Reference to [GitHub Archive](http://www.githubarchive.org/):

|Rank|Language|Repo num|
|:--:|:------:|:------:|
|1| JavaScript|	359305|
|2| Ruby|262522|
|3| Java|	208004|
|4| PHP|	162506|
|5| Python|	141198|
|6| C++|	113066|
|7| C|	88870|
|8| Objective-C|	46040|
|9|	C#|	41732|
|10|	Shell|	39704|
|11|	CSS|	37299|
|12|	Perl|	21223|
|13|	CoffeeScript|	17078|
|14|	Scala|	11560|
|15|	Go|	9964|
|16|	VimL|	9130|
|17|	Haskell|	6608|
|18|	Clojure|	6475|
|19|	Puppet|	6366|
|20|	Prolog|	5907|
|21|	Lua|	5794|
|22|	Groovy|	4942|
|23|	R|	4395|
|...|||
|27|	Erlang|	2947|
|28|	ActionScript|	2757|
|...|||
|31|	Dart|	1614|
|...|||
|59|	LiveScript|	349|
|...|||

See also [Programming Language Popularity Chart](http://langpop.corger.nl/)