; Keywords
[
  "var" "Var" "VAR"
  "if" "If" "IF"
  "elseif" "ElseIf" "Elseif" "ELSEIF"
  "else" "Else" "ELSE"
  "switch" "Switch" "SWITCH"
  "case" "Case" "CASE"
  "for" "For" "FOR"
  "foreach" "Foreach" "ForEach" "FOREACH"
  "return" "Return" "RETURN"
  "break" "Break" "BREAK"
  "exit" "Exit" "EXIT"
  "to" "To" "TO"
  "in" "In" "IN"
  "step" "Step" "STEP"
] @keyword

; Literals
(string) @string
(comment) @comment
(number) @number
(boolean) @constant

; Declared variables
(variable_declaration
  name: (identifier) @variable)

; Function calls
(function_call
  function: (identifier) @function)

; Method calls
(function_call
  function: (member_expression
    property: (identifier) @function))

; Member access
(member_expression
  object: (identifier) @variable)

(member_expression
  property: (identifier) @property)

; Array/list access
(subscript_expression
  object: (identifier) @variable)

; Operators
[
  "=" "==" "!="
  ">" "<" ">=" "<="
  "+" "-" "*" "/"
  "+=" "-=" "*=" "/="
  "&&" "||" "^" "!"
  "and" "or"
] @operator

; Punctuation
[
  "(" ")" "[" "]"
] @punctuation.bracket

[
  "{" "}"
] @punctuation.special

[
  "," "."
] @punctuation.delimiter
