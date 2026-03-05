; ─── Keywords ──────────────────────────────────────────────────
"var" @keyword
"If" @keyword.conditional
"Else" @keyword.conditional
"Switch" @keyword.conditional
"Case" @keyword.conditional
"return" @keyword.return

; ─── Literals ──────────────────────────────────────────────────
(number) @number
(string) @string
(string_content) @string
(escape_sequence) @string.escape
(boolean) @boolean

; ─── Comments ──────────────────────────────────────────────────
(comment) @comment

; ─── Operators ─────────────────────────────────────────────────
(binary_expression
  operator: _ @operator)
(unary_expression
  operator: _ @operator)

"=" @operator

; ─── Functions ─────────────────────────────────────────────────
(function_call
  function: (identifier) @function.call)

(function_call
  function: (member_expression
    property: (identifier) @function.method))

; ─── Built-in WD functions ─────────────────────────────────────
((function_call
  function: (identifier) @function.builtin)
  (#match? @function.builtin "^(WD|Tcp|Udp)"))

; ─── Math built-in ─────────────────────────────────────────────
((member_expression
  object: (identifier) @type.builtin)
  (#eq? @type.builtin "Math"))

; ─── Variables ─────────────────────────────────────────────────
(variable_declaration
  name: (identifier) @variable)

(assignment_statement
  left: (lvalue
    (identifier) @variable))

; ─── Member access ─────────────────────────────────────────────
(member_expression
  property: (identifier) @property)

(member_expression
  object: (identifier) @variable)

; ─── Subscript ─────────────────────────────────────────────────
(subscript_expression
  object: (identifier) @variable)

; ─── Parameters (identifiers in general) ───────────────────────
(identifier) @variable

; ─── Punctuation ───────────────────────────────────────────────
"(" @punctuation.bracket
")" @punctuation.bracket
"{" @punctuation.bracket
"}" @punctuation.bracket
"[" @punctuation.bracket
"]" @punctuation.bracket
"," @punctuation.delimiter
"." @punctuation.delimiter
