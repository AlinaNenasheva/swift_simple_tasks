Swift language provides you  an opportunity to create **varaibles** (changable) and **constants** (non-changable) with a value of a particular type.
We can declare constants with the `let` keyword and varaibles with the `var` keyword. 
For example:
`let maximaumNumberOfLoginAttempts = 10`
`var currentLoginAttempt = 0` 
It's highly recommended to create constants when you are ensured that you won't change the value further in programm. If in doubt, use variables. Anyway if you don't change your variable Xcode will send you warning notification and ask to change var to let. You can define multiple variables  or constants in single line, separated by commas:
`var x = 0 y = 0 z = 0` 

You can provide a **type annotation** when you daclare a constant or variable to be clear about the kind of values the constnt or variable can store.
Example:
`let maximaumNumberOfLoginAttempts: Int`
`maximaumNumberOfLoginAttempts = 10`
You can declare nultiple variables of the same type in single line, separated by commas as well:
`var x, y, z: Int` 

Constant and variable names can't contain whitespace characters, mathematical symbols, arrows, privare-use Unicode scalar values, or line- and box-drawing characters. Nor can they begin with a bumber, although numbers may be included elsewhere withtin the name. More guidelines to name variables and more  you can look up in [API Design Guidelines](https://swift.org/documentation/api-design-guidelines/).

To print the current value of constant or variable you can use `print(_: separator :terminator:)` function. Separator and terminator have default values (whitespace and EOL symbol) therefore may be omitted. 

Swift uses **interpolation** to include the name of a constant or variable as a placeholder in a longer string, and to prompt Swift to replace it with the current value of that variable.
Example:
`print("Some text \(variable)")`

You can leave comments to make your code more comprehensive like this:
`//this is single-line comment`
or this:
`/*this is multiline comment`
`hi*/`
or even like this:
`/*this is parent comment`
`/*this is nested comment*/`
`this is the end of parent commet*/`

Swift has several data types such as **Integers**. The language provide a few integer types separated by unsigned (positive or zero) or  signed (positive, zero, or negative) and size(8, 16, 32, 64 bit forms):
* Int8
* Int16
* Int16
* Int64
* UInt8
* UInt16
* Uint32
* UInt64

Standart Int type depends on your platform's native word size (it may be Int32 or Int 64).

Floating-point numbers are represented by **Double**(64-bit) and **Float**(32-bit) types.

Swift is a *type-safe* language. That means that Swift performs type checks when compiling your code and let you fix errors in the development process. You don't have to specify the type of value you need because Swift uses *type inference* to work out the appropriate type. 


