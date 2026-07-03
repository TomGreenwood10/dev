---
name: python-conventions
descroption: Guidance on python coding conventions. Use whenever implimenting, writing or refactoring python code.
---

Apply the following conventions to any new or altered code. Don't add or apply this to code that is not being altered. For example if a user is asking for a modification to a function - don't add a docstring to the module unless explicitly asked or the module is being created by the action.

## Docstrings
- Use docstrings on all functions, classes, and modules.
- Use Google style with a max line length of 80 characters on the docstring.
- The opening description must start on the same line as the opening `"""`.
- In the `Args` section, indicate whether each argument is required or optional. Do not include data types.

## Code conventions
- Prefer functional programming over object-oriented programming, but adapt to the idiomatic style of any third-party libraries where appropriate.
- Use full type hints on all function signatures, including return types.
- Prefix non-public module-level functions (those not part of the modules's public API) with an underscore.
- Prefer explicit error handling over `try/except` blocks; use `try/except` only when necessary.
- Apply defensive programming techniques (input validation, guard clauses) on public functions; omit them in private/helper functions.
- Always apply code formatting with ruff with default settings unless instructed by the user to do otherwise. If ruff is not installed ask the user if you can install it.
