# tree-sitter-wds

Tree-sitter grammar for **Widget Designer Script (WDS)**.

Widget Designer Script is used in **Widget Designer** to build interactive control panels, automate devices over TCP/UDP, and create custom control interfaces for AV and show-control workflows.

## Scope

This repository contains the **grammar source** for WDS.

It is intended for:

- grammar development
- parser generation
- syntax testing
- integration with editors that use Tree-sitter

This repository is **not** the Zed extension itself.

The Zed extension lives in a separate repository:

`https://github.com/auslinx73/zed-wds-extension`

## Repository structure

```text
tree-sitter-wds/
├── grammar.js
├── package.json
├── tree-sitter.json
├── queries/
│   └── highlights.scm
├── src/
│   ├── grammar.json
│   ├── node-types.jsonNEW
│   ├── parser.c
│   └── tree_sitter/
│       ├── alloc.h
│       ├── array.h
│       └── parser.h
└── test/
    └── corpus/
        └── basic.txt
```

## Supported syntax

The grammar is intended to support the core WDS constructs, including:

- comments: `// ...`
- variable declarations: `var name = value`
- assignments
- `If / ElseIf / Else`
- `Switch / Case / Case Else`
- `for / foreach`
- `return`, `break`, `exit`
- function calls: `Func(args)`
- member access: `obj.Method`, `obj.Property`
- array and list access: `list[index]`
- strings, numbers, booleans
- operators such as `+ - * / < > <= >= == != && ||`

## Requirements

- Node.js
- npm
- Tree-sitter CLI

## Development

Install dependencies:

```bash
npm install
```

Generate parser files:

```bash
npx tree-sitter generate
```

Run grammar tests:

```bash
npx tree-sitter test
```

Parse a sample file:

```bash
npx tree-sitter parse path/to/file.wds
```

## Using this grammar in Zed

The Zed extension is stored separately in:

`https://github.com/auslinx73/zed-wds-extension`

That extension references this grammar in its `extension.toml`:

```toml
[grammars.wds]
repository = "https://github.com/auslinx73/tree-sitter-wds"
rev = "<commit-hash>"
```

Typical update flow:

1. Make grammar changes in `tree-sitter-wds`
2. Run `npx tree-sitter generate`
3. Run `npx tree-sitter test`
4. Commit and push `tree-sitter-wds`
5. Copy the new commit hash
6. Update `rev` in `zed-wds-extension/extension.toml`
7. Rebuild the extension in Zed

## Notes

- `grammar.js` is the source of truth for the grammar
- files under `src/` are generated artifacts and should stay in sync with `grammar.js`
- `queries/highlights.scm` should match the actual node types produced by the grammar
- if highlighting behaves unexpectedly, verify the parse tree first before changing editor-side queries

## Contributing

If you find a WDS construct that parses incorrectly, open an issue with a minimal code sample.

## Related repository

- Zed extension: `https://github.com/auslinx73/zed-wds-extension`
