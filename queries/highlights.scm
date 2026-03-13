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

; Booleans
(boolean) @boolean

; Literals
(number) @number
(string) @string

; Comments
(comment) @comment

; Operators
[
  "=" "==" "!="
  ">" "<" ">=" "<="
  "+" "-" "*" "/"
  "+=" "-=" "*=" "/="
  "&&" "||" "^" "!"
  "and" "or"
] @operator

; Declarations
(variable_declaration
  name: (identifier) @variable)

; Assignments parsed as binary_expression in this grammar
(binary_expression
  left: (primary_expression
    (identifier) @variable)
  operator: "=")

; Member/subscript base objects
(member_expression
  object: (identifier) @variable)

(subscript_expression
  object: (identifier) @variable)

; Properties
(member_expression
  property: (identifier) @property)

; Function calls
(function_call
  function: (identifier) @function)

(function_call
  function: (member_expression
    property: (identifier) @function))

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
