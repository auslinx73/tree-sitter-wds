; Keywords
[
  "var"
] @keyword

[
  "if"
  "If"
  "IF"
] @keyword

[
  "elseif"
  "ElseIf"
  "Elseif"
  "ELSEIF"
] @keyword

[
  "else"
  "Else"
  "ELSE"
] @keyword

[
  "switch"
  "Switch"
  "SWITCH"
] @keyword

[
  "case"
  "Case"
  "CASE"
] @keyword

[
  "for"
  "For"
  "FOR"
] @keyword

[
  "foreach"
  "Foreach"
  "ForEach"
  "FOREACH"
] @keyword

[
  "return"
  "Return"
  "RETURN"
] @keyword

[
  "break"
  "Break"
  "BREAK"
] @keyword

[
  "exit"
  "Exit"
  "EXIT"
] @keyword

[
  "to"
  "To"
  "TO"
] @keyword

[
  "in"
  "In"
  "IN"
] @keyword

[
  "step"
  "Step"
  "STEP"
] @keyword

; Literals
(boolean) @constant
(number) @number
(string) @string
(string_content) @string
(string_content_single) @string

; Comments
(comment) @comment

; Operators
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
"and" @operator
"or" @operator

; Variables
(variable_declaration
  name: (identifier) @variable)

(assignment_statement
  left: (lvalue
    (identifier) @variable))

(member_expression
  object: (identifier) @variable)

(subscript_expression
  object: (identifier) @variable)

(identifier) @variable

; Properties and methods
(member_expression
  property: (identifier) @property)

(function_call
  function: (member_expression
    property: (identifier) @function.method))

; Function calls
(function_call
  function: (identifier) @function)

; Built-in WD/TCP/UDP functions
((function_call
  function: (identifier) @function.builtin)
  (#match? @function.builtin "^(WD|Tcp|Udp)"))

; Punctuation
"(" @punctuation.bracket
")" @punctuation.bracket
"[" @punctuation.bracket
"]" @punctuation.bracket

"{" @punctuation.special
"}" @punctuation.special

"," @punctuation.delimiter
"." @punctuation.delimiter
; Fallback keyword highlighting when parser treats keywords as identifiers
((identifier) @keyword
  (#match? @keyword "^(var|Var|VAR|if|If|IF|elseif|ElseIf|Elseif|ELSEIF|else|Else|ELSE|switch|Switch|SWITCH|case|Case|CASE|for|For|FOR|foreach|Foreach|ForEach|FOREACH|return|Return|RETURN|break|Break|BREAK|exit|Exit|EXIT|to|To|TO|in|In|IN|step|Step|STEP)$"))

; Fallback built-in function highlighting
((identifier) @function.builtin
  (#match? @function.builtin "^(WD|Tcp|Udp)[A-Za-z0-9_]*$"))
