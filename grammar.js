/// <reference types="tree-sitter-cli/dsl" />
// @ts-check

// Tree-sitter grammar for Isadora Widget Designer Script (.wds)

module.exports = grammar({
  name: 'wds',

  extras: $ => [
    /\s/,
    $.comment,
  ],

  conflicts: $ => [
    [$.primary_expression, $.lvalue],
    [$.member_expression, $.lvalue],
  ],

  word: $ => $.identifier,

  rules: {
    source_file: $ => repeat($._statement),

    // ─── Statements ───────────────────────────────────────────────

    _statement: $ => choice(
      $.variable_declaration,
      $.assignment_statement,
      $.if_statement,
      $.switch_statement,
      $.return_statement,
      $.expression_statement,
    ),

    variable_declaration: $ => seq(
      'var',
      field('name', $.identifier),
      optional(seq('=', field('value', $._expression))),
    ),

    assignment_statement: $ => seq(
      field('left', $.lvalue),
      '=',
      field('right', $._expression),
    ),

    lvalue: $ => choice(
      $.identifier,
      $.member_expression,
      $.subscript_expression,
    ),

    if_statement: $ => seq(
      'If',
      field('condition', $._expression),
      field('consequence', $.block),
      optional(seq('Else', field('alternative', $.block))),
    ),

    switch_statement: $ => seq(
      'Switch',
      field('value', $._expression),
      '{',
      repeat($.case_clause),
      optional($.case_else_clause),
      '}',
    ),

    case_clause: $ => seq(
      'Case',
      field('value', $._expression),
      repeat($._statement),
    ),

    case_else_clause: $ => seq(
      'Case',
      'Else',
      repeat($._statement),
    ),

    return_statement: $ => prec.right(seq(
      'return',
      optional($._expression),
    )),

    expression_statement: $ => $._expression,

    block: $ => seq(
      '{',
      repeat($._statement),
      '}',
    ),

    // ─── Expressions ──────────────────────────────────────────────

    _expression: $ => choice(
      $.primary_expression,
      $.binary_expression,
      $.unary_expression,
    ),

    primary_expression: $ => choice(
      $.identifier,
      $.number,
      $.string,
      $.boolean,
      $.function_call,
      $.member_expression,
      $.subscript_expression,
      $.parenthesized_expression,
    ),

    binary_expression: $ => choice(
      // Arithmetic
      prec.left(4, seq(field('left', $._expression), field('operator', '*'), field('right', $._expression))),
      prec.left(4, seq(field('left', $._expression), field('operator', '/'), field('right', $._expression))),
      prec.left(3, seq(field('left', $._expression), field('operator', '+'), field('right', $._expression))),
      prec.left(3, seq(field('left', $._expression), field('operator', '-'), field('right', $._expression))),
      // Comparison
      prec.left(2, seq(field('left', $._expression), field('operator', '<'), field('right', $._expression))),
      prec.left(2, seq(field('left', $._expression), field('operator', '>'), field('right', $._expression))),
      prec.left(2, seq(field('left', $._expression), field('operator', '<='), field('right', $._expression))),
      prec.left(2, seq(field('left', $._expression), field('operator', '>='), field('right', $._expression))),
      prec.left(2, seq(field('left', $._expression), field('operator', '=='), field('right', $._expression))),
      prec.left(2, seq(field('left', $._expression), field('operator', '!='), field('right', $._expression))),
      // Logical
      prec.left(1, seq(field('left', $._expression), field('operator', '&&'), field('right', $._expression))),
      prec.left(1, seq(field('left', $._expression), field('operator', '||'), field('right', $._expression))),
    ),

    unary_expression: $ => choice(
      prec.right(5, seq(field('operator', '-'), field('operand', $._expression))),
      prec.right(5, seq(field('operator', '!'), field('operand', $._expression))),
    ),

    member_expression: $ => prec.left(8, seq(
      field('object', $._expression),
      '.',
      field('property', $.identifier),
    )),

    subscript_expression: $ => prec.left(8, seq(
      field('object', $._expression),
      '[',
      field('index', $._expression),
      ']',
    )),

    function_call: $ => prec.left(9, seq(
      field('function', choice(
        $.identifier,
        $.member_expression,
      )),
      '(',
      optional(field('arguments', $.argument_list)),
      ')',
    )),

    argument_list: $ => seq(
      $._expression,
      repeat(seq(',', $._expression)),
    ),

    parenthesized_expression: $ => seq(
      '(',
      $._expression,
      ')',
    ),

    // ─── Literals ─────────────────────────────────────────────────

    number: $ => token(choice(
      /\d+/,
      /\d+\.\d+/,
    )),

    string: $ => seq(
      '"',
      repeat(choice(
        $.string_content,
        $.escape_sequence,
      )),
      '"',
    ),

    string_content: $ => token.immediate(prec(1, /[^"\\]+/)),

    escape_sequence: $ => token.immediate(seq('\\', /./)),

    boolean: $ => choice('true', 'false'),

    // ─── Tokens ───────────────────────────────────────────────────

    comment: $ => token(seq('//', /.*/)),

    identifier: $ => /[a-zA-Z_][a-zA-Z0-9_]*/,
  },
});