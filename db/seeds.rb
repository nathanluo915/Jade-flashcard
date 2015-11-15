User.create(username: "Elephant_lover_322", email: "Eleforlife@gmail.com", password: "123")

Deck.create(name: "Elephants")
Deck.create(name: "Ruby Basics")
Deck.create(name: "Popcorn")
Deck.create(name: "Star Wars")

Card.create([{question: "Elephants can reach their tails by their noses.", answer: "false", deck_id: 1},
            {question: "An elephant's pregnancy lasts 20 months.", answer:"true", deck_id: 1},
            {question: "Elephants have no natural predators other than humans who hunt them for ivory.", answer: "true", deck_id: 1},
            {question: "Normal maximum lifespan in the wild 40-50 years.", answer: "false", deck_id: 1}])


Card.create([{question: "To create a second name for the variable or method.", answer: "alias", deck_id: 2},
             {question: "A command that appends two or more objects together.", answer: "and", deck_id: 2},
             {question: "Designates code that must be run unconditionally at the beginning of the program before any other.", answer: "BEGIN", deck_id: 2},
             {question: "Delimits a \"begin\" block of code, which can allow the use of while and until in modifier position with multi-line statements.", answer: "begin", deck_id: 2},
             {question: "Gives an unconditional termination to a code block, and is usually placed with an argument.", answer: "break", deck_id: 2},
             {question: "starts a case statement; this block of code will output a result and end when it's terms are fulfilled, which are defined with when or else.", answer: "case", deck_id: 2},
             {question: "Opens a class definition block, which can later be reopened and added to with variables and even functions.", answer: "class", deck_id: 2},
             {question: "Used to define a function.", answer: "def", deck_id: 2},
             {question: "A boolean logic function that asks whether or not a targeted expression refers to anything recognizable in Ruby; i.e. literal object, local variable that has been initialized, method name visible from the current scope, etc.", answer: "defined?", deck_id: 2},
             {question: "Paired with end, this can delimit a code block, much like curly braces; however, curly braces retain higher precedence.", answer: "do", deck_id: 2},
             {question: "Gives an \"otherwise\" within a function, if-statement, or for-loop, i.e. if cats = cute, puts \"Yay!\" else puts \"Oh, a cat.\"", answer: "else", deck_id: 2},
             {question: "Much like else, but has a higher precedence, and is usually paired with terms.", answer: "elsif", deck_id: 2},
             {question: "Designates, via code block, code to be executed just prior to program termination.", answer: "END", deck_id: 2},
             {question: "Marks the end of a while, until, begin, if, def, class, or other keyword-based, block-based construct.", answer: "end", deck_id: 2},
             {question: "Marks the final, optional clause of a begin/end block, generally in cases where the block also contains a rescue clause. The code in this term's clause is guaranteed to be executed, whether control flows to a rescue block or not.", answer: "ensure", deck_id: 2},
             {question: "denotes a special object, the sole instance of FalseClass. false and nil are the only objects that evaluate to Boolean falsehood in Ruby (informally, that cause an if condition to fail.)", answer: "false", deck_id: 2},
             {question: "A loop constructor; used in for-loops.", answer: "for", deck_id: 2},
             {question: "Ruby's basic conditional statement constructor.", answer: "if", deck_id: 2},
             {question: "Used with for, helps define a for-loop.", answer: "in", deck_id: 2},
             {question: "Opens a library, or module, within a Ruby Stream.", answer: "module", deck_id: 2},
             {question: "Bumps an iterator, or a while or until block, to the next iteration, unconditionally and without executing whatever may remain of the block.", answer: "next", deck_id: 2},
             {question: "A special \"non-object\"; it is, in fact, an object (the sole instance of NilClass), but connotes absence and indeterminacy. nil and false are the only two objects in Ruby that have Boolean falsehood (informally, that cause an if condition to fail).", answer: "nil", deck_id: 2},
             {question: "Boolean negation. i.e. not true # false, not 10 # false, not false # true.", answer: "not", deck_id: 2},
             {question: "Boolean or. Differs from || in that or has lower precedence.", answer: "or", deck_id: 2},
             {question: "Causes unconditional re-execution of a code block, with the same parameter bindings as the current execution.", answer: "redo", deck_id: 2},
             {question: "Designates an exception-handling clause that can occur either inside a begin<code>/<code>end block, inside a method definition (which implies begin), or in modifier position (at the end of a statement).", answer: "rescue", deck_id: 2},
             {question: "Inside a rescue clause, causes Ruby to return to the top of the enclosing code (the begin keyword, or top of method or block) and try executing the code again.", answer: "retry", deck_id: 2},
             {question: "Inside a method definition, executes the ensure clause, if present, and then returns control to the context of the method call. Takes an optional argument (defaulting to nil), which serves as the return value of the method. Multiple values in argument position will be returned in an array.", answer: "return", deck_id: 2},
             {question: "The \"current object\" and the default receiver of messages (method calls) for which no explicit receiver is specified. Which object plays the role of self depends on the context.", answer: "self", deck_id: 2},
             {question: "Called from a method, searches along the method lookup path (the classes and modules available to the current object) for the next method of the same name as the one being executed. Such method, if present, may be defined in the superclass of the object's class, but may also be defined in the superclass's superclass or any class on the upward path, as well as any module mixed in to any of those classes.", answer: "super", deck_id: 2},
             {question: "Optional component of conditional statements (if, unless, when). Never mandatory, but allows for one-line conditionals without semi-colons.", answer: "then", deck_id: 2},
             {question: "The sole instance of the special class TrueClass. true encapsulates Boolean truth; however, <emph>all</emph> objects in Ruby are true in the Boolean sense (informally, they cause an if test to succeed), with the exceptions of false and nil.", answer: "true", deck_id: 2},
             {question: "Undefines a given method, for the class or module in which it's called. If the method is defined higher up in the lookup path (such as by a superclass), it can still be called by instances classes higher up.", answer: "undef", deck_id: 2},
             {question: "The negative equivalent of if. i.e. unless y.score > 10 puts \"Sorry; you needed 10 points to win.\" end.", answer: "unless", deck_id: 2},
             {question: "The inverse of while: executes code until a given condition is true, i.e., while it is not true. The semantics are the same as those of while.", answer: "until", deck_id: 2},
             {question: "Same as case.", answer: "when", deck_id: 2},
             {question: "Takes a condition argument, and executes the code that follows (up to a matching end delimiter) while the condition is true.", answer: "while", deck_id: 2},
             {question: "Called from inside a method body, yields control to the code block (if any) supplied as part of the method call. If no code block has been supplied, calling yield raises an exception.", answer: "yield", deck_id: 2}])
