; Keywords
[
  "var" "Var" "VAR"
] @keyword

[
  "if" "If" "IF"
  "elseif" "ElseIf" "Elseif" "ELSEIF"
  "else" "Else" "ELSE"
  "switch" "Switch" "SWITCH"
  "case" "Case" "CASE"
] @keyword.control.conditional

[
  "for" "For" "FOR"
  "foreach" "Foreach" "ForEach" "FOREACH"
  "to" "To" "TO"
  "in" "In" "IN"
  "step" "Step" "STEP"
] @keyword.control.repeat

[
  "return" "Return" "RETURN"
  "break" "Break" "BREAK"
  "exit" "Exit" "EXIT"
] @keyword.return

; Literals
(boolean) @constant.builtin.boolean
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

; Variables
(variable_declaration
  name: (identifier) @variable)

(assignment_statement
  left: (lvalue
    (identifier) @variable))

(subscript_expression
  object: (identifier) @variable)

(member_expression
  object: (identifier) @variable)

; Properties
(member_expression
  property: (identifier) @property)

; Built-in calls
((function_call
  function: (identifier) @function.builtin)
  (#match? @function.builtin "^(WD|Tcp|Udp|Osc|ArtNet|Serial|Http|Json|Xml|File|Timer|Math)[A-Za-z0-9_]*$"))

; Normal function calls
(function_call
  function: (identifier) @function)

; Method calls
(function_call
  function: (member_expression
    property: (identifier) @function.method))

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
