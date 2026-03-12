"var" @keyword
"Var" @keyword
"VAR" @keyword

"if" @keyword
"If" @keyword
"IF" @keyword

"elseif" @keyword
"Elseif" @keyword
"ElseIf" @keyword
"ELSEIF" @keyword

"else" @keyword
"Else" @keyword
"ELSE" @keyword

"switch" @keyword
"Switch" @keyword
"SWITCH" @keyword

"case" @keyword
"Case" @keyword
"CASE" @keyword

"for" @keyword
"For" @keyword
"FOR" @keyword

"foreach" @keyword
"Foreach" @keyword
"ForEach" @keyword
"FOREACH" @keyword

"return" @keyword
"Return" @keyword
"RETURN" @keyword

"break" @keyword
"Break" @keyword
"BREAK" @keyword

"exit" @keyword
"Exit" @keyword
"EXIT" @keyword

"and" @operator
"And" @operator
"AND" @operator

"or" @operator
"Or" @operator
"OR" @operator

"to" @keyword
"To" @keyword
"TO" @keyword

"in" @keyword
"In" @keyword
"IN" @keyword

"step" @keyword
"Step" @keyword
"STEP" @keyword

(boolean) @constant
(number) @number
(string) @string
(string_content) @string
(string_content_single) @string
(comment) @comment

"=" @operator
"==" @operator
"!=" @operator
">" @operator
"<" @operator
">=" @operator
"<=" @operator
"+" @operator
"-" @operator
"*" @operator
"/" @operator
"+=" @operator
"-=" @operator
"*=" @operator
"/=" @operator
"&&" @operator
"||" @operator
"^" @operator
"!" @operator

(function_call
  function: (identifier) @function)

(function_call
  function: (member_expression
    property: (identifier) @function.method))

(variable_declaration
  name: (identifier) @variable)

(member_expression
  property: (identifier) @property)

(member_expression
  object: (identifier) @variable)

(subscript_expression
  object: (identifier) @variable)

(identifier) @variable

"(" @punctuation.bracket
")" @punctuation.bracket
"{" @punctuation.bracket
"}" @punctuation.bracket
"[" @punctuation.bracket
"]" @punctuation.bracket
"," @punctuation.delimiter
"." @punctuation.delimiter