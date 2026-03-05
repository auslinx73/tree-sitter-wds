# WDS — Widget Designer Script для Zed

Поддержка языка Widget Designer Script (.wds) для редактора Zed.

## Структура проекта

```
tree-sitter-wds/          ← Грамматика Tree-sitter (отдельный репо)
├── grammar.js             ← Описание грамматики
├── package.json
├── queries/
│   └── highlights.scm     ← Подсветка синтаксиса
└── test/corpus/
    └── basic.txt          ← Тесты

zed-wds-extension/         ← Расширение для Zed
├── extension.toml         ← Манифест расширения
└── languages/wds/
    ├── config.toml        ← Конфигурация языка
    ├── highlights.scm     ← Подсветка синтаксиса
    ├── indents.scm        ← Автоотступы
    └── brackets.scm       ← Парные скобки
```

## Установка

### Шаг 1: Опубликовать грамматику Tree-sitter

```bash
cd tree-sitter-wds
npm install
npx tree-sitter generate
npx tree-sitter test

# Создать репо на GitHub
git init
git add .
git commit -m "Initial tree-sitter-wds grammar"
git remote add origin https://github.com/YOUR_USERNAME/tree-sitter-wds.git
git push -u origin main
```

### Шаг 2: Обновить extension.toml

В файле `zed-wds-extension/extension.toml` заполнить:
- `repository` — URL твоего репо tree-sitter-wds
- `commit` — хеш коммита после пуша

### Шаг 3: Установить расширение в Zed

**Вариант A — локальная разработка:**
```bash
# Скопировать в папку расширений Zed
# Windows:
xcopy /E zed-wds-extension %APPDATA%\Zed\extensions\installed\wds\

# Linux/macOS:
cp -r zed-wds-extension ~/.config/zed/extensions/installed/wds/
```

**Вариант B — опубликовать:**
```bash
cd zed-wds-extension
git init
git add .
git commit -m "WDS extension for Zed"
git push  # на GitHub
# Затем подать PR в https://github.com/zed-industries/extensions
```

## Поддерживаемый синтаксис

- ✅ Комментарии: `// ...`
- ✅ Переменные: `var name = value`
- ✅ If / Else
- ✅ Switch / Case / Case Else
- ✅ return
- ✅ Вызовы функций: `Func(args)`
- ✅ Методы: `obj.Method`, `obj.Property`
- ✅ Массивы: `list[index]`
- ✅ Строки, числа, boolean
- ✅ Операторы: `+ - * / < > <= >= == != && ||`
- ✅ Подсветка встроенных WD/Tcp/Udp функций
- ✅ Подсветка Math как built-in типа
